const CategoriesController = require('../controllers/categoriesController');
const passport = require('passport');

module.exports = (app) => {
  /**
   * *POST ROUTE
   */

  app.post(
    '/api/categories/create',
    passport.authenticate('jwt', { session: false }),
    CategoriesController.create
  );
};
