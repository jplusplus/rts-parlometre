angular
  .module 'rtsDialectsApp'
    .service 'Sharer', ($state, $fb, $twt, app)->
      class Sharer
        constructor: (@result={})->
          # Get the absolute URL of the current state
          @url = $state.href 'main.outro', { hash: $state.params.hash }, { absolute: yes }
          # Check that we have cantons
          @result.cantons = @result.cantons ? []
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
        title: =>
          if @cantons.length
            "Je parle français comme les " + @cantons[0].demonym
          else
            "Où sont les Suisses qui parlent comme vous ?"
        # Facebook's sharing
        fb: =>
          $fb.feed
            name: do @title
            description: "Le Parlomètre romand - RTS"
            link: @url
            picture: app.sharing.url + "/assets/images/share.png"
        # Twitter's sharing
        tw: =>
          $twt.intent 'tweet',
            text: do @title
            url: @url


