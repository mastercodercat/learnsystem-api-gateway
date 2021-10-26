"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
exports.default = {
    // application configurations
    appName: process.env.APP_NAME || "MindPrint API Gateway",
    appPort: process.env.APP_PORT || 3000,
    appSecret: process.env.APP_SECRET || "",
    // database configurations
    databaseHost: process.env.DATABASE_HOST || "development.mindprintlearning.com",
    databasePort: process.env.DATABASE_PORT || 3306,
    databaseName: process.env.DATABASE_NAME || "application_dev",
    databaseUser: process.env.DATABASE_USERNAME || "root",
    databasePassword: process.env.DATABASE_PASSWORD || "yygn6%5BXkE%23vJbx",
};
//# sourceMappingURL=config.js.map