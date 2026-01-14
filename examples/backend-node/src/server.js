function insecure(input) {
  eval(input);
}

insecure("console.log('test')");
