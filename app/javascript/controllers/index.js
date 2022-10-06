// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"
import PostController from "./post_controller"
import ModalController from "./modal_controller"
import MusicController from "./music_controller"

application.register("post", PostController)
application.register("modal", ModalController)
application.register("music", MusicController)
