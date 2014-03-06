$(function() {


  window.articleModel = Backbone.Model.extend({

    isHighlighted : function(){

      if (this.get('fields').highlight=="1") return true;

      return false;
    },

    getRendition : function(name) {
      // to be updated in API
      var renditions = this.get('renditions');
      for (var i=0 ; i< renditions.length; i++){
        if(renditions[i].caption==name){
          return renditions[i].link;
        }
      }
      return false;

    }
  });





  window.articlesCollection = Backbone.Collection.extend({
    model: articleModel,
    nextPageLink : '',




    url: function() {
      return this.nextPageLink;
    },

    parse: function(response) {

      if('pagination' in response){
        console.log(response.pagination.nextPageLink);
        if (response.pagination.nextPageLink !== undefined){
          this.nextPageLink = response.pagination.nextPageLink;
          window.lapp.showMoreButton();
        }else{
          window.lapp.hideMoreButton();
        }
    }
    return response.items;


  }





});




});