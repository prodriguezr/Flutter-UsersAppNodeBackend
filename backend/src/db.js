const mongoose = require('mongoose');

function connect() {
    mongoose.connect(process.env.MONGO, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    });

    console.log('DB is Connected');
}

module.exports = { connect }