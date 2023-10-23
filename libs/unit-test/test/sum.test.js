import { callMe, sayHelloAsync, sum } from "../src/sum";

test("test sum function", () => {
  const result = sum(1, 2);

  expect(result).toBe(3);
});

test("test toEqual", () => {
  let person = { id: "kko" };
  Object.assign(person, { name: "Eko" });

  expect(person).toEqual({ id: "eko", name: "Eko" });
});

test("Truthiness", () => {
  let value = null;
  expect(value).toBeNull();
  expect(value).toBeDefined();
  expect(value).toBeFalsy();

  value = undefined;
  expect(value).toBeUndefined();
});

test("function number", () => {
  const value = 2 + 2;
  expect(value).toBeGreaterThan(3);
  expect(value).toBeGreaterThanOrEqual(4);
  expect(value).toBeLessThan(5);
  expect(value).toBeLessThanOrEqual(4);
});

test("String Matcher", () => {
  const value = "Syahroni Bawafi";

  expect(value).toBe("Syahroni Bawafi");
  expect(value).not.toBe("Bawafi");
  expect(value).toEqual("Syahroni Bawafi");
  expect(value).toMatch(/wafi/);
});

test("Array Matcher", () => {
  const names = ["Syahroni", "Bawafi"];
  expect(names).toContain("Syahroni");
  expect(names).toEqual(["Syahroni", "Bawafi"]);

  const persons = [{ name: "Wapi" }, { name: "Jihan" }];

  expect(persons).toContainEqual({ name: "Jihan" });
  expect(persons).toEqual([{ name: "Wapi" }, { name: "Jihan" }]);
});

test("expection Matcher", () => {
  expect(() => callMe("Wapi")).toThrow();
});

test("async function", async () => {
  const result = await sayHelloAsync("Wapi");

  expect(result).toBe("Hello Wapi");
  await expect(sayHelloAsync("Wapi")).resolves.toBe("Hello Wapi");
});

beforeEach(() => {
  console.log("before each");
});

afterEach(() => {
  console.log("after each");
});

beforeAll(() => {
  console.log("before All");
});

afterAll(() => {
  console.log("after All");
});

test("test luar 1", () => {
  console.info("Test outer 1");
});

test("test luar 2", () => {
  console.info("Test outer 2");
});

describe("Inner scope", () => {
  beforeEach(() => {
    console.log("inner before each");
  });

  afterEach(() => {
    console.log("Inner after each");
  });

  beforeAll(() => {
    console.log("Inner before All");
  });

  afterAll(() => {
    console.log("Inner after All");
  });

  test("test luar 1", () => {
    console.info("Inner Test outer 1");
  });

  test("test luar 2", () => {
    console.info("Inner Test outer 2");
  });
});
