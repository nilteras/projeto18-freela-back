import { Router } from "express";
import { PostValidation } from "../middlewares/posts.middleware.js";
import { authValidation } from "../middlewares/auth.middlewares.js";
import { createPost, getPosts } from "../controllers/posts.controller.js";

export const postsRouter = Router()

postsRouter.get('/posts', getPosts)
postsRouter.post('/posts',authValidation, PostValidation, createPost)
postsRouter.get('/posts/:id')
postsRouter.put('/posts/:id')

export default postsRouter