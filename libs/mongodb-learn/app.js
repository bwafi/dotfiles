const mongoose = require("mongoose");
const express = require("express");
import cors from "cors";

main().catch((err) => console.log(err));

async function main() {
  await mongoose.connect("mongodb://127.0.0.1:27017/wapi");
}

const app = express();
const port = 3000;

// use engines template ejs
app.set("view engine", "ejs");
app.use(cors());

app.get("/", (req, res) => {
  const mahasiswa = [
    {
      nama: "Syahroni Bawafi",
      email: "syahroni@gmail.com",
    },
    {
      nama: "dani",
      email: "dani@gmail.com",
    },
  ];

  res.render("home", { nama: "syahroni", mahasiswa });
});

app.get("/about", (req, res) => {
  res.render("about");
});

app.get("/contact", (req, res) => {
  res.render("contact");
});

app.use("", (req, res) => {
  res.send("<h1>404</h1>");
});

app.listen(port, () => {
  console.log(`App run in ${port}`);
});
