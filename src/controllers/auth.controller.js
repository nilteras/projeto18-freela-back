import db from "../database/database.connection.js"
import bcrypt from 'bcrypt'
import { v4 as uuid } from "uuid"
import { dataUser, signInDB, signUpDB } from "../repository/users.repository.js"


export async function signUp(req, res) {

    const { name, cpf, phone, email, password } = res.locals.user

    const hash = bcrypt.hashSync(password, 10)

    try {
        signUpDB(name, cpf, phone, email, hash)
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
        const checkUserId = checkUser.rows[0].id
        signInDB(checkUserId,userToken) 

        const email = user.email
        const userName = await dataUser(email)
        res.status(200).send({ token: userToken, id: userName.rows[0].id, name: userName.rows[0].name })

    } catch (err) {
        res.status(500).send(err.message)
    }
}