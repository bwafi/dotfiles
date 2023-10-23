import express from "express";
import request from "supertest";

const app = express();

const requestTimeMiddleware = (req, res, next) => {
  req.requestTime = Date.now();
  next();
};

app.use(requestTimeMiddleware);
app.get("/", (req, res) => {
  res.send(`Hello Today Is ${req.responseTime}`);
});

test("test query", async () => {
  const response = await request(app).get("/");
  expect(response.text).toBe(`Hello Today Is`);
  console.log(response.text);
});
