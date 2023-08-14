import db from "../database/database.connection.js";

export async function createPostDB(name_dog, image, description, user_id) {
    return await db.query(`
    INSERT INTO posts (name_dog, image, description, user_id) 
    VALUES ($1, $2, $3, $4);`, [name_dog, image, description, user_id])

}

export async function getPostDB() {
    return db.query("SELECT * FROM posts WHERE active=true")
}

export async function PostByIdDB(id) {
    return db.query(`
    SELECT 
        posts.*,
        users.name,
        users.phone
    FROM posts 
    JOIN users ON posts.user_id = users.id
    WHERE posts.id=$1;`, [id])
}

export async function updatePostDB(available, id){
    return await db.query("UPDATE posts SET active=$1 WHERE id=$2;", [available, id])
}

export async function allPostsByIdDB(id){
    return db.query("SELECT * FROM posts WHERE user_id=$1;", [id])
}