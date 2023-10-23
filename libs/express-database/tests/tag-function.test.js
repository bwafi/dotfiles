const tagFunction = (array, ...args) => {
  console.log(array);
  console.log(args);
};

test("tag function", () => {
  const name = "Wapi";

  tagFunction`Hello ${name}!, how are you`;
});

test("tag function sql", () => {
  const name = "Wapi";
  const age = 21;

  tagFunction`SELECT * FROM users WHERE name = ${name} AND age = ${age}`;
});
