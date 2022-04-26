const User = require('../models/user');
const Role = require('../models/role');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');

module.exports = {
  async getAll(req, res, next) {
    try {
      const data = await User.getAll();
      console.log(`Usuarios: ${data}`);
      return res.status(201).json(data);
    } catch (error) {
      console.log(`Error: ${error}`);
      return res.status(501).json({
        success: false,
        message: 'Data user gagal di load',
      });
    }
  },

  async register(req, res, next) {
    try {
      const user = req.body;
      const data = await User.create(user);

      await Role.create(data.id, 1); // ROLE FOR CLIENT

      return res.status(201).json({
        success: true,
        message: 'User baru berhasil di registrasi',
        data: data.id,
      });
    } catch (error) {
      console.log(`Error: ${error}`);
      return res.status(501).json({
        success: false,
        message: 'Terjadi kesalahan dalam registrasi user',
        error: error,
      });
    }
  },

  async login(req, res, next) {
    try {
      const email = req.body.email;
      const password = req.body.password;

      const myUser = await User.findByEmail(email);

      if (!myUser) {
        return res.status(401).json({
          success: false,
          message: 'Email tidak di temukan',
        });
      }

      if (User.isPasswordMatched(password, myUser.password)) {
        const token = jwt.sign(
          { id: myUser.id, email: myUser.email },
          keys.secretOrKey,
          {
            // expiresIn: (60*60*24) // 1 HORA
          }
        );
        const data = {
          id: myUser.id,
          name: myUser.name,
          lastname: myUser.lastname,
          email: myUser.email,
          phone: myUser.phone,
          image: myUser.image,
          session_token: `JWT ${token}`,
          roles: myUser.roles,
        };

        console.log(`Sent User ${data}`);

        return res.status(201).json({
          success: true,
          data: data,
          message: 'User Berhasil Login',
        });
      } else {
        return res.status(401).json({
          success: false,
          message: 'Username atau password salah',
        });
      }
    } catch (error) {
      console.log(`Error: ${error}`);
      return res.status(501).json({
        success: false,
        message: 'Terjadi Kesalahan ketika login',
        error: error,
      });
    }
  },
};
