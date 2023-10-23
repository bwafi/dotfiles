import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.send("Hello World");
});

app.get("/wapi", (req, res) => {
  res.send("Hello Wapi");
});

app.listen(3000, () => {
  console.log("Server is running in port 3000");
});


