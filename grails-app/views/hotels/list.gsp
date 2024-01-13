<!doctype html>
<html>
<head>
    <meta name="layout" content="hotel"/>
    <title>FindHotel - список отелей</title>
</head>
<body>


<section class="index_main_section">
          <div class="index_main_section_wrapper">
            <div class="container">
              <div class="index_main_section_inner">
                <h1>Управление отелями</h1>
              </div>
            </div>
          </div>
        </section>

        <section class="index_hotels_section">
          <div class="index_hotels_section_wrapper">
            <div class="container">
              <div class="index_hotels_section_inner">
                <div class="index_hotels_section_header">
                  <div>
                    <h2>Отели</h2>
                  </div>
                  <div>
                  <g:link controller="hotels" action="create">
                      Добавить отель
                  </g:link>
                  </div>
                </div>
                <div class="index_hotels_section_results">
                  <div class="table_header_hotels">
                    <p>Название отеля</p>
                    <p>Страна</p>
                    <p>Рейтинг</p>
                    <p>Сайт</p>
                  </div>
                   <g:each in="${hotelsList}" var="hotel">
                                        <div class="table_row">
                                       <div class="table_row_left_hotels">
                                         <p>${hotel.name}</p>
                                         <p>${hotel.country.name}</p>
                                         <g:set var="iterator" value="${1}" />
                                         <div class="table_row_stars">
                                                                            <g:set var="iterator" value="${1}" />
                                                                            <g:while test="${iterator <= hotel.stars }">
                                                                                <p class="table_row_stars_iterator">${iterator++}</p>
                                                                                <asset:image src="Star.png" alt="star_icon"/>
                                                                            </g:while>
                                                                        </div>
                                         <p>
                                           ${hotel.site}
                                         </p>
                                       </div>
                                       <div class="table_row_right">
                                       <a href="/hotels/view?name=${hotel.name}">
                                               <asset:image src="eye.png" alt="view icon"/>
                                       </a>
                                       <a href="/hotels/edit/${hotel.id}">
                                               <asset:image src="mdi_pencil.png" alt="redact icon"/>
                                       </a>
                                       <a href="/hotels/drop?name=${hotel.name}">
                                               <asset:image src="delete.png" alt="delete icon"/>
                                       </a>
                                       </div>
                                     </div>
                                    </g:each>
                </div>
                <div class="pagination">
                                    <g:set var="iteratorForPagination" value="${0}" />
                                    <g:while test="${iteratorForPagination <= paginationCount && paginationCount != 0}">

                                        <a href="/hotels/list?offset=${iteratorForPagination * 10}">${++iteratorForPagination}</a>
                                    </g:while>
                                </div>
              </div>
            </div>
          </div>
        </section>
</body>
</html>