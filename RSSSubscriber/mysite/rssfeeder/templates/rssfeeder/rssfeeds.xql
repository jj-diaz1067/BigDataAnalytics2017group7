<html>
<title>Taller 1: Descucrimiento y Procesamiento Básico de Fuentes
</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>
<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-opennav w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="./index" class="w3-bar-item w3-button w3-padding-large w3-hide-small">HOME</a>
    <a href="./spider" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Spider</a>
    <a href="./rssfeeds" class="w3-bar-item w3-button w3-padding-large w3-hide-small">RSS Feeds</a>

    <!--<div class="w3-hide-small w3-dropdown-hover">
      <a href="javascript:void(0)" class="w3-padding-large w3-button" title="More">MORE <i class="fa fa-caret-down"></i></a>     
      <div class="w3-dropdown-content w3-white w3-card-4">
        <a href="#">Merchandise</a>
        <a href="#">Extras</a>
        <a href="#">Media</a>
      </div>
    </div>-->
  </div>
</div>

  <!-- RSS filter results Modal -->
    <div id="rssfeeds" class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">Filtros RSS</h2>
      <p class="w3-opacity w3-center">
        <i>Introduzca su criterio de búsqueda y las opciones de filtrado deseadas.</i>
      </p>
     
     <!-- <ul class="w3-ul w3-border w3-white w3-text-grey">-->
     <form method="post">{% csrf_token %} 
     <ul class="w3-ul w3-white w3-text-grey">
        <li class="w3-padding w3-margin-bottom"> <br>
        <label>Criterio de búsqueda:</label> 
        <input class="w3-input" type="text" name ="criteriobusq"><br>
    <label class="w3-validate">Buscar este criterio en:</label> 
        <input class="w3-radio" type="radio" name="searchin" value="title" checked>
    <label class="w3-validate">Título</label> 
        <input class="w3-radio" type="radio" name="searchin" value="description" unchecked>
    <label class="w3-validate">Descripción</label> 
        <input class="w3-radio" type="radio" name="searchin" value="category" unchecked>
    <label class="w3-validate">Categoría del artículo</label><br>
    <br>
        <button class="w3-button w3-red w3-margin-bottom" type ="submit" href="rssfeeds/{{ searchin.value }}/{{ criteriobusq.value }}">Filtrar Noticias</button>
      
    </form>

      <h1>Fuente: BBC News Technology</h1>
    <div id="demo" class="collapse">
      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Noticias sin filtrar</b></p>
          </div>
          <div class="w3-container w3-white" >
            {% if all_items %}
              {% for elem in all_items %}
                 <li> <a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %}
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Filtrado RegEx</b></p>
          </div>
          <div class="w3-container w3-white">
            <!--TODO: Resultados de filtrado>-->
          {% if regex_list %}
              {% for elem in regex_list %}
                  <li><a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %}
          </div>
         
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Filtrado XQuery</b></p>
          </div>
          <div class="w3-container w3-white">
            {filter-rss("http://feeds.bbci.co.uk/news/technology/rss.xml")}
          <!--{% declare function filter-rss ($url)
            {
              for $b in document($url)/rss/channel/item
                row($b/link/text(), $b/title/text())
            };
            
            define function row ($link, $title)
            {
              <a>RSS item <b> {$title}</b> is located at <b>{$link}</b></a>
            };

          filter-rss("https://www.wired.com/category/gear/feed/") %}-->
            
  

            <!--TODO: Resultados de filtrado>
          {% if xquery_items %}
              {% for elem in xquery_items %}
                  <li><a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %} -->
          </div>
        </div>
        </div>

      <h1>Fuente: WIRED</h1>
      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Noticias sin filtrar</b></p>
          </div>
          <div class="w3-container w3-white">
            <!--TODO: Resultados de filtrado>-->
          {% if all_items %}
              {% for elem in all_items_wired %}
                 <li> <a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %}
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Filtrado RegEx</b></p>
          </div>
          <div class="w3-container w3-white">
            <!--TODO: Resultados de filtrado>-->
          {% if regex_list_wired %}
              {% for elem in regex_list_wired %}
                  <li><a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %}
          </div>
         
        </div>
        <div class="w3-third w3-margin-bottom">
          <div class="w3-container w3-black">
            <p><b>Filtrado XQuery</b></p>
          </div>
          <div class="w3-container w3-white">
            <!--TODO: Resultados de filtrado>-->
          {% if xquery_items_wired %}
              {% for elem in xquery_items_wired %}
                  <li><a href= {{elem.post_link}}>{{ elem }}</a></li>
              {% endfor %}
          {% else %}
              <p>No hay resultados para mostrar</p>
          {% endif %}
          </div>
        </div>
        </div>
      </div>
    </div>


<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
  <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="application/xquery">
  alert(document('https://www.wired.com/category/gear/feed/'))
</script>
</body>
</html>
