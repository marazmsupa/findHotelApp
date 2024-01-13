package hotelsite

import grails.gorm.transactions.Transactional

class CountriesController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']


    def index(){
        redirect action: 'search';
    }


    def search( String name, String offset){

        Integer offsetInteger = 0
        if(offset != null && offset != null){
            try {
                offsetInteger = Integer.parseInt(offset)
            }
            catch (NumberFormatException ex){

            }
        }

        def countriesCriteria = Countries.createCriteria()



        def countriesList = countriesCriteria.list {
            if(name != null){
                like("name", "%${name}%")

            }
        };
        def countriesListCount
        if(countriesList == null){
            countriesListCount = 0
        }
        else{
            countriesListCount = countriesList.size()
        }

        Integer paginationCount = (countriesListCount - 1) / 10;

        def countriesCriteriaNew = Countries.createCriteria()

        countriesList = countriesCriteriaNew.list(max: 10, offset: offsetInteger) {
            if(name != null){
                like("name", "%${name}%")

            }
        };

        respond([countriesList: countriesList, countriesListCount: countriesListCount, paginationCount: paginationCount])
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

        def countriesCriteria = Countries.createCriteria()




        def countriesList = countriesCriteria.list {

        };
        def countriesListCount
        if(countriesList == null){
            countriesListCount = 0
        }
        else{
            countriesListCount = countriesList.size()
        }

        Integer paginationCount = (countriesListCount - 1) / 10;

        def countriesCriteriaNew = Countries.createCriteria()

        countriesList = countriesCriteriaNew.list(max: 10, offset: offsetInteger) {

        };

        respond([countriesList: countriesList, countriesListCount: countriesListCount, paginationCount: paginationCount])
    }

    def view(String name){
        Countries country = null;
        if (name != null && name != ""){
            def countryCriteria = Countries.createCriteria()
            country = countryCriteria.get {
                eq('name', name)
            };

        }
        respond([country: country])
    }

    @SuppressWarnings(['FactoryMethodName', 'GrailsMassAssignment'])
    def create() {
        respond([countries: new Countries(params)])
    }

    @Transactional
    def save(Countries countries) {
        if (countries == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (countries.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond countries.errors, view:'create'
            return
        }

        countries.save flush:true

        redirect action: 'list'
    }

    def edit(Countries countries){
        respond([countries: countries])
    }

    @Transactional
    def update(Countries countries){
        if (countries == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (countries.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond countries.errors, view:'create'
            return
        }

        countries.save flush:true

        redirect action: 'list'
    }


    @Transactional
    def drop(String name){
        Countries country = null;
        if (name != null && name != ""){
            def countryCriteria = Countries.createCriteria()
            country = countryCriteria.get {
                eq('name', name)
            };
        }
        if(country == null){
            redirect action: 'list'
            transactionStatus.setRollbackOnly()
            return
        }
        country.delete flush:true

        redirect action: 'list'
    }
}
