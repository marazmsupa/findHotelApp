<!DOCTYPE html>
<html lang="ru">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
      rel="stylesheet"
    />
    <asset:stylesheet src="styles.css"/>
    <title>
      <g:layoutTitle default="FINDHOTEL"/>
    </title>
    <g:layoutHead/>
  </head>
  <body>
    <header class="header">
      <div class="header_wrapper">
        <div class="container">
          <div class="header_inner">
            <div class="logo">
              <p>
                <g:link controller="index" action="index">FindHotel</g:link>
              </p>
            </div>
            <div class="header_navigation">
              <nav>
                <ul>
                  <li>
                    <g:link controller="hotels" action="list">Справочник отелей</g:link>
                  </li>
                  <li>
                    <g:link controller="countries" action="search">Поиск страны</g:link>
                  </li>
                  <li>
                    <g:link controller="countries" action="list">Справочник стран</g:link>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <div class="layout_wrapper">
      <main class="main">
        <g:layoutBody/>
      </main>
      <footer class="footer">
        <div class="footer_wrapper">
          <div class="container">
            <div class="footer_inner">
              <div class="footer_upper">
                <div class="logo">
                  <p>
                    <g:link controller="index" action="index">FindHotel</g:link>
                  </p>
                </div>
                <div class="footer_contacts">
                  <p>+7 999 999 99 99</p>
                </div>
              </div>
              <div class="footer_bottom">
                <p>Все права защищены.</p>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>
