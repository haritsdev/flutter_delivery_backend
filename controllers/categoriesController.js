const Category = require('../models/category');

module.exports = {
  async create(req, res, next) {
    try {
      const category = req.body;
      console.log(`KATEGORI: ${category}`);
      const data = await Category.create(category);
      return res.status(501).json({
        success: true,
        message: 'Berhasil membuat kategori baru',
        data: data.id,
      });
    } catch (error) {
      console.log(`Error ${error}`);
      return res.status(501).json({
        success: false,
        message: 'error membuat kategori baru',
        error: error,
      });
    }
  },
};
