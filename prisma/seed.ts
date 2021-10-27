import { PrismaClient, Prisma } from "@prisma/client";

import { importFromCSVToUsers } from "../src/utils/csv";

const prisma = new PrismaClient();

async function main() {
  console.log(`Start seeding ...`);

  await importFromCSVToUsers(
    "prisma/csv_arlingtonms_MindPrint_student_bulk_upload.csv"
  );

  await importFromCSVToUsers("prisma/csvselfe_group_nams_21-22 upload.csv");

  console.log(`Seeding finished.`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
