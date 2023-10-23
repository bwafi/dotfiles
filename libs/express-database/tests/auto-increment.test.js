import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able auto increment", async () => {
    const category = await prismaClient.category.create({
      data: {
        name: "Food",
      },
    });

    console.log(category);
    expect(category).toHaveProperty("id");
  });
});
