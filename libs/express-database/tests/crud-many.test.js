import { prismaClient } from "../src/prisma-client";

describe("Transaction", () => {
  it("should be to creat many", async () => {
    const { count } = await prismaClient.customer.createMany({
      data: [
        {
          id: "shaka",
          email: "shaka@gmail.com",
          name: "Shaka",
          phone: "088289454432",
        },
        {
          id: "amel",
          name: "Amel",
          email: "amel@gmail.com",
          phone: "082303989352",
        },
      ],
    });

    expect(count).toBe(2);
  });

  it("should be to update many", async () => {
    const { count } = await prismaClient.customer.updateMany({
      data: {
        name: "shaka",
      },
      where: {
        name: "arshaka",
      },
    });

    expect(count).toBe(3);
  });

  it("should be to delete many", async () => {
    const { count } = await prismaClient.customer.deleteMany({
      where: {
        name: "shaka",
      },
    });

    expect(count).toBe(3);
  });

  it("should be to read many", async () => {
    const customer = await prismaClient.customer.findMany({});

    expect(customer).toBe(3);
  });

  it("should be to create many", async () => {
    const { count } = await prismaClient.product.createMany({
      data: [
        {
          id: "P0001",
          name: "A",
          price: 1000,
          stock: 100,
          category: "K1",
        },
        {
          id: "P0002",
          name: "B",
          price: 2000,
          stock: 200,
          category: "K1",
        },
        {
          id: "P0003",
          name: "C",
          price: 3000,
          stock: 300,
          category: "K1",
        },
        {
          id: "P0004",
          name: "D",
          price: 4000,
          stock: 400,
          category: "K2",
        },
        {
          id: "P0005",
          name: "E",
          price: 5000,
          stock: 500,
          category: "K2",
        },
      ],
    });

    expect(count).toBe(5);
  });
});
