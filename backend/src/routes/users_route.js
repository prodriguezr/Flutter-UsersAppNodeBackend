const { Router } = require('express');

const { createFiveUsers, getUsers } = require('../controllers/users_controller');

const router = Router();

router.get('/api/users', getUsers);
router.get('/api/users/create', createFiveUsers);

module.exports = router;