import db from "../database/database.connection.js"

export async function createPost(req, res) {

    const { name_dog, image, description, active } = res.locals.post
    const user = res.locals.user
    
    try {

        await db.query(`
        INSERT INTO posts (name_dog, image, description, user_id, active) VALUES ($1, $2, $3, $4, $5);`, 
        [name_dog, image, description, user.rows[0].id, active])
        res.status(201).send("Post cadastrado")

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getPosts(req, res){

    try {
        const posts = await db.query("SELECT * FROM posts;")
        if(posts.rows.length === 0) return res.sendStatus(404)

        res.send(posts.rows)
    }catch (err) {
        res.status(500).send(err.message)
    }
}