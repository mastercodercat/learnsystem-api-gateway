"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var passport_1 = __importDefault(require("passport"));
var authentication_1 = require("../../controllers/authentication");
var validationRules_1 = require("../../utils/validationRules");
var validation_1 = require("../../middlewares/validation");
var requireAuth = passport_1.default.authenticate("jwt", { session: false });
var routes = express_1.default.Router();
routes.get("/verify", requireAuth, authentication_1.verify);
routes.post("/signin", (0, validationRules_1.signinRules)(), validation_1.validate, authentication_1.signIn);
routes.post("/signup", (0, validationRules_1.signupRules)(), validation_1.validate, authentication_1.signUp);
routes.post("/reset-password", (0, validationRules_1.resetPasswordRules)(), validation_1.validate, authentication_1.resetPassword);
exports.default = routes;
//# sourceMappingURL=index.js.map