const db = require('../data/schemes-config')

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find(){
  return db('schemes').select('*')
}

function findById(id){
    return db('schemes').where('id',id).first();
}

function findSteps(id){

return db('schemes as sc').join('steps as st', 'sc.id', 'st.scheme_id')
.where('sc.id', id) .select('sc.scheme_name', 'st.instructions', 'st.step_number', 'st.id')
.orderBy('st.step_number')
}

function add(data){
    return db('schemes').insert(data)
}

function addStep(stepData){
    db('steps').insert(stepData)
   
}

function update(changes, id){
    return db('schemes').where('id', id).update(changes)
    .then( updated => {
        return updated > 0 ? findById(id) : null
    })
}

function remove(id){
    return db('schemes').where('id', id).del()
}