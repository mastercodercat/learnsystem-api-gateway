import { body } from "express-validator";

export const signupRules = () => {
  return [
    body("name").isString(),
    body("email").isEmail(),
    body("password").isLength({ min: 8 }),
  ];
};

export const signinRules = () => {
  return [body("email").isEmail(), body("password").isString()];
};

export const resetPasswordRules = () => {
  return [body("email").isEmail()];
};
