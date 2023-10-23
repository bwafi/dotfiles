import { prismaClient } from "../src/prisma-client";

describe("Transaction", () => {
  it("should be sequential Transaction", async () => {
    const [wapi, jihan] = await prismaClient.$transaction([
      prismaClient.customer.create({
        data: {
          id: "wapi",
          name: "Wapi",
          email: "wapi@gmail.com",
          phone: "082341928293",
        },
      }),

      prismaClient.customer.create({
        data: {
          id: "jihan",
          name: "Jihan",
          email: "jihan@gmail.com",
          phone: "082372736592",
        },
      }),
    ]);

    expect(wapi.name).toBe("Wapi");
    expect(jihan.name).toBe("Jihan");
  });
});

describe("Transaction", () => {
  it("should be interactive Transaction", async () => {
    const [wapi, jihan] = await prismaClient.$transaction(async (prisma) => {
      const wapi = await prisma.customer.create({
        data: {
          id: "wapi2",
          name: "Wapi ganteng",
          email: "wapi2@gmail.com",
          phone: "082387928293",
        },
      });

      const jihan = await prisma.customer.create({
        data: {
          id: "jihan",
          name: "Jihan cantik",
          email: "jihan2@gmail.com",
          phone: "082329928293",
        },
      });

      return [wapi, jihan];
    });

    expect(wapi.name).toBe("Wapi ganteng");
    expect(jihan.name).toBe("Jihan cantik");
  });
});
