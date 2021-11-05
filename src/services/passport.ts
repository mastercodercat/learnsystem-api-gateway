import passport from "passport";
import { Strategy as JwtStrategy } from "passport-jwt";
import { ExtractJwt } from "passport-jwt";

import db from "../db";
import config from "../config";

// setting the jwt strategy
const jwtOptions = {
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: config.appSecret,
};

const jwtLogin = new JwtStrategy(jwtOptions, async (payload, done) => {
  const user = await db.v2_users.findUnique({
    where: {
      id: payload.sub,
    },
  });

  if (user) {
    done(null, user);
  } else {
    done(null, false);
  }
});

// tell passport to use defined strategies:
passport.use(jwtLogin);
