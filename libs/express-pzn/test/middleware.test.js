import express from "express";
import request from "supertest";

const app = express();

const logger = (req, res, next) => {
  console.info(`Receive request: ${req.method} ${req.originalUrl}`);
  next();
};

const addPoweredHeader = (req, res, next) => {
  res.set("X-Powered-By", "Syahroni Bawafi");
  next();
};

const apiKeyMiddleware = (req, res, next) => {
  if (req.query.apikey) {
    next();
  } else {
    res.status(401).end();
  }
};

app.use(logger);
app.use(addPoweredHeader);
app.use(apiKeyMiddleware);
app.get("/", (req, res) => {
  res.send(`Hello Response`);
});

test("test query", async () => {
  let response = await request(app).get("/");
  response = await request(app).get("/").query({ apikey: "bla" });

  expect(response.get("X-Powered-By")).toBe("Syahroni Bawafi");
  expect(response.text).toBe("Hello Response");
  // expect(response.status).toBe(401);
  expect(response.status).toBe(200);
});
