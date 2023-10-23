import { PrismaClient } from "@prisma/client";

describe("Prisma client", () => {
  it("should be abble to connect", async () => {
    const prisma = new PrismaClient();
    await prisma.$connect;

    await prisma.$disconnect;
  });
});
