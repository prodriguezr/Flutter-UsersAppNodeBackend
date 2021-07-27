require('dotenv').config();
const app = require('./app');
const { connect } = require('./db');

async function main () {
    await connect();

    await app.listen(process.env.PORT);

    console.log('Server listening on port', process.env.PORT);
}

main();