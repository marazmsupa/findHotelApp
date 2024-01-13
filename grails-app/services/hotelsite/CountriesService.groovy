package hotelsite
import grails.gorm.services.Service

@Service(Countries)
interface CountriesService {
    Countries save(
            String name,
            String capital
    )
}



