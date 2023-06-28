var getPages =  function( page , total, maxVisible )
    {
        //number of pages to each side of the current page
        var eachSide = Math.floor( maxVisible/2);

        // extra pages gained if page is to close to one of the sides
        var leftExtra = 0;
        var rightExtra = 0;

        //minimum page on the left
        var leftPage = page - eachSide;


        if (leftPage < 1)
        {
             leftExtra = (leftPage * -1)+1;
             leftPage = 1;

        }

        var rightPage = page + eachSide;

        if (rightPage > total )
        {
            rightExtra = total - rightPage;
            rightPage = total;
        }
        //console.log([leftExtra,rightExtra, leftPage,rightPage])

        //Lets check if we can use the extra pages
        //Extra Left
        leftPage+=rightExtra;
        if (leftPage < 1)
        {
             leftPage = 1;

        }

        //Extra Right
        rightPage+=leftExtra;
        if (rightPage > total )
        {
             rightPage = total;

        }

        //Pages
        var pages = [];
        var pi = leftPage;

        for (var i = 0 ; i <= rightPage-rightExtra; i++ )
        {

            pages[i]= { page:pi, active:pi==page} ;
            pi++;

            if (pi > rightPage)
                    break;

        }
        var prev =  leftPage > 1 ;
        var next =  rightPage < total ;

        var prevPage ,nextPage;

        if (prev)
        {
           prevPage = page - 1 ;
        }

        if (next)
        {
            nextPage = page +1
        }

        return { prev:prev , next:next, prevPage:prevPage,nextPage:nextPage, pages: pages  } ;

    }




var renderPaginator = function ( page, total, max_visible, on_click) {
     Mustache.tags = ['[[', ']]'];
     var paginator_template = $('#paginator_template').html();
     Mustache.parse(paginator_template);
     var pages = getPages(page,total,max_visible);

     rendered = Mustache.render(paginator_template, {
                    pages: pages.pages,
                    next:pages.next,
                    nextPage: pages.nextPage,
                    prevPage: pages.prevPage,
                    prev:pages.prev
                    });

    $("#paginator").html(rendered);
   // console.log(pages);
   // console.log(rendered);
    $('.page-item').on('click',on_click);
}


//Text truncate utility function
//http://stackoverflow.com/a/1199420

function truncate( n, useWordBoundary ){
    var isTooLong = this.length > n,
        s_ = isTooLong ? this.substr(0,n-1) : this;
        s_ = (useWordBoundary && isTooLong) ? s_.substr(0,s_.lastIndexOf(' ')) : s_;
    return  isTooLong ? s_ + '...' : s_;
};

function load_query(input_element_id, query){
    var query = query || {};
    var txt = $(input_element_id).val();
    
    tags = []
    terms = []	

    txt.split(" ").forEach( (term) =>
       {
         console.log(term); 
         if (term == "") 
           return false; // move on 
         if (term.startsWith("#")) // tag? 
              tags.push(term.replace('#',''));
         else // term
                 terms.push(term);

         }

  )	

       title = terms.join(" ");
       if (title != "" && tags.length != 0){
            query['title'] = {'$text': {'$search': title}};
            query['tags'] = {'tags': {'$all': tags}};
        }
        else if (tags.length != 0 && title == ""){
            query['tags'] = {'tags': {'$all': tags}};
            delete query['title']
        }
        else if (tags.length == 0 && title != ""){
            query['title'] = {'$text': {'$search': title}};
            delete query['tags']
        }
        else{
            delete query['title'];
            delete query['tags']
        }
    

    return query;
}


//function that builds a query depending on input of user
function query_builder(query)
    {
                var name = $("#txtname").val();
                var exp_tags = /S*#(?:\[[^\]]+\]|\S+)/;
                if (exp_tags.test(name)){
                    var texto = name.split(/\s+/g);
                    tags = [];
                    title = [];
                    for(var i=0;i<texto.length;i++){
                        if(texto[i].match(exp_tags)){
                            tags.push(texto[i].replace('#',''))
                        }
                        else{
                            title.push(texto[i])
                        }
                    }
                    title = title.join(" ");
                    if (title != "" && tags.length != 0){
                        query['title'] = {'$text': {'$search': title}}  ;
                        query['tags'] = {'tags': {'$all': tags}};
                    }
                    else if (tags.length != 0 && title == ""){
                        query['tags'] = {'tags': {'$all': tags}};
                        delete query['title']
                    }
                    else if (tags.length == 0 && title != ""){
                        query['title'] = {'$text': {'$search': title}};
                        delete query['tags']
                    }
                    else{
                        delete query['title'];
                        delete query['tags']
                    }
                    buscar(query)
                }
                else{
                    query['title'] = {'$text': {'$search': $("#txtname").val(), '$options': 'i'}};
                    delete query['tags'];
                    buscar(query)
                }
    }


            //function that categorizes data received (from url) and sends it to query_builder with correct parameters
    function loadURI( input_element_id) {
        var _query = "";


        var tag_string = getParameterByName("tag");

        if (tag_string){
            _query = _query + get_tag_list( tag_string );
        }

        var query_string = getParameterByName("query");

        if (query_string){
            var term_list = query_string.split(",");
            _query = _query +" "+ term_list.join(" ");
        }


        $(input_element_id).val(_query);


        }

        function get_tag_list( tag_string )
        {
            var tag_list = tag_string.split(",");
            return "#"+tag_list.join(" #");


        }




//Thanks to: http://stackoverflow.com/a/901144
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

    function getCookie(name) {
                var cookieValue = null;
                if (document.cookie && document.cookie != '') {
                    var cookies = document.cookie.split(';');
                    for (var i = 0; i < cookies.length; i++) {
                        var cookie = jQuery.trim(cookies[i]);
                        // Does this cookie string begin with the name we want?
                        if (cookie.substring(0, name.length + 1) == (name + '=')) {
                            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                            break;
                        }
                    }
                }
                return cookieValue;
            }
    function csrfSafeMethod(method) {
                // these HTTP methods do not require CSRF protection
                return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
            }


function generateUUID() {
          var d = new Date().getTime();
          var uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
              var r = (d + Math.random() * 16) % 16 | 0;
              d = Math.floor(d / 16);
              return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
          });
          return uuid;
      }


  function indexdata(data){
      var indexed = {};
      $.map(data, function(n, i){
          if (n['name']=='tags'){
              n['value'] = n['value'].split(',')
          }
          indexed[n['name']] = n['value'];
      });

      return indexed
  }
