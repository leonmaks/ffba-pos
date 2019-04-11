"use strict"

const bluebird = require("bluebird")

bluebird.config({
  longStackTraces: true, // TODO: WARNING: Setting this options in production may impact performance.
  // Enable cancellation
  cancellation: true,
  // Enable monitoring
  monitoring: false,
  warnings: false,
  // warnings: {
  //   wForgottenReturn: false,
  // },
})


const options = {

  promiseLib: bluebird,

  // query: (e) => {
  //   console.log(e.query) // TODO: ?
  // },

  // error: (err, e) => {
  //   if (err instanceof QueryResultError) {
  //     // A query returned unexpected number of records, and thus rejected;

  //     // // we can check the error code, if we want specifics:
  //     // if (err.code === qrec.noData) {
  //     //   // expected some data, but received none;
  //     // }

  //     // If you write QueryResultError into the console,
  //     // you will get a nicely formatted output.

  //     console.log(err)

  //     // See also: err, e.query, e.params, etc.
  //   }
  // },


  // Extending the database protocol with our custom repositories;
  // API: http://vitaly-t.github.io/pg-promise/global.html#event:extend
  // extend(obj, dc) {
  //   console.log("db.extend: obj=", obj, " dc=", dc)
  //   // Database Context (dc) is mainly useful when extending multiple databases
  //   // with different access API-s.

  //   // Do not use 'require()' here, because this event occurs for every task
  //   // and transaction being executed, which should be as fast as possible.
  //   // obj.users = new repos.Users(obj, pgp);
  //   // obj.products = new repos.Products(obj, pgp);
  // }

}


const monitor = require("pg-monitor")
monitor.setTheme("monochrome")
monitor.attach(options)


const { pgp } = require("pg-utl").init(options)



module.exports = pgp




// Possible alternative - enumerating all SQL files automatically ;)
// API: http://vitaly-t.github.io/pg-promise/utils.html#.enumSql


// // generating a recursive SQL tree for dynamic use of camelized names:
// const enumSql = require('pg-promise').utils.enumSql;

// module.exports = enumSql(__dirname, {recursive: true}, file => {
//     // NOTE: 'file' contains the full path to the SQL file, as we use __dirname for enumeration.
//     return new QueryFile(file, {
//         minify: true,
//         params: {
//             schema: 'public' // replace ${schema~} with "public"
//         }
//     });
// });
