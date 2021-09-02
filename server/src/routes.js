const express = require('express');

const routes = express.Router();

const User = require('./controllers/users_controller');

//Users routes
routes.post('/api/users', User.create);
routes.get('/api/users', User.index);
routes.get('/api/users.details/:_id', User.details);
routes.delete('/api/users', User.delete);
routes.put('/api/users', User.update);



module.exports = routes;