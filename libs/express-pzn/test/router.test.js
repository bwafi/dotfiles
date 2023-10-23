import express from "express";
import request from "supertest";

const router = express.Router();
const app = express();

router.use((req, res, next) => {
  console.info(`Receive request: ${req.originalUrl}`);
  next();
});

router.get("/feature/a", (req, res) => {
  res.send("Feature A");
});

test("test expressJS", async () => {
  const featureenabled = true;
  if (featureenabled) {
    app.use(router);
  }

  const response = await request(app).get("/feature/a");
  expect(response.text).toBe("Feature A");
});
