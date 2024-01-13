package hotelsite

import grails.gorm.services.Service

@Service(Hotels)
interface HotelsService {
    Hotels save(
            String name,
            Countries country,
            Integer stars,
            String site
    )
}