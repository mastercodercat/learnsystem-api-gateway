import fs from "fs";
import { parse } from "@fast-csv/parse";
import omit from "lodash/omit";

import db from "../db";

import { hashPasswordSync } from "./password";

interface User {
  first_name: string;
  last_name: string;
  gender: string;
  email: string;
  birthdate: string;
  username: string;
  password: string;
  student_id: string;
  group: string;
}

export const fetchCSV = (fileName: string) =>
  new Promise<User[]>((resolve, reject) => {
    const stream = fs.createReadStream(fileName);
    let csvData: User[] = [];

    const csvStream = parse({ headers: true })
      .on("data", (data: User) => {
        csvData.push(data);
      })
      .on("end", () => {
        csvData.shift();

        resolve(csvData);
      })
      .on("error", (err) => {
        reject(err);
      });

    stream.pipe(csvStream);
  });

export const importFromCSVToUsers = async (fileName: string) => {
  const usersData: User[] = await fetchCSV(fileName);

  const users = await db.v2_users.createMany({
    data: usersData.map((user) => {
      return {
        ...omit(user, ["student_id"]),
        role_level: 1,
        school_student_id: user.student_id,
      };
    }),
  });
};
