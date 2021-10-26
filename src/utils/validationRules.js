"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.resetPasswordRules = exports.signinRules = exports.signupRules = void 0;
var express_validator_1 = require("express-validator");
var signupRules = function () {
    return [
        (0, express_validator_1.body)("name").isString(),
        (0, express_validator_1.body)("email").isEmail(),
        (0, express_validator_1.body)("password").isLength({ min: 8 }),
    ];
};
exports.signupRules = signupRules;
var signinRules = function () {
    return [(0, express_validator_1.body)("email").isEmail(), (0, express_validator_1.body)("password").isString()];
};
exports.signinRules = signinRules;
var resetPasswordRules = function () {
    return [(0, express_validator_1.body)("email").isEmail()];
};
exports.resetPasswordRules = resetPasswordRules;
//# sourceMappingURL=validationRules.js.map