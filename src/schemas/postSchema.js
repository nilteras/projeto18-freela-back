import joi from 'joi'

export const postSchema = joi.object({
    image: joi.string().uri().required(),
    description: joi.string().required(),
    active: joi.boolean().required()
})