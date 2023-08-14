import db from "../database/database.connection.js"

export async function authValidationSessionDB(token) {
    return db.query("SELECT * FROM sessions WHERE token=$1;", [token])
}

export async function authValidationUserDB(user_id_session) {
    return db.query("SELECT * FROM users WHERE id=$1;", [user_id_session])
}

export async function EmailValidationDB(email) {
    return db.query("SELECT * FROM users WHERE email=$1;", [email])
}





