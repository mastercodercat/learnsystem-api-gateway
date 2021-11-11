import express from "express";

import db from "../db";

import { comparePasswords } from "../utils/password";
import { generateToken } from "../utils/token";

export const signIn = async (req: express.Request, res: express.Response) => {
  const { email, password } = req.body;

  try {
    const user = await db.v2_users.findFirst({
      where: {
        email: {
          equals: email,
        },
      },
    });

    if (!user) {
      return res.status(401).json({ error: "Incorrect Credentials" });
    }

    const isMatch = await comparePasswords(password, user.password as string);

    if (isMatch) {
      const token = generateToken(user);

      return res.send({
        token,
        user,
      });
    } else {
      return res.status(401).json({ error: "Incorrect Credentials" });
    }
  } catch (error) {
    console.log(error);
    return res.status(401).json({ error: "Incorrect Credentials" });
  }
};

export const signUp = async (req: express.Request, res: express.Response) => {
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    return res
      .status(422)
      .send({ error: "Username, email and password must be provided" });
  }

  const existingUser = await db.v2_users.findFirst({
    where: {
      email: email,
    },
  });

  if (existingUser) {
    return res.status(422).send({ error: "Email is aleready in use..." });
  }

  const user = await db.v2_users.create({
    data: {
      username: name,
      email,
      password,
    },
  });

  return res.json({ user, token: generateToken(user) });
};

export const verify = (req: express.Request, res: express.Response) => {
  return res.json({ user: req.user });
};

export const resetPassword = async (
  req: express.Request,
  res: express.Response
) => {
  const { email } = req.body;

  const user = await db.v2_users.findFirst({
    where: {
      email: email,
    },
  });

  if (!user) {
    return res.status(401).json({ error: "Incorrect Credentials " });
  }

  await db.v2_users.update({
    where: { id: user.id },
    data: { password: "password" },
  });

  return res.status(200).json({ message: "Successfully updated password." });
};
