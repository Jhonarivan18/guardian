const db = require('../config/config')

const User = {};

User.create = (user,resut) =>{
    const sql = `
        INSERT INTO
            usuario( 
                email,
                name ,
                lastname,
                phone ,
                image ,
                password ,
                created_at,
                updated_at
                )
            VALUES(?,?,?,?,?,?,?,?)
    `;

    db.query(
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            user.password,
            new Date(),
            new Date()
        ],
        (err,res) =>{
            if (err){
                console.log("error", err);
                result(err,null);
            }
            else{
                console.log("id del nuvevo urusriao ", res.insertId);
                result(null,res.insertId);
            }
        }
    )
}