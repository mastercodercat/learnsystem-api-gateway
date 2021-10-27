import bcrypt from "bcrypt";

const saltRounds = 10;

export const hashPassword = async (plainPassword: string) => {
  const hash = await bcrypt.hash(plainPassword, saltRounds);

  return hash;
};

export const hashPasswordSync = (password: string) => {
  return bcrypt.hashSync(password, saltRounds);
};

export const comparePasswords = async (
  plainPassword: string,
  hashedPassword: string
) => {
  const isMatch = await bcrypt.compare(plainPassword, hashedPassword);

  return isMatch;
};
