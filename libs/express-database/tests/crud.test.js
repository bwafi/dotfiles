import { prismaClient } from "../src/prisma-client.js";

describe("Crud prisma", () => {
  it("should be able to create customer", async () => {
    const customer = await prismaClient.customer.create({
      data: {
        id: "bawafi",
        name: "Syahroni Bawafi",
        email: "bawafi@gmail.com",
        phone: "088263478432",
      },
    });

    expect(customer.id).toBe("bawafi");
    expect(customer.name).toBe("Syahroni Bawafi");
    expect(customer.email).toBe("bawafi@gmail.com");
    expect(customer.phone).toBe("088263478432");
  });
});

describe("Crud prisma", () => {
  it("should be able to update customer", async () => {
    const customer = await prismaClient.customer.update({
      data: {
        name: "Syahroni Bawafi Programmer",
      },
      where: {
        id: "bawafi",
      },
    });

    expect(customer.id).toBe("bawafi");
    expect(customer.name).toBe("Syahroni Bawafi Programmer");
    expect(customer.email).toBe("bawafi@gmail.com");
    expect(customer.phone).toBe("088263478432");
  });
});

describe("Crud prisma", () => {
  it("should be able to find customer", async () => {
    const customer = await prismaClient.customer.findUnique({
      where: {
        id: "bawafi",
      },
    });

    expect(customer.id).toBe("bawafi");
    expect(customer.name).toBe("Syahroni Bawafi Programmer");
    expect(customer.email).toBe("bawafi@gmail.com");
    expect(customer.phone).toBe("088263478432");
  });
});

describe("Crud prisma", () => {
  it("should be able to delete customer", async () => {
    const customer = await prismaClient.customer.delete({
      where: {
        id: "bawafi",
      },
    });

    expect(customer.id).toBe("bawafi");
    expect(customer.name).toBe("Syahroni Bawafi Programmer");
    expect(customer.email).toBe("bawafi@gmail.com");
    expect(customer.phone).toBe("088263478432");
  });
});
