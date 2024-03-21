const User = require('../models/user');

module.exports = {

    register (res,req){
        const user = req.body;
        User.create(user,(err,data) =>{

            if (err) {
                return res.status(501).json({
                    success: false,
                    message:'Hubo un error con el registro del usuario',
                    error: err
                });
            }
            
            return res.status(201).json({
                success: true,
                message: 'el registro se realizo correctamente',
                data: data
            });
        });
    }
}