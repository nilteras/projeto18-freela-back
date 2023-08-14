import db from "../database/database.connection.js"
import { PostByIdDB, allPostsByIdDB, createPostDB, getPostDB, updatePostDB } from "../repository/posts.repository.js"

export async function createPost(req, res) {

    const { name_dog, image, description } = res.locals.post
    const user = res.locals.user
 
    try {
        const user_id = user.rows[0].id
        await createPostDB(name_dog, image, description, user_id)
        res.status(201).send("Post cadastrado")

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getPosts(req, res) {

    try {
        const posts = await getPostDB()
        if (posts.rows.length === 0) return res.sendStatus(404)

        res.send(posts.rows)
    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getPostById(req, res) {

    const { id } = req.params

    try {
        const idPost = await PostByIdDB(id)
        if (idPost.rows.length === 0) return res.status(404).send("Arquivo não encontrado")

        res.send({
            id: idPost.rows[0].id,
            name_dog: idPost.rows[0].name_dog,
            image: idPost.rows[0].image,
            description: idPost.rows[0].description,
            name: idPost.rows[0].name,
            phone: idPost.rows[0].phone,
            active: idPost.rows[0].active
        })

    } catch (err) {
        res.status(500).send(err.message)
    }

}

export async function updatePost(req, res) {

    const { id, available } = req.body
    try {
        updatePostDB(available,id)        
        res.status(200).send("Disponibilidade do post atualizada")

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getAllPostById(req, res) {

    const { id } = req.params

    try {
        const postSelect = await allPostsByIdDB(id)
        if (postSelect.rows.length === 0) return res.status(404).send("Arquivo não encontrado")
        res.status(200).send(postSelect.rows)
    } catch (err) {
        res.status(500).send(err.message)
    }

}