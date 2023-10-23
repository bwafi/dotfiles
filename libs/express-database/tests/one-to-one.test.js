import { prismaClient } from "../src/prisma-client";

describe("relationship", () => {
  it("should be able to create one to one", async () => {
    const wallet = await prismaClient.wallet.create({
      data: {
        id: "wapi",
        customer_id: "wapi",
        belance: 1000000,
      },
      include: {
        customer: true,
      },
    });

    console.log(wallet);
  });

  it("should be able to create one to one relationship with relation", async () => {
    const customer = await prismaClient.customer.create({
      data: {
        id: "shaka",
        name: "shaka",
        phone: "081233456234",
        email: "shaka@gmail.com",
        wallet: {
          create: {
            id: "joko",
            belance: 2000000,
          },
        },
      },
      include: {
        wallet: true,
      },
    });

    console.log(customer);
  });

  it("should be able to find one to one", async () => {
    const customer = await prismaClient.customer.findUnique({
      where: {
        id: "wapi",
      },
      include: {
        wallet: true,
      },
    });

    console.log(customer);
  });

  it("should be to find many to find one to one", async () => {
    const customers = await prismaClient.customer.findMany({
      where: {
        wallet: {
          isNot: null,
        },
      },
      include: {
        wallet: true,
      },
    });

    console.log(customers);
  });
});
