const faker = require('faker');
const User = require('../models/User');

const getUsers = async (req, res) => {
    const users = await User.find();

    res.status(200).json({
        status: 200,
        msg: 'OK',
        results: {
            users: (!users) ? [] : users
        },
    });
}

const createFiveUsers = async (req, res) => {
    for (let index = 0; index < 5; index++) {
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar(),
        });        
    }

    res.status(200).json({
        status: 200,
        msg: 'Five users created',
    });
}

module.exports = {
    createFiveUsers,
    getUsers,
}