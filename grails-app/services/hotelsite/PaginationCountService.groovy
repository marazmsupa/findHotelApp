package hotelsite

class PaginationCountService {

    def getPaginationCount(Integer listItemsCount){
        Integer paginationCount = (listItemsCount - 1) / 10

        return paginationCount
    }
}
