const mysql = require('mysql2');
const bcrypt = require('bcrypt');

const DataSchema = new mysql.Schema({
    name: String,
    email: String,
    password: String,
    permissions: {type: String, default: 'Manager'}
});

DataSchema.pre('save', function(next){
    if(!this.isModified('password')){
        return next();
    } else {
        this.password = bcrypt.hashSync(this.password, 10);
        next();
    }
});

const users = mysql2.model('users', DataSchema);
module.exports = users;