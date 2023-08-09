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

export async function getPostById(req, res){

    const { id } = req.params

    try{
        const idPost = await db.query("SELECT * FROM posts WHERE id=$1;", [id])
        if(idPost.rows.length === 0) return res.status(404).send("Arquivo não encontrado")

        res.send({
            id: idPost.rows[0].id,
            name_dog: idPost.rows[0].name_dog,
            image: idPost.rows[0].image,
            description: idPost.rows[0].description,
            user_id: idPost.rows[0].user_id,
            active: idPost.rows[0].active
        })

    }catch (err) {
        res.status(500).send(err.message)
    }

}