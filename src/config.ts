import dotenv from "dotenv";

dotenv.config();

export default {
  // application configurations
  appName: process.env.APP_NAME || "API Gateway",
  appPort: process.env.APP_PORT || 3000,
  appPubKey: process.env.APP_PUB_KEY || "",
  appPrivKey: process.env.APP_PRIV_KEY || "",

  expires: process.env.EXPIRES_TOKEN || "1d",

  // database configurations
  databaseHost: process.env.DATABASE_HOST || "",
  databasePort: process.env.DATABASE_PORT || 3306,
  databaseName: process.env.DATABASE_NAME || "",
  databaseUser: process.env.DATABASE_USERNAME || "root",
  databasePassword: process.env.DATABASE_PASSWORD || "",
};
