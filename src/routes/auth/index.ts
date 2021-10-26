import express from "express";
import passport from "passport";

import {
  verify,
  signIn,
  signUp,
  resetPassword,
} from "../../controllers/authentication";
import {
  signinRules,
  signupRules,
  resetPasswordRules,
} from "../../utils/validationRules";
import { validate } from "../../middlewares/validation";

const requireAuth = passport.authenticate("jwt", { session: false });

const routes = express.Router();

routes.get("/verify", requireAuth, verify);
routes.post("/signin", signinRules(), validate, signIn);
routes.post("/signup", signupRules(), validate, signUp);
routes.post("/reset-password", resetPasswordRules(), validate, resetPassword);

export default routes;
