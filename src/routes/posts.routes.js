import { Router } from "express";
import { PostValidation } from "../middlewares/posts.middleware.js";

export const postsRouter = Router()

postsRouter.get('/posts')
postsRouter.post('/posts', PostValidation)
postsRouter.get('/posts/:id')
postsRouter.put('/posts/:id')

export default postsRouter