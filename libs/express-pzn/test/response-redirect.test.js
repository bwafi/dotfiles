import express from "express";
import request from "supertest";

const app = express();

app.get("/", (req, res) => {
  res.set({
    "X-Powered-By": "Syahroni Bawafi",
    "X-Author": "Wapi",
  });
  res.send("Hello Response");
});

test("test query", async () => {
  const response = await request(app).get("/");
  expect(response.text).toBe("Hello Response");
  expect(response.get("X-Powered-By")).toBe("Syahroni Bawafi");
});
