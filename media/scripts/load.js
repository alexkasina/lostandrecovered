$("#id_item_category").live($.browser.msie ? 'click' : 'change', function(){
     $("#id_item_category option:selected").each(function (){
        $("#id_item_subcategory").html('loading <img src="http://lostandfound.com/assets/images/ajax-loader.gif" >');
        $("#id_item_subcategory").html('<select name="search_subcategory" id="search_subcategory" style="width:250px;" class="required"><option value="">Choose a Sub-Category</option><option value="birds">Birds</option><option value="cats">Cats</option><option value="dogs">Dogs</option><option value="ferrets">Ferrets</option><option value="hamsters">Hamsters, Guinea Pigs, etc</option><option value="horses">Horses, Farm Animals</option><option value="rabbits">Rabbits</option><option value="reptiles">Reptiles</option></select>');


          });
  });
