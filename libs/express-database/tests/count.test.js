import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able count", async () => {
    const total = await prismaClient.customer.count({
      where: {
        name: "jihan",
      },
    });

    expect(total).toBe(1);
  });
});
