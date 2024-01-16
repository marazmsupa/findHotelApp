package hotelsite

import grails.gorm.transactions.Transactional


class HotelsController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def hotelsListService
    def countriesListService
    def paginationCountService

    def index(){
        redirect action: 'list'
    }

    def list(String offset){
        def hotelsListCount = hotelsListService.getHotelsListCount(hotelsListService.getHotelsListSorted(null, null))

        respond([hotelsList: hotelsListService.getHotelsListSortedWithOffset(offset, null, null),
                 hotelsListCount: hotelsListCount,
                 paginationCount: paginationCountService.getPaginationCount(hotelsListCount)
        ])
    }

    def view(String name){
        respond([hotel: hotelsListService.getHotelByName(name)])
    }

    @SuppressWarnings(['FactoryMethodName', 'GrailsMassAssignment'])
    def create() {
        def countriesList = countriesListService.getCountriesList(null)

        respond([hotels: new Hotels(), countriesList:countriesList, countriesCount:countriesListService.getCountriesListCount(countriesList)])
    }

    @Transactional
    def save(Hotels hotels) {
        if (hotels == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (hotels.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond([countriesList:countriesListService.getCountriesList(null), errors:hotels.errors], view:'create')
            return
        }

        hotels.save flush:true

        redirect action: 'list'
    }

    def edit(Hotels hotels){
      respond([hotels: hotels, countriesList:countriesListService.getCountriesList(null)])
    }

    @Transactional
    def update(Hotels hotels){
        if (hotels == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (hotels.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond([countriesList:countriesListService.getCountriesList(null), errors:hotels.errors, hotels: hotels], view:'edit')
            return
        }

        hotels.save flush:true

        redirect action: 'list'
    }

    @Transactional
    def drop(String name){
        Hotels hotel = hotelsListService.getHotelByName(name)

        if(hotel == null){
            redirect action: 'list'
            transactionStatus.setRollbackOnly()
            return
        }
        hotel.delete flush:true

        redirect action: 'list'
    }


}
