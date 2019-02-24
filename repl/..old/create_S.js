const cli_objects_create = require("./cli/objects_create")
const srv_objects_create = require("./srv/objects_create")


// Create replication objects for (selected - if 'tables' defined) user tables
module.exports = async (ctx, tables) => {
  // const func__ = "repl/create"

  // CLIENT replication objects
  const created_ = await cli_objects_create(ctx.cli.db, tables)
  // console.log(`${func__}: created_=`, created_)

  // SERVER replication objects
  await srv_objects_create(ctx.srv.db, ctx.cli.pos, created_)

}
