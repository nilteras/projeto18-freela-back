import { postSchema } from "../schemas/postSchema.js"

export async function PostValidation (req, res, next) {
    const post = req.body

    const { error } = postSchema.validate(post, { abortEarly: false })

    if (error) {
        const errorsMessage = error.details.map(detail => detail.message)
        return res.status(422).send(errorsMessage)
    }

    res.locals.post = post

    next()

}
