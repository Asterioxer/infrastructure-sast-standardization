app.get("/test", (req, res) => {
  const fn = new Function(req.query.code);
  fn();
  res.send("ok");
});
