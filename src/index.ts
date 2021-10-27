import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import passport from "passport";

import config from "./config";
import routes from "./routes";

import morgan from "./middlewares/morgan";

import Logger from "./utils/logger";

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.json());

// const corsOptions = {
//   origin: [process.env.ALLOWED_LOGIN_DOMAIN],
//   credentials: true, //access-control-allow-credentials:true
//   optionSuccessStatus: 200,
// };
// app.use(cors(corsOptions));
app.use(cors());
app.use(passport.initialize());

app.use(morgan);

app.get("/ping", (req, res) => {
  res.status(200).json({ result: "pong" });
});

app.use("/api", routes);

const server = app.listen(config.appPort, () => {
  Logger.debug(`Server is up and running @ http://localhost:${config.appPort}`);
});

export default server;
