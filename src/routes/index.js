"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var passport_1 = __importDefault(require("passport"));
require("../services/passport");
var auth_1 = __importDefault(require("./auth"));
var routes = express_1.default.Router();
var requireAuth = passport_1.default.authenticate("jwt", { session: false });
routes.get("/", requireAuth, function (req, res) {
    res.status(200).json({ message: req.user });
});
routes.use("/auth", auth_1.default);
exports.default = routes;
//# sourceMappingURL=index.js.map