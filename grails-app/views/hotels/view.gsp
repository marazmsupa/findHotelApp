<!doctype html>
<html>
<head>
  <meta name="layout" content="hotel"/>
  <g:if test="${hotel == null}">
    <title>FindHotel - отель не найден</title>
  </g:if>
  <g:else>
    <title>FindHotel - отель ${hotel.name}</title>
  </g:else>
</head>
<body>
  <section class="view_section">
    <div class="view_section_wrapper">
      <div class="container">
        <div class="view_section_inner">
          <g:if test="${hotel == null}">
            <h1>Отель с таким названием не найден</h1>
          </g:if>
          <g:else>
            <h1>Отель ${hotel.name}</h1>
            <div class="view_section_content">
              <div class="view_section_content_headers">
                <p>Название</p>
                <p>Страна</p>
                <p>Звезды</p>
                <p>Сайт</p>
              </div>
              <div class="view_section_content_values">
                <p>${hotel.name}</p>
                <p>${hotel.country.name}</p>
                <p>${hotel.stars}</p>
                <p>
                  <g:if test="${hotel.site == null}">
                    Отсутствует
                  </g:if>
                  <g:else>
                    ${hotel.site}
                  </g:else>
                </p>
              </div>
            </div>
          </g:else>
        </div>
      </div>
    </div>
  </section>
</body>
</html>