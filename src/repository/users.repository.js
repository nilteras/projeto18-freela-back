import db from "../database/database.connection.js";

export async function signUpDB(name, cpf, phone, email, hash) {
    return await db.query(`
    INSERT INTO users (name, cpf, phone, email, password) 
    VALUES ($1, $2, $3, $4, $5);`, [name, cpf, phone, email, hash])
  
}

export async function signInDB(checkUserId,userToken) {
    return await db.query(`INSERT INTO sessions (user_id, token) VALUES ($1, $2);`, [checkUserId,userToken])
}

export async function dataUser(email) {
    return db.query("SELECT * FROM users WHERE email=$1;", [email])
}

