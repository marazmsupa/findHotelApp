<!doctype html>
<html>
<head>
  <meta name="layout" content="hotel"/>
  <title>FindHotel - Добавить отель</title>
</head>
<body>
  <section class="model_form_section">
    <div class="model_form_section_wrapper">
      <div class="container">
        <div class="model_form_section_inner">
          <h1>Добавить отель</h1>
          <div class="model_form_section_content">
            <g:if test="${countriesCount == 0}">
              <h2 class="form_exception_label">У вас нет стран, к которым можно добавить отель. Для начала добавьте минимум 1 страну.</h2>
            </g:if>
            <g:else>
              <g:if test="${errors != null}">
                <ul class="errors" role="alert">
                  <g:eachError bean="${errors}" var="error">
                    <li>Ошибка валидации: <g:message error="${error}"/></li>
                  </g:eachError>
                </ul>
              </g:if>
              <form action="/hotels/save" method="post">
                <label for="name">Название отеля</label>
                <input type="text" name="name" value="" required="" maxlength="255" id="name">
                <label for="hotel_country">Страна</label>
                <select name="country.id" required="" id="country">
                  <g:each in="${countriesList}" var="country">
                    <option value="${country.id}">${country.name}</option>
                  </g:each>
                </select>
                <label for="stars">Звезды</label>
                <select name="stars" value="" required="" id="stars">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
                <label for="site">Сайт</label>
                <input type="text" name="site" value="" id="site">
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