import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able group by", async () => {
    const results = await prismaClient.product.groupBy({
      by: ["category"],
      _min: {
        price: true,
      },
      _max: {
        price: true,
      },
      _avg: {
        price: true,
      },
      having: {
        price: {
          _avg: {
            gt: 3000,
          },
        },
      },
    });

    for (const item of results) {
      console.info(
        `Category: ${item.category}, min ${item._min.price}, max ${item._max.price}, avg ${item._avg.price}`,
      );
    }
  });
});
