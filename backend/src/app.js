const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const app = express();

// Middlewares
middlewares();
// Routes
routes();

// Middlewares
function middlewares() {
    app.use(morgan('dev'));
    app.use(cors());
}

// Routes
function routes() {
    app.use(require('./routes/users_route'));
}

module.exports = app;