"use strict"

require("module-alias/register")

const commandLineArgs = require("command-line-args")
const commandLineUsage = require("command-line-usage")

const importLazy = require("import-lazy")(require)

const { config, error } = require("tittles")
const pgp = require("./db")

const {
  MODULE_NAME,
  POS_HOME,
  POS_HOME_DEFAULT,
  command,
  SRV_DB_CONN_PARAMS,
} = require("./defs")

const upload = importLazy("@repl/upload")

const optionDefinitions = [
  {
    name: "help",
    alias: "h",
    type: Boolean,
    description: "Display this usage guide."
  },
  {
    name: "upload",
    alias: "u",
    type: Boolean,
    description: "Upload replication changes to server."
  },
  {
    name: "points",
    alias: "P",
    type: String,
    multiple: true,
    description: "Points of Sales (list).",
    typeLabel: "<points>"
  },
  {
    name: "tables",
    alias: "T",
    type: String,
    multiple: true,
    description: "Tables (list).",
    typeLabel: "<tables>"
  },
]

const main = async () => {

  // read config
  //
  const config_ = await config.read(MODULE_NAME)
  // TODO: +check if config_ is undefined
  console.log("config_=", config_)

  console.log("exitting with status 1 (interrupt)")
  return 1

  const ctx = {
    srv: {
      db: undefined,
    },
    cli: {
      db: undefined,
    },
    home: process.env[POS_HOME] || POS_HOME_DEFAULT,
  }

  try {

    //
    // Parse command line options
    //
    const options = commandLineArgs(optionDefinitions)

    let command_
    // let options_

    if (options.upload) {

      command_ = command.UPLOAD
    }

    if (!command_) {
      const usage = commandLineUsage([
        {
          header: "Typical Example",
          content: "A simple example demonstrating typical usage."
        },
        {
          header: "Options",
          optionList: optionDefinitions
        },
        {
          content: "Project home: {underline https://github.com/me/example}"
        }
      ])
      console.log(usage)
      return
    }

    //
    // Establish connection to server
    //
    ctx.srv.db = pgp(process.env[SRV_DB_CONN_PARAMS])

    //
    // Execute
    //
    switch (command_) {

      case command.UPLOAD:

        // console.log("before UPLOAD: pos=", options.points, "tables=", options.tables)
        await upload(ctx.srv.db, { points: options.points, tables: options.tables })
        // console.log("after UPLOAD")

        break

      default:
    }

  } catch (e_) {
    console.error("admin:", error.print(e_, "\n"))

  } finally {

    // TODO: later - when session will be implemented
    // if (ctx_.session) {
    //   await pos_close(ctx_.srv.db, ctx_.session)
    // }

    // Close connections
    ctx.cli.db && ctx.cli.db.$pool.end()
    ctx.srv.db && ctx.srv.db.$pool.end()
  }
}

if (!module.parent) { main() }
