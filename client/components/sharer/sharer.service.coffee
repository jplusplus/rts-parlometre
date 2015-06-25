angular
  .module 'rtsDialectsApp'
    .service 'Sharer', ($state, $fb, $twt, app)->
      class Sharer
        constructor: (@result={})->
          # Get the absolute URL of the current state
          @url = $state.href 'main.outro', { hash: $state.params.hash }, { absolute: yes }
          # Cantons list
          @cantons = @result.cantons  ? []
        # Return an object
        url: @url
        title: =>
          if @cantons.length
            "Je parle " + @cantons[0].adjective + " à " + Math.round(@cantons[0].value*100) + "%"
          else
            "Où sont les Suisses qui parlent comme vous ?"
        # Facebook's sharing
        fb: =>
          $fb.feed
            name: do @title
            description: "Dites-nous comment vous parlez et nous vous dirons d'où vous venez !"
            link: @url
            picture: app.sharing.url + "/assets/images/share.png"
        # Twitter's sharing
        tw: =>
          $twt.intent 'tweet',
            text: [do @title, @url, "#parlometre"].join ' '


