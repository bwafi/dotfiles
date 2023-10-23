import express from "express";
import request from "supertest";

const app = express();

app.get("/", (req, res) => {
  res.send(`Hello ${req.query.firstName} ${req.query.lastName}`);
});

test("test expressJS", async () => {
  const response = await request(app)
    .get("/")
    .query({ firstName: "Syahroni", lastName: "Bawafi" });
  expect(response.text).toBe("Hello Syahroni Bawafi");
});
