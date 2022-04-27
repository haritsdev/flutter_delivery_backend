const UsersController = require('../controllers/usersController');

module.exports = (app, upload) => {
  // TRAER DATOS
  app.get('/api/users/getAll', UsersController.getAll);
  app.get('/api/users/findById/:id', UsersController.findById);

  //* AUTH ROUTES
  app.post(
    '/api/users/create',
    upload.array('image', 1),
    UsersController.registerWithImage
  );
  app.post('/api/users/login', UsersController.login);

  //* UPDATE PROFILE
  app.put(
    '/api/user/update-profile',
    upload.array('image', 1),
    UsersController.updateProfile
  );
};
