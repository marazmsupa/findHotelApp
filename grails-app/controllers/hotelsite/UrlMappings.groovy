package hotelsite

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
            }
        }

        "/"(controller: 'index')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
