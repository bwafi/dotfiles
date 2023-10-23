import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able to read many with sorting", async () => {
    const customers = await prismaClient.customer.findMany({
      skip: 0,
      take: 10,
      orderBy: [
        {
          name: "asc",
        },
        {
          email: "desc",
        },
      ],
    });

    for (const customer of customers) {
      console.info(customer.name);
    }
  });
});
