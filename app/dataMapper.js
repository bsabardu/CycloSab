const client = require('./database');


exports.getAllProducts = (callback) => {
    client.query('SELECT * FROM product', (err, data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            callback(data.rows)
        }
    })
}

exports.getOneProduct = (id, callback) => {
    client.query('SELECT * FROM product WHERE id = $1', [id], (err, data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            callback(data.rows[0])
        }
    })
}