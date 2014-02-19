$(function() {


    window.articleModel = Backbone.Model.extend({
    });





    window.articlesCollection = Backbone.Collection.extend({
      model: articleModel,
      items_per_page: 10,
      current_count: 0,
      overall_count: 0,
      nextPageLink : '',




      url: function() {
        return this.nextPageLink;
      },

      parse: function(response) {


       this.nextPageLink = response.nextPageLink;
       this.overall_count = response.itemsCount;
       this.current_count = response.currentPage * response.itemsPerPage;


        return response.items;


      }





    });




});