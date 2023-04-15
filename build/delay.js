"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.delay = void 0;
const delay = (milliseconds) => new Promise(resolve => setTimeout(resolve, milliseconds));
exports.delay = delay;
