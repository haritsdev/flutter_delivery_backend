const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const users = require('./routes/usersRoutes');

const PORT = process.env.PORT || 5456;
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors());
app.disable('x-powered-by');
app.set('port', PORT);

app.get('/', (req, res) => {
  res.send(`Route backend here`);
});

app.get('/test', (req, res) => {
  res.send(`Route backend here test`);
});

/**
 * *LIST OF USER ROUTES
 */
users(app);

//*Error handling
app.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status || 500).send(err.stack);
});

module.exports = { app: app, server: server };

server.listen(PORT, () => console.log(`Server is running on port:${PORT}`));

//* 200 - Request Success
//* 404 - Request URL Not Found
//* 500 - Request Internal Error Server
