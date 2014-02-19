window.articleItemView = Backbone.View.extend({


    tagName: "li",

    initialize: function() {

    },




    render: function () {


        try {
            var tpl = _.template($('#item-' + this.model.getClass() + '-template').html());
        } catch (err) {


            var tpl = _.template($('#item-normal-template').html());
        }












        $(this.el).html(tpl({item: this.model})).addClass(this.model.getClass());




        return this;
    }


});

window.entriesListView = Backbone.View.extend({
    el: "#entriesListView",
    isLoading: true,
    wait: 15000, // ms
    scrollPosition: 0, // 0 - top



    initialize: function () {
        var self = this;

        $(".page").css("display", "none");
        $("#loading").css("display", "block");


        console.log("##### entriesListView init");
        this.showLoadingIndicator();

        // destroy scrollable element
        $('.scrollable').remove();

        // create and add new scrollable element to DOM
        var scrollable=document.createElement("DIV");
        scrollable.className="scrollable";
        var wrap = document.createElement("DIV");
        wrap.className="wrap";
        var list = document.createElement("UL");
        list.className="list";

        wrap.appendChild(list);
        scrollable.appendChild(wrap);

        $(this.el).find("#entriesListContent").prepend(scrollable);

        // now we can init pull to refresh

        $(this.el).find('.scrollable').pullToRefresh({
            callback: function() {
                var deff = $.Deferred();

                self.prependResults(self, deff, function (deff) {
                    deff.resolve();

                });


                return $.when(deff).done(function () { deff.promise(); });

            }
        });

        var blogTitle = app.session.get("blogTitle");
        if(blogTitle.length > 19){
            var cutat= blogTitle.lastIndexOf(' ',20);

            if(cutat!=-1){
                blogTitle = blogTitle.substring(0,cutat)+'...';
            }else{
                blogTitle = blogTitle.substring(0,10)+'...';
            }
        }

        this.$el.find("h1.title").html(blogTitle);




        this.collection = new window.entriesCollection();



        if(app.hasConnection){
            this.collection.fetch({reset: true}).complete(function(){
                self.collection.updateCids();

                self.renderView();

                self.isLoading = false;
                self.timer = _.delay(self.prependResults, self.wait, self);
                self.hideLoadingIndicator();
            });

        }


        _.bindAll(this, 'checkScroll');
        // allow checkScroll function to be fired not often than every 150ms
        var throttledCheckScroll = _.throttle(this.checkScroll, 150);
        $("#entriesListView .scrollable").unbind("scroll").bind("scroll", throttledCheckScroll);

        _.bindAll(this, 'newButtonClickHandler');
        $("#entriesListView #loadNewPosts").unbind("click").bind("click", this.newButtonClickHandler);





    },



    renderView: function () {
        console.log("entriesListView render");
        var that = this;

        _.each(this.collection.models, function (item) {
            that.renderItem(item,0);
        }, this);



        //this.updateAnchorClickEvent();
        $(".page").css("display", "none");


        this.$el.css("display", "block");

    },



    renderItem: function (item, prependFlag) {
        var itemView = new entriesListItemView({
            model: item
        });

        var rendered = itemView.render();



        if(prependFlag){
            $(rendered.el).prependTo(this.$el.find("ul")).hide().slideDown(1000);
            //  this.$el.find("ul").prepend(itemView.render().el);
        }else{
            $(rendered.el).appendTo(this.$el.find("ul")).hide().fadeIn(1000);
            //this.$el.find("ul").append(itemView.render().el);
        }

    },


    prependResults: function (that, deff, callback) {

        console.log("prependResults");

        if(!that.isLoading && app.hasConnection){

            that.isLoading = true;

            that.collection.loadDirection="new";

            that.collection.fetch({
                reset: true,
                complete: function (item) {
                    if(that.collection.length){
                        // check if scroll is on top

                        if(that.scrollPosition - 10 < 0){
                            that.prependResultsRender();
                        } else {
                            that.showNewButton();
                        }
                    }


                    that.isLoading = false;
                    //that.timer = _.delay(that.prependResults, that.wait, that);
                    if(_.isFunction(callback)) callback(deff);

                },
                error : function () {

                    that.isLoading = false;
                    //that.timer = _.delay(that.prependResults, that.wait, that);
                    if(_.isFunction(callback)) callback(deff);
                }
            });
        }else{

            if(_.isFunction(callback)) callback(deff);
        }

        clearTimeout(that.timer);
        that.timer = _.delay(that.prependResults, that.wait, that);
        return true;

    },

    prependResultsRender : function (callback) {
        _.each(this.collection.models, function (item) {
            this.renderItem(item, 1);
        }, this);

        //this.updateAnchorClickEvent();
        this.collection.updateCids();
        return true;
    },


    appendResults: function () {

        if( !this.collection.listEnd){
            var that = this;

            this.isLoading = true;
            this.showLoadingIndicator();
            this.collection.loadDirection="more";

            this.collection.fetch({
                reset: true,
                complete: function (item) {

                    _.each(that.collection.models, function (item) {
                        that.renderItem(item, 0);
                    }, that);

                    //that.updateAnchorClickEvent();
                    that.collection.updateCids();
                    that.hideLoadingIndicator();
                    that.isLoading = false;

                },
                error : function () {
                    that.hideLoadingIndicator();
                    that.isLoading = false;

                }
            });
        }

    },

    // shows loading indicator on appendResults
    showLoadingIndicator : function (){
        $(this.el).find("#appendLoadingIndicator").fadeIn();
    },

    hideLoadingIndicator : function () {
        $(this.el).find("#appendLoadingIndicator").fadeOut();
    },


    showNewButton : function () {

        var button = $(this.el).find("#loadNewPosts");
        button.find(".postsnumber").html(this.collection.length);
        button.slideDown();

    },

    newButtonClickHandler: function () {
        $(this.el).find("#loadNewPosts").slideUp();
        $("#entriesListView .scrollable").animate({ scrollTop: 0 }, "slow");
        this.prependResultsRender();


    },

    checkScroll: function () {

        var triggerPoint = 100;
        var target = $("#entriesListView .scrollable");
        var scrollY = target.scrollTop() + target.height();
        var docHeight = target.get(0).scrollHeight;


        this.scrollPosition = target.scrollTop();



        if( !this.isLoading && scrollY > docHeight - triggerPoint && app.hasConnection ) {

            this.appendResults();

        }
    }




});