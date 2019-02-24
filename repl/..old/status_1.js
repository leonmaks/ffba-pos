const cli_table_list = require("./cli/table_list")


module.exports = async (ctx, tables) => {
  const func__ = "repl/status"

  console.log(`${func__}: tables`, tables)

  // Share connection throughout further queries
  await ctx.cli.db.task(async c_ => {

    const table_list_ = await cli_table_list(c_, tables)

    console.log(`${func__}: tables`, table_list_)
  })

}
