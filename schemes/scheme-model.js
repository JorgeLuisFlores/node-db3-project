const db = require('../data/dbConfig.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
};


function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({
            id
        })
        .first();
}

function findSteps(id) {
    return db('schemes')
        .join('steps', 'schemes.id', 'steps.scheme_id')
        .select('scheme_id', 'schemes.scheme_name', 'step_number', 'instructions')
        .where({
            scheme_id: id
        })
        .orderBy('steps.step_number');
}

function add(schemes) {
    return db('schemes')
        .insert(schemes)
        .then(ids => {
            return findById(ids[0]);
        });
}

function update(id, changes) {
    return db('schemes')
        .where({
            id
        })
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where({
            id
        })
        .del();
}