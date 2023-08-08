import db from "../database/database.connection.js"
import bcrypt from 'bcrypt'
import { v4 as uuid } from "uuid"

export async function signUp(req, res) {

    const { name, cpf, phone, email, password } = res.locals.user

    const hash = bcrypt.hashSync(password, 10)

    try {
        await db.query("INSERT INTO users (name, cpf, phone, email, password) VALUES ($1, $2, $3, $4, $5);", [name, cpf, phone, email, hash])
        res.status(201).send("Cadastro efetuado com sucesso")

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function signIn(req, res) {
    const user = res.locals.user
    const checkUser = res.locals.checkUser

    const userToken = uuid()

    try {
        await db.query(`INSERT INTO sessions (user_id, token) VALUES ($1, $2);`, [checkUser.rows[0].id, userToken])
        res.status(200).send({ token: userToken })

    } catch (err) {
        res.status(500).send(err.message)
    }
}