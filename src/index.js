"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var body_parser_1 = __importDefault(require("body-parser"));
var cors_1 = __importDefault(require("cors"));
var passport_1 = __importDefault(require("passport"));
var config_1 = __importDefault(require("./config"));
var routes_1 = __importDefault(require("./routes"));
var morgan_1 = __importDefault(require("./middlewares/morgan"));
var logger_1 = __importDefault(require("./utils/logger"));
var app = (0, express_1.default)();
app.use(body_parser_1.default.urlencoded({ extended: false }));
app.use(express_1.default.json());
app.use((0, cors_1.default)());
app.use(passport_1.default.initialize());
app.use(morgan_1.default);
app.use("/api", routes_1.default);
var server = app.listen(config_1.default.appPort, function () {
    logger_1.default.debug("Server is up and running @ http://localhost:" + config_1.default.appPort);
});
exports.default = server;
//# sourceMappingURL=index.js.map