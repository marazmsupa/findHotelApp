<!doctype html>
<html>
<head>
    <meta name="layout" content="hotel"/>
    <title>FindHotel - добавить страну</title>
</head>
<body>

 <section class="model_form_section">
           <div class="model_form_section_wrapper">
             <div class="container">
               <div class="model_form_section_inner">
                 <h1>Добавить страну</h1>
                 <div class="model_form_section_content">
                   <form action="/countries/save" method="post">
                     <label for="name">Название страны</label>
                     <input type="text" name="name" value="" required="" maxlength="255" id="name">
                     <label for="capital">Столица</label>
                     <input type="text" name="capital" value="" required="" maxlength="128" id="capital">
                     <button type="submit" id="create" name="create">Сохранить</button>
                   </form>
                 </div>
               </div>
             </div>
           </div>
         </section>

</body>
</html>