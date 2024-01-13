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
                  <form action="/hotels/save" method="post">
                    <label for="name">Название отеля</label>
                    <input type="text" name="name" value="" required="" maxlength="255" id="name">
                    <label for="hotel_country">Страна</label>
                    <select name="country.id" required="" id="country">
                        <g:set var="iterator" value="${1}" />
                      <g:each in="${countriesList}" var="country">
                                               <option value="${iterator++}">${country.name}</option>
                                           </g:each>
                    </select>
                    <label for="stars">Звезды</label>
                    <input type="range" name="stars" value="" required="" min="1" max="5" id="stars">
                    <label for="site">Сайт</label>
                    <input type="text" name="site" value="" id="site">
                    <button type="submit" id="create" name="create">Сохранить</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </section>

</body>
</html>