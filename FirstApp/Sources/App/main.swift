import Vapor

let drop = Droplet()

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    return try drop.view.make("welcome", [
    	"message": Node.string(drop.localization[lang, "welcome", "title"])
    ])
}

drop.get("/hello"){ request in
    return "This is Jacky's first swift webapp"

}

drop.resource("posts", PostController())

drop.run()
