import express from "express";
import jwt from "jsonwebtoken";
import { users } from "@prisma/client";

import db from "../db";
import config from "../config";
import { comparePasswords } from "../utils/password";

const tokenForUser = (user: users) => {
  const timestamp = new Date().getTime();
  return jwt.sign({ sub: user.id, iat: timestamp }, config.appSecret);
};

export const signIn = async (req: express.Request, res: express.Response) => {
  const { email, password } = req.body;

  try {
    const user = await db.users.findFirst({
      where: {
        email: {
          equals: email,
        },
      },
    });

    if (!user) {
      return res.status(401).json({ error: "Incorrect Credentials" });
    }

    const isMatch = await comparePasswords(password, user.password);
    if (isMatch) {
      return res.send({
        token: tokenForUser(user),
        user: user,
      });
    } else {
      return res.status(401).json({ error: "Incorrect Credentials" });
    }
  } catch (error) {
    return res.status(401).json({ error: "Incorrect Credentials" });
  }
};

export const signUp = async (req: express.Request, res: express.Response) => {
  const { name, email, password } = req.body;
  console.log(req.body);

  if (!name || !email || !password) {
    return res
      .status(422)
      .send({ error: "Username, email and password must be provided" });
  }

  const existingUser = await db.users.findFirst({
    where: {
      email: email,
    },
  });

  if (existingUser) {
    return res.status(422).send({ error: "Email is aleready in use..." });
  }

  const user = await db.users.create({
    data: {
      name,
      email,
      password,
    },
  });

  return res.json({ user, token: tokenForUser(user) });
};

export const verify = (req: express.Request, res: express.Response) => {
  return res.json({ user: req.user });
};
