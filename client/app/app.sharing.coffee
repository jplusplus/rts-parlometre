angular
  .module 'rtsDialectsApp'
    .config ($fbProvider, $twtProvider, uiZeroclipConfigProvider, app)->
      # Init Facebook with an ip id
      $fbProvider.init app.sharing.appid
      # Init Twitter
      $twtProvider.init().trimText yes
      # Config ZeroClipboard
      uiZeroclipConfigProvider.setZcConf
        swfPath: 'bower_components/zeroclipboard/dist/ZeroClipboard.swf'
