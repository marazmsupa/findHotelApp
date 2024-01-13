package hotelsite

import grails.gorm.transactions.Transactional

import static org.springframework.http.HttpStatus.CREATED

class HotelsController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def index(){
        redirect action: 'list';
    }

    def list(String offset){
        Integer offsetInteger = 0
        if(offset != null && offset != null){
            try {
                offsetInteger = Integer.parseInt(offset)
            }
            catch (NumberFormatException ex){

            }
        }

        def hotelsCriteria = Hotels.createCriteria()



        def hotelsList = hotelsCriteria.list {
            order("stars", "desc")
            order("name", "asc")
        };
        def hotelsListCount
        if(hotelsList == null){
            hotelsListCount = 0
        }
        else{
            hotelsListCount = hotelsList.size()
        }

        Integer paginationCount = (hotelsListCount - 1) / 10;

        def hotelsCriteriaNew = Hotels.createCriteria()

        hotelsList = hotelsCriteriaNew.list(max: 10, offset: offsetInteger) {
            order("stars", "desc")
            order("name", "asc")
        };

        respond([hotelsList: hotelsList, hotelsListCount: hotelsListCount, paginationCount: paginationCount])
    }

    def view(String name){
        Hotels hotel = null;
        if (name != null && name != ""){
            def hotelsCriteria = Hotels.createCriteria()
            hotel = hotelsCriteria.get {
                eq('name', name)
            };

        }
        respond([hotel: hotel])
    }

    @SuppressWarnings(['FactoryMethodName', 'GrailsMassAssignment'])
    def create() {
        respond([hotels: new Hotels(params), countriesList:Countries.list()])
    }

    @Transactional
    def save(Hotels hotels) {
        if (hotels == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (hotels.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hotels.errors, view:'create'
            return
        }

        hotels.save flush:true

        redirect action: 'list'
    }

    def edit(Hotels hotels){
      respond([hotels: hotels, countriesList:Countries.list()])
    }

    @Transactional
    def update(Hotels hotels){
        if (hotels == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (hotels.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hotels.errors, view:'create'
            return
        }

        hotels.save flush:true

        redirect action: 'list'
    }

    @Transactional
    def drop(String name){
        Hotels hotel = null;
        if (name != null && name != ""){
            def hotelsCriteria = Hotels.createCriteria()
            hotel = hotelsCriteria.get {
                eq('name', name)
            };
        }
        if(hotel == null){
            redirect action: 'list'
            transactionStatus.setRollbackOnly()
            return
        }
        hotel.delete flush:true

        redirect action: 'list'
    }


}
