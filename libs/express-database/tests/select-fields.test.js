import { prismaClient } from "../src/prisma-client";

describe("Prisma Client", () => {
  it("Should be able to read many with sorting", async () => {
    const customer = await prismaClient.customer.create({
      data: {
        id: "heny2",
        name: "Heny",
        email: "heny23@gmail.com",
        phone: "085877485734",
      },
      select: {
        id: true,
        name: true,
      },
    });

    expect(customer.id).toBe("heny2");
    expect(customer.name).toBe("Heny");
    expect(customer.email).toBeUndefined();
    expect(customer.phone).toBeUndefined();
  });

  it("Should be able to findMany with select", async () => {
    const customers = await prismaClient.customer.findMany({
      select: {
        id: true,
        name: true,
      },
    });

    for (const customer of customers) {
      expect(customer.id).toBeDefined();
      expect(customer.name).toBeDefined();
      expect(customer.email).toBeUndefined();
      expect(customer.phone).toBeUndefined();
    }
  });
});
