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
                 <h1>Управление странами</h1>
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
                     <h2>Страны</h2>
                   </div>
                   <div>
                    <g:link controller="countries" action="create">
                        Добавить страну
                    </g:link>
                   </div>
                 </div>
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
                            <div class="table_row_right">
                                 <a href="/countries/view?name=${country.name}">
                                     <asset:image src="eye.png" alt="view icon"/>
                                 </a>
                                 <a href="/countries/edit/${country.id}">
                                     <asset:image src="mdi_pencil.png" alt="redact icon"/>
                                 </a>
                                 <a href="/countries/drop?name=${country.name}">
                                     <asset:image src="delete.png" alt="delete icon"/>
                                 </a>
                            </div>
                       </div>
                   </g:each>



                   </div>
                   <div class="pagination">
                       <g:set var="iteratorForPagination" value="${0}" />
                       <g:while test="${iteratorForPagination <= paginationCount && paginationCount != 0}">
                           <a href="/countries/list?offset=${iteratorForPagination * 10}">${++iteratorForPagination}</a>
                       </g:while>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </section>

</body>
</html>