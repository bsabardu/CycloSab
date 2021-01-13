const client = require('./database');


exports.getAllProducts = (callback) => {
    client.query('SELECT product.id, product.name, product.description, product.size, product.price, product.category,floor(AVG(review.note)) AS average_note FROM product LEFT JOIN review ON product.id = review.product_id GROUP BY product.id', (err, data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            callback(data.rows)
        }
    })
}


exports.getProductsByCategory = (category, callback) => {
    client.query('SELECT product.id, product.name, product.description, product.size, product.price, product.category,floor(AVG(review.note)) AS average_note FROM product LEFT JOIN review ON product.id = review.product_id WHERE product.category = $1 GROUP BY product.id', [category],(err, data) => {
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
    client.query('SELECT product.id, product.name, product.description, product.size, product.price, product.category,floor(AVG(review.note)) AS average_note FROM product LEFT JOIN review ON product.id = review.product_id WHERE product.id = $1 GROUP BY product.id', [id], (err, data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            product = data.rows[0]

            //Get average note

            callback(data.rows[0])
        }
    })
}

exports.getReviewsOfProduct = (id, callback) => {
    client.query('SELECT * FROM review LEFT JOIN product ON product.id = review.product_id WHERE product.id = $1', [id], (err, data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            callback(data.rows)
        }
    })
}

exports.getCountByCategorie = (callback) => {
    client.query('SELECT category, COUNT(*) FROM product GROUP BY product.category', (err,data) => {
        if(err){
            console.trace(err);
            callback()
        }
        else {
            callback(data.rows)
        }
    })
}