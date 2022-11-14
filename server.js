'use strict';

const express = require('express');

// Constants
const PORT = 5000;
const HOST = '0.0.0.0';
const envr = process.env.NODE_ENV || DEVorPOD;

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World on ');
  res.send(`Running on http://${envr}:${PORT}`);
  console.log(`Running on http://${envr}:${PORT}`);
});

app.listen(PORT, HOST, () => {
  console.log(`Running ${process.env.NODE_ENV} on http://${HOST}:${PORT}`);
});
