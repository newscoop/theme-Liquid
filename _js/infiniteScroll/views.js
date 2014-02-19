window.entriesListItemView = Backbone.View.extend({


    tagName: "li",

    initialize: function() {
        this.model.bind('change', this.update, this);
        this.model.bind('remove', this.remove, this);
    },

    twitter: {
        link: {
            anchor: function(str)
            {
                return str.replace(/[A-Za-z]+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+/g, function(m)
                {
                    m = m.link(m);
                    m = m.replace('href="','target="_blank" href="');
                    return m;
                });
            },
            user: function(str)
            {
                return str.replace(/[@]+[A-Za-z0-9-_]+/g, function(us)
                {
                    var username = us.replace("@","");

                    us = us.link("http://twitter.com/"+username);
                    us = us.replace('href="','target="_blank" onclick="loadProfile(\''+username+'\');return(false);"  href="');
                    return us;
                });
            },
            tag: function(str)
            {
                return str.replace(/[#]+[A-Za-z0-9-_]+/g, function(t)
                {
                    var tag = t.replace(" #"," %23");
                    t = t.link("http://summize.com/search?q="+tag);
                    t = t.replace('href="','target="_blank" href="');
                    return t;
                });
            },
            all: function(str)
            {
                str = this.anchor(str);
                str = this.user(str);
                str = this.tag(str);
                return str;
            }
        }
    },


    render: function () {


        try {
            var tpl = _.template($('#item-' + this.model.getClass() + '-template').html());
        } catch (err) {


            var tpl = _.template($('#item-normal-template').html());
        }

        if (this.model.isService()) {
            $(this.el).addClass(this.model.get('AuthorName')).removeClass('quote');
            var meta = jQuery.parseJSON(this.model.get('Meta'));

            if (this.model.get('AuthorName') == 'flickr') {


                this.model.set('Content', '<a class="service_content " href="http:'+meta.imageUrls.full+'"><img class="responsive" src="http:'+meta.imageUrls.full+'" /><p>'+this.model.get('Content')+'</p></a>');

            } else if (this.model.get('AuthorName') == 'twitter') {


                var user = '<figure class="authorImage"><img src="'+meta.user.profile_image_url+'" alt="Gravatar" /></figure>'+
                '<p class="attributes profile">'+meta.user.name+' ('+meta.user.screen_name+')'+
                '   <time>'+meta.created_at+'</time></p>';

                var text = '<p>'+this.twitter.link.all(this.model.get('Content'))+'</p>';

                var content = '<div class="service_content ">'+user+text+'</div>';
                this.model.set('Content', content);


            } else if (this.model.get('AuthorName') == 'facebook') {


                var user = '<figure class="authorImage"><img src="http://graph.facebook.com/'+meta.from.id+'/picture" alt="Gravatar" /></figure>'+
                '<p class="attributes profile">'+meta.from.name+
                '   <time>'+meta.formated_time+'</time></p>';

                var text = '<p>'+this.model.get('Content')+'</p>';

                var content = '<div class="service_content ">'+user+text+'</div>';
                this.model.set('Content', content);


            } else if (this.model.get('AuthorName') == 'instagram') {


                this.model.set('Content', '<div class="service_content "><img class="responsive" src="'+meta.images.low_resolution.url+'" /></div>');

            } else if (this.model.get('AuthorName') == 'youtube') {


                this.model.set('Content', '<iframe width="100%" height="200" src="http://www.youtube.com/embed/'+meta.id+'" frameborder="0" allowfullscreen></iframe>');

            } else if (this.model.get('AuthorName') == 'google') {

                this.model.set('noSource',1);

                if(meta.GsearchResultClass == 'GwebSearch'){

                    this.model.set('Content', '<a class="service_content" href="'+meta.unescapedUrl+'" target="_blank"><p><strong>'+meta.titleNoFormatting+'</strong></p><p class="color_dark">'+meta.content+'</p><span class="small_caption"><img class="source-icon" src="http://g.etfv.co/'+meta.url+'" />'+meta.visibleUrl+'</span></a>');
                } else if(meta.GsearchResultClass == 'GnewsSearch'){

                    var picture = '';
                    if('image' in meta){
                        if('tbUrl' in meta.image) picture = '<img class="news_thumbnail" src="'+meta.image.tbUrl+'" />';
                    }
                    this.model.set('Content', '<a class="service_content" href="'+meta.unescapedUrl+'" target="_blank"><p><strong>'+meta.titleNoFormatting+'</strong></p>'+picture+'<p class="color_dark">'+meta.content+'</p><span class="small_caption"><img class="source-icon" src="http://g.etfv.co/'+meta.unescapedUrl+'" />'+meta.publisher+'</span></a>');
                } else if(meta.GsearchResultClass == 'GimageSearch'){

                    this.model.set('Content', '<a class="service_content " href="'+meta.originalContextUrl+'"><img class="responsive" src="'+meta.unescapedUrl+'" /><p class="color_dark">'+this.model.get('Content')+'</p><span class="small_caption"><img class="source-icon" src="http://g.etfv.co/'+meta.originalContextUrl+'" />'+meta.visibleUrl+'</span></a>');
                }

            } else if (this.model.get('AuthorName') == 'soundcloud') {


                this.model.set('Content', '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F'+meta.id+'&amp;auto_play=false&amp;show_artwork=true&amp;color=ff7700"></iframe>');

            }



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