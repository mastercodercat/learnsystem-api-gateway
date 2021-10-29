import { Prisma, PrismaClient } from "@prisma/client";

import {
  hashPasswordMiddleware,
  softDeleteMiddleware,
} from "../middlewares/prisma";

const prisma = new PrismaClient();

async function main() {
  prisma.$use(hashPasswordMiddleware);
  prisma.$use(softDeleteMiddleware);
}

main();

export default prisma;
