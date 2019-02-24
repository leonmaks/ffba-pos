// defs.js (repl) 190116_1800

"use strict"

const CLI_REPL_TABLE_PFX = "r$t__"
const CLI_REPL_TABLE_PFX_LEN = CLI_REPL_TABLE_PFX.length

const SRV_REPL_UP_TABLE_PFX = "r$u"
const SRV_REPL_DOWN_TABLE_PFX = "r$d"
const SRV_UPLD_TABLE_PFX = "r$_"

const REPL_COL_PFX = "r$_"

const REPL_COL_ID = { col_name: `${REPL_COL_PFX}id`, col_type: "serial" }
const REPL_COL_ID_NO_SEQ = { col_name: `${REPL_COL_PFX}id`, col_type: "integer" }
const REPL_COL_OP = { col_name: `${REPL_COL_PFX}op`, col_type: "character varying(1)" }
const REPL_COL_CREATE_DT = { col_name: `${REPL_COL_PFX}create_dt`, col_type: "timestamp" }

const REPL_FUNC_AI_PFX = "r$fai_"
const REPL_FUNC_AU_PFX = "r$fau_"
const REPL_FUNC_BD_PFX = "r$fbd_"

const REPL_TRIG_AI_PFX = "r$tai_"
const REPL_TRIG_AU_PFX = "r$tau_"
const REPL_TRIG_BD_PFX = "r$tbd_"

const REPL_OP_NEW = "N"
const REPL_OP_UPDATE = "U"
const REPL_OP_DELETE = "D"
const REPL_OP_INIT = "I"

const REPL_COLS = [
  REPL_COL_ID.col_name,
  REPL_COL_OP.col_name,
  REPL_COL_CREATE_DT.col_name,
]

// FIXME: change to 5000 for production
const UPLD_RECS_LIMIT = 100

const SITEGUID = "siteguid"

const VER_FD_COL = "fd"
const VER_TD_COL = "td"
const VER_TABLE_SFX = "_ver"


module.exports = {

  CLI_REPL_TABLE_PFX,
  CLI_REPL_TABLE_PFX_LEN,

  SRV_REPL_UP_TABLE_PFX,
  SRV_REPL_DOWN_TABLE_PFX,
  SRV_UPLD_TABLE_PFX,

  REPL_COL_PFX,

  REPL_COLS,
  REPL_COL_ID,
  REPL_COL_ID_NO_SEQ,
  REPL_COL_OP,
  REPL_COL_CREATE_DT,

  REPL_FUNC_AI_PFX,
  REPL_FUNC_AU_PFX,
  REPL_FUNC_BD_PFX,

  REPL_TRIG_AI_PFX,
  REPL_TRIG_AU_PFX,
  REPL_TRIG_BD_PFX,

  REPL_OP_NEW,
  REPL_OP_UPDATE,
  REPL_OP_DELETE,
  REPL_OP_INIT,

  UPLD_RECS_LIMIT,

  SITEGUID,

  VER_FD_COL,
  VER_TD_COL,
  VER_TABLE_SFX,

}
