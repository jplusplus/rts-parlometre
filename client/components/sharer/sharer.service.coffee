angular
  .module 'rtsDialectsApp'
    .service 'Sharer', ($state, $fb, $twt, app)->
      class Sharer
        constructor: (@result)->
          # Get the absolute URL of the current state
          @url = $state.href 'main.outro', { hash: $state.params.hash }, { absolute: yes }
        # Return an object
        url: @url
        # Facebook's sharing
        fb: =>
          $fb.feed
            name: "Le Parlomètre romand - RTS"
            description: "Je parle français comme les habitants de Fribourg"
            link: @url
            picture: app.sharing.url + "/assets/images/rts-red.jpg"
        # Twitter's sharing
        tw: =>
          $twt.intent 'tweet',
            text: 'Je parle français comme les habitants de Fribourg'
            url: @url


