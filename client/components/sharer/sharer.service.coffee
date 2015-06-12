angular
  .module 'rtsDialectsApp'
    .service 'Sharer', ($state, $fb, $twt, app)->
      class Sharer
        constructor: (@result)->
          # Get the absolute URL of the current state
          @url = $state.href 'main.outro', { hash: $state.params.hash }, { absolute: yes }
          # Cantons list
          @cantons = _.reduce @result.cantons, (result, value, code)->
            # Create a new object for each canton
            result.push angular.extend({ code: code, value: value }, app.cantons[code])
            result
          # We have to transform the cantons object to a an array
          , []
          # Sort canton list by value
          @cantons = _.sortBy @cantons, (c)-> -1 * c.value
        # Return an object
        url: @url
        # Facebook's sharing
        fb: =>
          $fb.feed
            name: "Je parle français comme les " + @cantons[0].demonym + "."
            description: "Le Parlomètre romand - RTS"
            link: @url
            picture: app.sharing.url + "/assets/images/rts-red.jpg"
        # Twitter's sharing
        tw: =>
          $twt.intent 'tweet',
            text: "Je parle français comme les " + @cantons[0].demonym + "."
            url: @url


