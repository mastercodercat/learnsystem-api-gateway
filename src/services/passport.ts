import passport from "passport";
import { Strategy as JwtStrategy, ExtractJwt } from "passport-jwt";

import db from "../db";
import { getPublicKey } from "../utils/token";

const jwtOptions = {
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: getPublicKey(),
  algorithms: ["RS256"],
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
