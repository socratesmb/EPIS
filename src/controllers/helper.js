const bcrypt = require('bcryptjs');

const helper = {};

helper.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(password, salt);
    return hash;
}; 

helper.macthPassword = async (password, savedPassword) => {
    try {
        return await bcrypt.compare(password, savedPassword);
    } catch (e) {
        console.log(e)
    }
};
module.exports = helper;