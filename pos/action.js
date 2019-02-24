// action.js pos 190122_1200

/* eslint-disable import/no-dynamic-require */
/* eslint-disable global-require */
/* eslint-disable no-case-declarations */
/* eslint-disable no-restricted-syntax */

"use strict"

const util = require("util")
const exec = util.promisify(require("child_process").exec)
const importLazy = require("import-lazy")(require)

// const path = require("path")
// const fs = require("fs")
// const fs_extra = require("fs-extra")

const error = importLazy("@tittles/error")

const {
  actionType,
  runMode,
  runStatus,
} = importLazy("./defs")

const {
  runSelect,
  runUpdate,
  runLogInsert,
} = importLazy("./dal/pos_action")


const os_command = async (command) => {

  try {
    return await exec(command)

  } catch (e_) {
    return e_
  }
}


const run = async (ctx) => {

  const run_list_ = await runSelect(ctx.srv.db, {
    pos_id: ctx.cli.pos.id,
    status_id_array: [runStatus.ACTIVE]
  })

  for await (const run_ of run_list_) {

    let result_

    const start_dt_ = new Date()

    switch (run_.type_id) {

      case actionType.OS_COMMAND:

        result_ = await os_command(run_.command)

        break

      case actionType.BUILT_IN:

        result_ = {}

        try {

          if (run_.command) {
            result_ = await require(run_.module)[run_.command](ctx)

          } else {
            result_ = await require(run_.module)(ctx)
          }

        } catch (e_) {
          result_.err = e_
          console.error(e_)
        }

        // this[run_.command]()

        // result_ = await os_command(run_.command)

        break

      default:
    }

    const end_dt_ = new Date()

    await runUpdate(ctx.srv.db, {
      id: run_.id,
      status_id: run_.mode_id === runMode.ONCE ? runStatus.DONE : run_.status_id,
    })

    let log_ = {
      run_id: run_.id,
      start_dt: start_dt_,
      end_dt: end_dt_,
    }

    if (result_) {
      log_ = {
        ...log_,
        code: result_.code || null,
        out: result_.out,
        err: error.print(result_.err),
      }
    }

    await runLogInsert(ctx.srv.db, log_)
  }
}



module.exports = {
  run,
}
