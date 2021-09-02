const { defaultMaxListeners } = require('events');
const User = require('../models/users_model');

module.exports = {
    index(req, res) {
        const listUser = User.find();
        res.json(listUser);
    },
    //Create user in DB
    async create (req, res) {
        const {name, email, password, permissions} = req.body;
        let data = {};
        let userFind = await User.findOne({email});
        if(!userFind) {
            data = {name, email, password, permissions};
            userFind = await User.create(data);
            return res.status(200).json(userfind);
        } else {
            return res.status(500).json(userfind);
        }
    },
    async details (req, res) {
        const {id_user} = req.params;
        const detailUser = await User.findOne({id_user});
        res.json({detailUser});
    },
    async delete(req, res) {
        const {id_user} = req.parms;
        const deleteUser = await User.findByIdAndDelete({id_user});
        return res.json(deleteUser);
    },
    async update(req,res) {
        const {id_user, name, email, password, permissions} = req.body;
        const data = {name, email, password, permissions};
        const updateUser = await User.findOneAndUpdate({id_user}, data, {new:true});
        return res.json(updateUser);
    }
}