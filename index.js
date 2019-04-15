"use strict"

const fs = require("fs-extra")
const commandLineArgs = require("command-line-args")
const commandLineUsage = require("command-line-usage")

const { config, error } = require("tittles")
// TODO: refactor 'db' module
const pgp = require("./db")

const {
  MODULE_NAME,
  POS_HOME,
  POS_HOME_DEFAULT,
  command,
  SRV_DB_CONN_PARAMS,
} = require("./defs")

// const pos_open = require("./pos/open")
// const { deploy } = require("./pos/deploy")
// const { run } = require("./pos/action")
// const pos_close = require("./pos/close")

// // const create = require("@repl/create")
// // const drop = require("@repl/drop")

// // const status = require("@repl/status")

const upload = require("./repl/upload")

// process.on("unhandledRejection", error => {
//   console.error("unhandledRejection", error)
//   process.exit(error.code || 1)
// })

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

// const optionDefinitions = [
//   {
//     name: "help",
//     alias: "h",
//     type: Boolean,
//     description: "Display this usage guide."
//   },
//   {
//     name: "create",
//     alias: "c",
//     type: Boolean,
//     description: "Create database replication objects."
//   },
//   {
//     name: "drop",
//     alias: "d",
//     type: Boolean,
//     description: "Drop the database replication objects."
//   },
//   {
//     name: "sync-up",
//     type: Boolean,
//     description: "Sync POS up."
//   },
//   {
//     name: "sync-down",
//     type: Boolean,
//     description: "Sync POS down."
//   },
//   {
//     name: "run",
//     alias: "r",
//     type: Boolean,
//     description: "Run tasks."
//   },
//   {
//     name: "tables",
//     alias: "t",
//     type: String,
//     multiple: true,
//     description: "List of tables to proceed on.",
//     typeLabel: "<tables>"
//   },
//   {
//     name: "restore-to-local",
//     type: Boolean,
//     description: "Restore actual POS files into 'local-root'."
//   },
//   {
//     name: "pos",
//     type: String,
//     multiple: false,
//     description: "POS ident.",
//     typeLabel: "<pos-ident>"
//   },
//   {
//     name: "local-root",
//     type: String,
//     multiple: false,
//     description: "Local root directory.",
//     typeLabel: "<directory>"
//   },

//   {
//     name: "status",
//     alias: "s",
//     type: Boolean,
//     description: "Show status of the database replication objects."
//   },


//   // {
//   //   name: "timeout",
//   //   alias: "t",
//   //   type: Number,
//   //   description: "Timeout value in ms",
//   //   typeLabel: "<ms>"
//   // },
// ]

const main = async () => {

  // read config
  //
  const config_ = await config.read(MODULE_NAME)
  // TODO: +check if config_ is undefined
  console.log("config_=", config_)

  console.log("exitting with status 1 (interrupt)")
  return 1

  // run context
  //
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

    //   const options = commandLineArgs(optionDefinitions)

    //   if (options.help) {
    //     const usage = commandLineUsage([
    //       {
    //         header: "Typical Example",
    //         content: "A simple example demonstrating typical usage."
    //       },
    //       {
    //         header: "Options",
    //         optionList: optionDefinitions
    //       },
    //       {
    //         content: "Project home: {underline https://github.com/me/example}"
    //       }
    //     ])
    //     console.log(usage)
    //     return
    //   }

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








//   const ctx_ = {
//     srv: {
//       db: pgp({
//         connectionString: process.env[defs.SRV_DB_CONN_PARAMS],
//         idleTimeoutMillis: defs.SRV_DBC_IDLE_TIMEOUT_MILLIS
//       }),
//     },
//     cli: {
//       db: undefined,
//     },
//     home: process.env[defs.POS_HOME] || defs.POS_HOME_DEFAULT,
//   }

//   let command_ = defs.command.UNDEF

//   if (options.create) {
//     command_ = defs.command.REPL_OBJ_CREATE

//   } else if (options.drop) {
//     command_ = defs.command.REPL_OBJ_DROP

//   } else if (options["sync-up"]) {
//     command_ = defs.command.SYNC_UP

//   } else if (options["sync-down"]) {
//     command_ = defs.command.SYNC_DOWN

//   } else if (options["restore-to-local"]) {
//     command_ = defs.command.RESTORE_TO_LOCAL

//     if (!options.pos || !options["local-root"]) {
//       throw new Error("'restore-to-local' command requires 'pos' and 'local-root' to be defined")
//     }

//   } else if (options.status) {
//     command_ = defs.command.REPL_OBJ_STATUS

//   } else if (options.run) {
//     command_ = defs.command.RUN
//   }

//   if (!command_) {
//     command_ = defs.command.RUN
//   }

//   //
//   // Execute command
//   //

//   try {

//     // TODO:
//     // SESSION
//     //   DB
//     //     ...

//     //
//     // Retrieve POS information from server DB
//     //
//     ctx_.cli.pos = await pos_open(ctx_.srv.db, process.env[defs.POS_IDENT])
//     if (!ctx_.cli.pos) {
//       return
//     }

//     ctx_.session = ctx_.cli.pos.session

//     //
//     // Ensure defs.POS_HOME directory exists
//     //
//     await fs.ensureDir(ctx_.home)

//     //
//     // Update file tree
//     //
//     await deploy(ctx_.srv.db, ctx_.cli.pos, ctx_.home)

//     //
//     // Client DB connection
//     //
//     ctx_.cli.db = pgp({
//       connectionString: ctx_.cli.pos.connection_uri,
//       idleTimeoutMillis: defs.CLI_DBC_IDLE_TIMEOUT_MILLIS,
//     })

//     switch (command_) {

//       case defs.command.REPL_OBJ_CREATE:

//         //
//         // Create replication objects
//         //

//         const create = importLazy("./repl/create")

//         console.log("main: before CREATE")
//         await create(ctx_, options.tables)
//         console.log("main: after CREATE")

//         break

//       case defs.command.REPL_OBJ_DROP:

//         //
//         // Drop replication objects
//         //

//         const drop = importLazy("./repl/drop")

//         console.log("main: before DROP")
//         await drop(ctx_, options.tables)
//         console.log("main: after DROP")

//         break

//       case defs.command.SYNC_UP:

//         //
//         // Sync POS UP
//         //

//         const sync_up = importLazy("./repl/sync_up")

//         console.log("main: before SYNC UP")
//         await sync_up(ctx_)
//         // console.log("main: after DROP")

//         break

//       case defs.command.SYNC_DOWN:

//         //
//         // Sync POS down
//         //

//         const sync_down = importLazy("./repl/sync_down")

//         console.log("main: before SYNC DOWN")
//         await sync_down(ctx_)
//         // console.log("main: after DROP")

//         break

//       case defs.command.REPL_OBJ_STATUS:

//         //
//         // Show current status of the database replication objects
//         //

//         // await status(ctx_, options.tables)
//         break

//       case defs.command.RUN:

//         //
//         // Show current status of the database replication objects
//         //

//         console.log("main: run")

//         await run(ctx_)

//         break

//       default:
//         console.error("command undefined")
//     }

//   } catch (e_) {

//     const err_ = error(e_)
//     console.error("main:", err_)
//     ctx_.session.err = err_

//   } finally {

//     if (ctx_.session) {
//       await pos_close(ctx_.srv.db, ctx_.session)
//     }

//     // TODO: for any reason closing connections occuring before last statements update
//     //   // Close connections
//     //   ctx_.cli.db && ctx_.cli.db.$pool.end()
//     //   ctx_.srv.db && ctx_.srv.db.$pool.end()

//   }
// }


// if (!module.parent) { main() }
