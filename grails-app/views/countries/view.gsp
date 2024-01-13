<!doctype html>
<html>
<head>
    <meta name="layout" content="hotel"/>
     <g:if test="${country == null}">
                            <title>FindHotel - отель не найден</title>
                        </g:if>
                        <g:else>
                        <title>FindHotel - отель ${country.name}</title>
                        </g:else>
</head>
<body>

 <section class="view_section">
           <div class="view_section_wrapper">
             <div class="container">
               <div class="view_section_inner">
               <g:if test="${country == null}">
                                   <h1>Отель с таким названием не найден</h1>
                               </g:if>
                               <g:else>
                 <h1>Страна ${country.name}</h1>
                 <div class="view_section_content">
                   <div class="view_section_content_headers">
                     <p>Название</p>
                     <p>Столица</p>
                   </div>
                   <div class="view_section_content_values">
                     <p>${country.name}</p>
                     <p>${country.capital}</p>
                   </div>
                 </div>
                 </g:else>
               </div>
             </div>
           </div>
         </section>

</body>
</html>