import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able group by", async () => {
    const products = await prismaClient.product.findMany({
      where: {
        OR: [{ name: "A" }, { name: "B" }],
      },
      orderBy: [
        {
          name: "desc",
        },
      ],
    });

    expect(products).toHaveLength(2);
    expect(products[0].name).toBe("B");
    expect(products[1].name).toBe("A");
  });
});
