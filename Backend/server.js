const express = require("express");
const bodyparser = require("body-parser");
const cors = require("cors");
const mysql = require("mysql2");
const port = 3001;

const expressApp = express();
expressApp.use(cors());
expressApp.use(bodyparser.json());

const db = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  user: "root",
  password: "",
  database: "crud_app",
});

db.getConnection((err, connection) => {
  if (err) {
    console.log("Error connecting to MySql");
    return;
  }
  console.log("Connected to MySql");
  connection.release();
});

expressApp.get("/", (req, res) => {
  res.send("Welcome");
});

expressApp.get("/user", (req, res) => {
  db.query("select * from userdata", (err, result) => {
    if (err) {
      res.status(500);
      return;
    }
    res.send(result);
  });
});

expressApp.post("/user", (req, res) => {
  const { name, email } = req.body;
  if (name != null && email != null) {
    db.query(
      "insert into userdata ( name, email ) values ( ?, ? )",
      [name, email],
      (err, result) => {
        if (err) {
          res.status(500);
          return;
        }
        res.send("Success");
      }
    );
  } else {
    res.status(500);
    return;
  }
});

expressApp.put("/user/:id", (req, res) => {
  const { name, email } = req.body;
  const id = req.params.id;
  if (name != null && email != null && id != null) {
    db.query(
      "update userdata set name = ?, email = ? where id = ?",
      [name, email, id],
      (err, result) => {
        if (err) {
          res.status(500);
          return;
        }
        res.send("Success");
      }
    );
  }
});

expressApp.delete("/user/:id", (req, res) => {
  const id = req.params.id;
  db.query("delete from userdata where id = ?", [id], (err, result) => {
    if (err) {
      res.status(500);
      return;
    }
    res.send("Success");
  });
});

expressApp.listen(port, () => {
  console.log("Server running on port", port);
});
