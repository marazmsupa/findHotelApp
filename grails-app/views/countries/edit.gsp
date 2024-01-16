<!doctype html>
<html>
<head>
  <meta name="layout" content="hotel"/>
  <g:if test="${countries == null}">
    <title>FindHotel - страна не найдена</title>
  </g:if>
  <g:else>
    <title>FindHotel - изменение страны ${countries.name}</title>
  </g:else>
</head>
<body>
  <section class="model_form_section">
    <div class="model_form_section_wrapper">
      <div class="container">
        <div class="model_form_section_inner">
          <h1>Добавить страну</h1>
          <div class="model_form_section_content">
            <g:if test="${countries == null}">
              <h2 class="form_exception_label">Страна не найдена</h2>
            </g:if>
            <g:else>
              <g:if test="${errors != null}">
                <ul class="errors" role="alert">
                  <g:eachError bean="${errors}" var="error">
                    <li>Ошибка валидации: <g:message error="${error}"/></li>
                  </g:eachError>
                </ul>
              </g:if>
              <form action="/countries/update/${this.countries.id}" method="post">
                <input type="hidden" name="_method" value="PUT" id="_method">
                <input type="hidden" name="version" value="1" id="version">
                <label for="name">Название страны</label>
                <input type="text" name="name" value="${countries.name}" required="" maxlength="255" id="name">
                <label for="capital">Столица</label>
                <input type="text" name="capital" value="${countries.capital}" required="" maxlength="128" id="capital">
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