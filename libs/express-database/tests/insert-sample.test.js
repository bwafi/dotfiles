import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able to execute sql", async () => {
    const id = "1";
    const name = "Syahroni Bawafi";

    const impacted =
      await prismaClient.$executeRaw`INSERT INTO sample(id,name) VALUES (${id}, ${name})`;

    expect(impacted).toBe()
  });
});
