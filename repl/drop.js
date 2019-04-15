// drop.js (repl) 190116_1800

"use strict"

const cli_objects_drop = require("./cli/objects_drop")
const srv_objects_drop = require("./srv/objects_drop")



// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (ctx, tables) => {

  await ctx.cli.db.tx("drop.cli", async cli_tx_ => {

    // CLIENT replication objects
    await cli_objects_drop(cli_tx_, tables)


    await ctx.srv.db.tx("drop.srv", async srv_tx_ => {

      // SERVER replication objects
      await srv_objects_drop(srv_tx_, ctx.cli.pos, tables)
    })

  })

}
