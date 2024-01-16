package hotelsite

class IndexController {

    def hotelsListService
    def countriesListService
    def paginationCountService

    def index(String hotel_name, String hotel_country, String offset ){
        def country = countriesListService.getCountryByName(hotel_country)

        def hotelsListCount = hotelsListService.getHotelsListCount(hotelsListService.getHotelsListSorted(hotel_name, country))

        respond([hotelsList: hotelsListService.getHotelsListSortedWithOffset(offset, hotel_name, country),
                 countriesList: countriesListService.getCountriesList(null),
                 hotelsListCount: hotelsListCount,
                 paginationCount: paginationCountService.getPaginationCount(hotelsListCount)
        ])
    }
}
