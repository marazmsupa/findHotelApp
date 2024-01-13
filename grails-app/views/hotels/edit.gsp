<!doctype html>
<html>
<head>
    <meta name="layout" content="hotel"/>
    <title>FindHotel - изменение отеля</title>
</head>
<body>

<section class="model_form_section">
          <div class="model_form_section_wrapper">
            <div class="container">
              <div class="model_form_section_inner">
                <h1>Редактировать отель</h1>
                <div class="model_form_section_content">
                <g:if test="${hotels == null}">
                    <h2>Отель с таким названием не найден</h2>
                </g:if>
                <g:else>
                    <form action="/hotels/update/${this.hotels.id}" method="post">
                    <input type="hidden" name="_method" value="PUT" id="_method">
                    <input type="hidden" name="version" value="1" id="version">
                        <label for="name" >Название отеля</label>
                        <input type="text" name="name" required="" value="${hotels.name}" maxlength="255" id="name">
                        <label for="hotel_country">Страна</label>
                        <select name="country.id" required="" id="country">
                        <g:set var="iterator" value="${1}" />
                        <g:each in="${countriesList}" var="country">
                             <option value="${iterator++}">${country.name}</option>
                        </g:each>
                        </select>
                        <label for="stars" >Звезды</label>
                        <input type="range" name="stars" value="${hotels.stars}" required="" min="1" max="5" id="stars">
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