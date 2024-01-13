<!doctype html>
<html>
<head>
    <meta name="layout" content="hotel"/>
    <title>FindHotel - главная</title>
</head>
<body>


<section class="index_main_section">
          <div class="index_main_section_wrapper">
            <div class="container">
              <div class="index_main_section_inner">
                <h1>FINDHOTEL - сервис по поиску отеля</h1>
                <p>Вы можете найти любой отель по названию и стране</p>
              </div>
            </div>
          </div>
        </section>
        <section class="index_search_section">
          <div class="index_search_section_wrapper">
            <div class="container">
              <div class="index_search_section_inner">
                <form action="">
                  <input
                    type="text"
                    placeholder="Название отеля"
                    id="hotel_name"
                    name="hotel_name"
                  />
                  <select name="hotel_country" id="hotel_country">
                    <option value="">Страна: Любая</option>
                     <g:each in="${countriesList}" var="country">
                         <option value="${country.name}">${country.name}</option>
                     </g:each>

                  </select>
                  <button type="submit">Найти</button>
                </form>
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
                    <h2>Результаты</h2>
                    <p>Всего найдено по фильтрам ${hotelsListCount} отелей</p>
                  </div>
                  <div>
                    <g:link controller="hotels" action="list">
                                           Управление отелями
                                      </g:link>
                  </div>
                </div>
                <g:if test="${hotelsListCount}">
                 <div class="index_hotels_section_results">
                                   <div class="table_header">
                                     <p>Название отеля</p>
                                     <p>Страна</p>
                                     <p>Рейтинг</p>
                                   </div>
                                   <g:each in="${hotelsList}" var="hotel">
                                       <div class="table_row">
                                           <div class="table_row_left">
                                                <p>${hotel.name}</p>
                                                <p>${hotel.country.name}</p>
                                                <div class="table_row_stars">
                                                    <g:set var="iterator" value="${1}" />
                                                    <g:while test="${iterator <= hotel.stars }">
                                                        <p class="table_row_stars_iterator">${iterator++}</p>
                                                        <asset:image src="Star.png" alt="star_icon"/>
                                                    </g:while>
                                                </div>
                                           </div>
                                           <div>
                                               <g:if test="${hotel.site}">
                                                   <a href="${hotel.site}" target="_blank">Перейти на сайт</a>
                                               </g:if>

                                           </div>
                                       </div>
                                   </g:each>
                                 </div>
                </g:if>
                <g:if test="${hotelsListCount == 0}">
                    <div class="index_hotels_section_nullresults">
                                  <h2>По данным фильтрам ничего не найдено</h2>
                                </div>
                </g:if>
                <div class="pagination">
                    <g:set var="iteratorForPagination" value="${0}" />
                    <g:while test="${iteratorForPagination <= paginationCount && paginationCount != 0}">
                        <a href="/?hotel_name=${params.hotel_name}&hotel_country=${params.hotel_country}&offset=${iteratorForPagination * 10}">${++iteratorForPagination}</a>
                    </g:while>
                </div>

              </div>
            </div>
          </div>
        </section>
</body>
</html>