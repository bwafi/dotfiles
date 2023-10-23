import express from "express";
import request from "supertest";
import cookieParser from "cookie-parser";

const app = express();

app.use(express.json());
app.use(cookieParser("SECRETKEY"));

app.post("/", (req, res) => {
  const name = req.body.name;
  res.cookie("Login", name, { path: "/", signed: true });
  res.send(`Hello ${name}`);
});

test("test query", async () => {
  const response = await request(app).post("/").send({ name: "Wapi" });
  console.info(response.get("Set-Cookie").toString());
  expect(response.get("Set-Cookie").toString()).toContain("Wapi");
  expect(response.text).toBe("Hello Wapi");
});
