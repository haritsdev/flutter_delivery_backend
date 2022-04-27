const UsersController = require('../controllers/usersController');
const passport = require('passport');

module.exports = (app, upload) => {
  // TRAER DATOS
  app.get('/api/users/getAll', UsersController.getAll);
  app.get(
    '/api/users/findById/:id',
    passport.authenticate('jwt', { session: false }),
    UsersController.findById
  );

  //* AUTH ROUTES
  app.post(
    '/api/users/create',
    upload.array('image', 1),
    UsersController.registerWithImage
  );
  app.post('/api/users/login', UsersController.login);
  app.post('/api/users/logout', UsersController.logout);

  //* UPDATE PROFILE
  app.put(
    '/api/user/update-profile',
    passport.authenticate('jwt', { session: false }),
    upload.array('image', 1),
    UsersController.updateProfile
  );
};
