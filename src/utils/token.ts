import jwt from "jsonwebtoken";
import path from "path";
import fs from "fs";
import { v2_users } from "@prisma/client";

import config from "../config";

export const generateToken = (user: v2_users) => {
  const pathToKey = path.join(__dirname, "../", config.appPrivKey);
  const PRIV_KEY = fs.readFileSync(pathToKey, "utf8");

  const timestamp = new Date().getTime();
  return jwt.sign({ sub: user.id, iat: timestamp }, PRIV_KEY, {
    expiresIn: config.expires,
    algorithm: "RS256",
  });
};

export const getPublicKey = () => {
  const pathToKey = path.join(__dirname, "../", config.appPubKey);
  return fs.readFileSync(pathToKey, "utf8");
};
