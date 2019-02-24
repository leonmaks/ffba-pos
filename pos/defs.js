// defs.js (pos) 190116_1800

"use strict"

const pathType = {
  FILE: 1,
  DIRECTORY: 2,
}

const deployStatus = {
  NO_ACTION: 1,
  TO_DEPLOY: 2,
  DEPLOYED: 3,
  TO_DELETE: 4,
  DELETED: 5,
  ERROR: 6,
}

const actionType = {
  OS_COMMAND: 1,
  BUILT_IN: 2,
}

const runMode = {
  ONCE: 1,
  MULI: 2,
}

const runStatus = {
  ACTIVE: 1,
  DONE: 2,
  ON_HOLD: 2,
}


module.exports = {
  pathType,
  deployStatus,
  actionType,
  runMode,
  runStatus,
}
