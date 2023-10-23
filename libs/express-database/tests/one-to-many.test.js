import { prismaClient } from "../src/prisma-client";

describe("relationship", () => {
  it("should be able to insert one to many with include", async () => {
    const comment = await prismaClient.comment.create({
      data: {
        customer_id: "wapi",
        title: "Title comment",
        description: "description comment",
      },
      include: {
        customer: true,
      },
    });

    console.log(comment);
  });

  it("should be able to insert one to many with relation", async () => {
    const customer = await prismaClient.customer.create({
      data: {
        id: "alex",
        name: "Alex",
        email: "alex@gmail.com",
        phone: "01928384931",
        Comment: {
          createMany: {
            data: [
              {
                title: "Comment 1",
                description: "description 1",
              },
              {
                title: "Comment 2",
                description: "description 2",
              },
              {
                title: "Comment 3",
                description: "description 3",
              },
            ],
          },
        },
      },
    });

    console.log(customer);
  });

  it("should be able to find many with relation", async () => {
    const customers = await prismaClient.customer.findMany({
      where: {
        Comment: {
          some: {
            title: {
              contains: "Comment",
            },
          },
        },
      },

      include: {
        Comment: true,
      },
    });

    console.log(customers)
  });
});
