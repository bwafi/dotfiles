import express from "express";
import request from "supertest";

const app = express();

app.get("/products/:id", (req, res) => {
  res.send(`Product: ${req.params.id}`);
});

app.get("/categories/:id(\\d+)", (req, res) => {
  res.send(`Category: ${req.params.id}`);
});

test("test query", async () => {
  let response = await request(app).get("/products/wapi");
  expect(response.text).toBe("Product: wapi");

  response = await request(app).get("/categories/12");
  expect(response.text).toBe("Category: 12");
});
