<!doctype html>
<html>
<head>
  <meta name="layout" content="hotel"/>
  <g:if test="${hotels == null}">
    <title>FindHotel - отель не найден</title>
  </g:if>
  <g:else>
    <title>FindHotel - изменение отеля ${hotels.name}</title>
  </g:else>
</head>
<body>
  <section class="model_form_section">
    <div class="model_form_section_wrapper">
      <div class="container">
        <div class="model_form_section_inner">
          <h1>Редактировать отель</h1>
          <div class="model_form_section_content">
            <g:if test="${hotels == null}">
              <h2 class="form_exception_label">Отель не найден</h2>
            </g:if>
            <g:else>
              <g:if test="${errors != null}">
                <ul class="errors" role="alert">
                  <g:eachError bean="${errors}" var="error">
                    <li>Ошибка валидации: <g:message error="${error}"/></li>
                  </g:eachError>
                </ul>
              </g:if>
              <form action="/hotels/update/${this.hotels.id}" method="post">
                <input type="hidden" name="_method" value="PUT" id="_method">
                <input type="hidden" name="version" value="1" id="version">
                <label for="name" >Название отеля</label>
                <input type="text" name="name" required="" value="${hotels.name}" maxlength="255" id="name">
                <label for="hotel_country">Страна</label>
                <select name="country.id" required="" id="country" value="${hotels.country.id}">
                  <g:each in="${countriesList}" var="country">
                    <g:if test="${country.id == hotels.country.id}">
                      <option value="${country.id}" selected>${country.name}</option>
                    </g:if>
                    <g:else>
                      <option value="${country.id}">${country.name}</option>
                    </g:else>
                  </g:each>
                </select>
                <label for="stars" >Звезды</label>
                <select name="stars" value="" required="" id="stars">
                  <g:set var="iterator" value="${1}"/>
                  <g:while test="${iterator <= 5}">
                    <g:if test="${hotels.stars == iterator}">
                      <option value="${iterator}" selected>${iterator}</option>
                    </g:if>
                    <g:else>
                      <option value="${iterator}" >${iterator}</option>
                    </g:else>
                    <%iterator++%>
                  </g:while>
                </select>
                <label for="site" >Сайт</label>
                <input type="text" name="site" value="${hotels.site}" id="site">
                <button type="submit" id="create" name="create">Сохранить</button>
              </form>
            </g:else>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>