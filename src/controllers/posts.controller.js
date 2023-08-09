import db from "../database/database.connection.js"

export async function createPost(req, res) {

    const { image, description, active } = res.locals.post
    const user = res.locals.user
    
    try {

        await db.query(`
        INSERT INTO posts (image, description, user_id, active) VALUES ($1, $2, $3, $4);`, 
        [image, description, user.rows[0].id, active])
        res.status(201).send("Post cadastrado")

    } catch (err) {
        res.status(500).send(err.message)
    }
}