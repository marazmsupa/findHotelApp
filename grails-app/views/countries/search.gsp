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
                <h1>Поиск стран</h1>
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
                    placeholder="Название страны"
                    id="name"
                    name="name"
                  />

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
                    <p>Всего найдено по фильтрам ${countriesListCount} стран</p>
                  </div>
                  <div>
                  <g:link controller="countries" action="list">
                                                          Управление странами
                                                      </g:link>
                  </div>
                </div>

                <g:if test="${countriesListCount}">
                                 <div class="index_hotels_section_results">
                                                   <div class="table_header">
                                                     <p>Название страны</p>
                                                     <p>Столица</p>
                                                   </div>
                                                   <g:each in="${countriesList}" var="country">
                                                    <div class="table_row">
                                                        <div class="table_row_left">
                                                          <p>${country.name}</p>
                                                          <p>${country.capital}</p>
                                                        </div>
                                                        <div></div>
                                                      </div>
                                                   </g:each>
                                                 </div>
                                </g:if>
                                <g:if test="${countriesListCount == 0}">
                                    <div class="index_hotels_section_nullresults">
                                                  <h2>По данным фильтрам ничего не найдено</h2>
                                                </div>
                                </g:if>
                                <div class="pagination">
                                    <g:set var="iteratorForPagination" value="${0}" />
                                    <g:while test="${iteratorForPagination <= paginationCount && paginationCount != 0}">
                                        <a href="/countries/search?name=${params.name}&offset=${iteratorForPagination * 10}">${++iteratorForPagination}</a>
                                    </g:while>
                                </div>








              </div>
            </div>
          </div>
        </section>

</body>
</html>