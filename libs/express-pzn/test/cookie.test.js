import express from "express";
import request from "supertest";
import cookieParser from "cookie-parser";

const app = express();

app.use(express.json());
app.use(cookieParser());

app.post("/", (req, res) => {
  const name = req.body.name;
  res.cookie("login", name, { path: "/" });
  res.send(`Hello ${name}`);
});

test("test query", async () => {
  const response = await request(app).post("/").send({ name: "Wapi" });
  expect(response.get("Set-Cookie").toString()).toContain("Wapi");
  expect(response.text).toBe("Hello Wapi");
});
