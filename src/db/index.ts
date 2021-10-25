import { Prisma, PrismaClient } from "@prisma/client";
import { hashPassword } from "../utils/password";

const prisma = new PrismaClient();

async function main() {
  prisma.$use(async (params, next) => {
    if (params.model === Prisma.ModelName.users) {
      if (params.action == "create") {
        params.args.data.password = await await hashPassword(
          params.args.data.password
        );
      }
    }
    return next(params);
  });
}

main();

export default prisma;
