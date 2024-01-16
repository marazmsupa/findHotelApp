package hotelsite

import grails.gorm.transactions.Transactional

class CountriesController {

    static allowedMethods = [save: 'POST', update: 'PUT', delete: 'DELETE']

    def countriesListService
    def paginationCountService

    def index(){
        redirect action: 'search'
    }

    def search( String name, String offset){
        def countriesListCount = countriesListService.getCountriesListCount(countriesListService.getCountriesList(name))

        respond([countriesList: countriesListService.getCountriesListWithOffset(name, offset),
                 countriesListCount: countriesListCount,
                 paginationCount: paginationCountService.getPaginationCount(countriesListCount)
        ])
    }

    def list(String offset){
        def countriesListCount = countriesListService.getCountriesListCount(countriesListService.getCountriesList(null))

        respond([countriesList: countriesListService.getCountriesListWithOffset(null, offset),
                 countriesListCount: countriesListCount,
                 paginationCount: paginationCountService.getPaginationCount(countriesListCount)
        ])
    }

    def view(String name){
        respond([country: countriesListService.getCountryByName(name)])
    }

    @SuppressWarnings(['FactoryMethodName', 'GrailsMassAssignment'])
    def create() {
        respond([countries: new Countries()])
    }

    @Transactional
    def save(Countries countries) {
        if (countries == null) {
            transactionStatus.setRollbackOnly()
            return
        }

        if (countries.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond([errors:countries.errors], view:'create')
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
            respond([errors:countries.errors, countries: countries], view:'edit')
            return
        }

        countries.save flush:true

        redirect action: 'list'
    }


    @Transactional
    def drop(String name){
        Countries country = countriesListService.getCountryByName(name)

        if(country == null){
            redirect action: 'list'
            transactionStatus.setRollbackOnly()
            return
        }
        country.delete flush:true

        redirect action: 'list'
    }
}
