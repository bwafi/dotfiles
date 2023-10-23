import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able count", async () => {
    const total = await prismaClient.product.aggregate({
      _min: {
        price: true,
      },
      _max: {
        price: true,
      },
      _avg: {
        price: true,
      },
    });

    expect(total._min.price).toBe(1000);
    expect(total._max.price).toBe(5000);
    expect(total._avg.price).toBe(3000);
  });
});
