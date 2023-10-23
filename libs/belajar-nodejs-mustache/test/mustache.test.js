import Mustache from "mustache";
import fs from "fs/promises";

test("Menggunakan Mustache", () => {
  const data = Mustache.render("Hello {{name}}", { name: "Wapi" });
  expect(data).toBe("Hello Wapi");
});

test("Menggunakan Mustache Cache", () => {
  Mustache.parse("Hello {{name}}");

  const data = Mustache.render("Hello {{name}}", { name: "Wapi" });
  expect(data).toBe("Hello Wapi");
});

test("Tags", () => {
  const data = Mustache.render("Hello {{name}}, my hobby is {{{hobby}}}", {
    name: "Wapi",
    hobby: "<b>Programming<b>",
  });
  expect(data).toBe("Hello Wapi, my hobby is <b>Programming<b>");
});

test("Nested Object", () => {
  const data = Mustache.render("Hello {{person.name}}", {
    person: {
      name: "Wapi",
    },
  });
  expect(data).toBe("Hello Wapi");
});

test("Mustache File", async () => {
  const helloTemplate = await fs
    .readFile("./templates/hello.mustache")
    .then((data) => data.toString());

  const data = Mustache.render(helloTemplate, {
    name: "Syahroni Bawafi",
  });

  console.log(data);
  expect(data).toContain("Syahroni Bawafi");
});
