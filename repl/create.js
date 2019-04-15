// create.js (repl) 190116_1800

"use strict"

const cli_objects_create = require("./cli/objects_create")
const srv_objects_create = require("./srv/objects_create")



// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (ctx, tables) => {
  // const func__ = "repl.create"

  // console.log(func__, "CREATE")
  // console.error(func__, "CREATE - ERROR")

  await ctx.cli.db.tx("create.cli", async cli_tx_ => {

    // CLIENT replication objects
    const created_ = await cli_objects_create(cli_tx_, tables)


    await ctx.srv.db.tx("create.srv", async srv_tx_ => {

      // // SERVER replication objects
      await srv_objects_create(srv_tx_, ctx.cli.pos, created_)
    })

  })

}
