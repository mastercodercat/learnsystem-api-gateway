"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var morgan_1 = __importDefault(require("morgan"));
var logger_1 = __importDefault(require("../utils/logger"));
var stream = {
    // Use the http severity
    write: function (message) { return logger_1.default.http(message); },
};
var skip = function () {
    var env = process.env.NODE_ENV || "development";
    return env !== "development";
};
var morganMiddleware = (0, morgan_1.default)(":method :url :status :res[content-length] - :response-time ms", { stream: stream, skip: skip });
exports.default = morganMiddleware;
//# sourceMappingURL=morgan.js.map