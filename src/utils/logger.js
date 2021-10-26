"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var winston_1 = __importDefault(require("winston"));
var winston_daily_rotate_file_1 = __importDefault(require("winston-daily-rotate-file"));
var levels = {
    error: 0,
    warn: 1,
    info: 2,
    http: 3,
    debug: 4,
};
var level = function () {
    var env = process.env.NODE_ENV || "development";
    var isDevelopment = env === "development";
    return isDevelopment ? "debug" : "warn";
};
var colors = {
    error: "red",
    warn: "yellow",
    info: "green",
    http: "magenta",
    debug: "white",
};
winston_1.default.addColors(colors);
var format = winston_1.default.format.combine(winston_1.default.format.timestamp({ format: "YYYY-MM-DD HH:mm:ss:ms" }), winston_1.default.format.colorize({ all: true }), winston_1.default.format.printf(function (info) { return info.timestamp + " " + info.level + ": " + info.message; }));
var transports = [
    new winston_1.default.transports.Console(),
    new winston_daily_rotate_file_1.default({
        dirname: "logs",
        filename: "application-%DATE%.log",
        datePattern: "YYYY-MM-DD",
        zippedArchive: true,
        maxSize: "20m",
        level: level(),
    }),
];
var Logger = winston_1.default.createLogger({
    level: level(),
    levels: levels,
    format: format,
    transports: transports,
});
exports.default = Logger;
//# sourceMappingURL=logger.js.map