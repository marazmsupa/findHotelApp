package hotelsite

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
            }
        }

        "/"(controller: 'index')
        "404"(view:'/notFound')
    }
}
