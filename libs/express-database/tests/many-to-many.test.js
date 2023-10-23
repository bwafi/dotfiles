import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("should be able to many to many with relation", async () => {
    const like = await prismaClient.like.create({
      data: {
        customer_id: "wapi",
        product_id: "P0003",
      },
      include: {
        customer: true,
        Product: true,
      },
    });

    console.info(like);
  });

  it("should be able to find many to many with include", async () => {
    const customer = await prismaClient.customer.findUnique({
      where: {
        id: "wapi",
      },
      include: {
        Like: {
          include: {
            Product: true,
          },
        },
      },
    });

    console.info(customer);
  });

  it("should be able to findmany many to many with include", async () => {
    const customer = await prismaClient.customer.findMany({
      where: {
        Like: {
          some: {
            Product: {
              name: {
                contains: "A",
              },
            },
          },
        },
      },

      include: {
        Like: {
          include: {
            Product: true,
          },
        },
      },
    });

    console.info(customer);
  });

  it("implicit relation", async () => {
    const customer = await prismaClient.customer.update({
      where: {
        id: "wapi",
      },

      data: {
        loves: {
          connect: [{ id: "P0001" }],
        },
      },

      include: {
        loves: true,
      },
    });

    console.log(customer);
  });
});
