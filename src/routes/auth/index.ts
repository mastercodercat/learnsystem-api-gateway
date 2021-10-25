import express from "express";
import passport from "passport";

import { verify, signIn, signUp } from "../../controllers/authentication";

const requireAuth = passport.authenticate("jwt", { session: false });

const routes = express.Router();

routes.get("/verify", requireAuth, verify);
routes.post("/signin", signIn);
routes.post("/signup", signUp);

export default routes;
