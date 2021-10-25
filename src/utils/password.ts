import bcrypt from "bcrypt";

const saltRounds = 10;

export const hashPassword = async (plainPassword: string) => {
  const hash = await bcrypt.hash(plainPassword, saltRounds);

  return hash;
};

export const comparePasswords = async (
  plainPassword: string,
  hashedPassword: string
) => {
  const isMatch = await bcrypt.compare(plainPassword, hashedPassword);

  return isMatch;
};
