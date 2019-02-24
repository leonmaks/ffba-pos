"use strict"

const { sjoin } = require("tittles")

const pos = require("../sql/pos")


const selectAll = async (db, params) => db.any(pos.select_all, {
  ...params,
  where: sjoin(params.where, " AND ", "WHERE "),
})


const selectByIdent = async (db, params) => db.one(pos.select_by_ident, params)



module.exports = {

  selectAll,
  selectByIdent,
}




//   try {

//     return await db.one(pos.select_by_ident, params)

//   } catch (e_) {

//     throw e_

//     //   if (e_ instanceof QueryResultError) {
//     //     // A query returned unexpected number of records, and thus rejected;

//     //     // we can check the error code, if we want specifics:
//     //     if(err.code === qrec.noData) {
//     //         // expected some data, but received none;
//     //     }

//     //     // If you write QueryResultError into the console,
//     //     // you will get a nicely formatted output.

//     //     console.log(err);

//     //     // See also: err, e.query, e.params, etc.
//     // }
//     //   console.error("errorrrr=", e_)

//   }
// }


// const updateOnOpen = async (db, params) => db.none(pos.update_on_open, params)
//   "UPDATE ffba_pos SET last_open_dt = now() WHERE id = ${id}", params
// )
