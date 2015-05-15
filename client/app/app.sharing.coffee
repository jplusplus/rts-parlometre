angular
  .module 'rtsDialectsApp'
    .config ($fbProvider, $twtProvider, app)->
      # Init Facebook with an ip id
      $fbProvider.init app.sharing.appid
      # Init Twitter
      $twtProvider.init().trimText yes
