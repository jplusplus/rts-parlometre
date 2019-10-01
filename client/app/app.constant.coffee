angular
  .module 'rtsDialectsApp'
    .constant 'app',
      sharing:
        appid: '662081797256496'
        url: 'http://www.parlometre.ch'
      cdn:
        location: '//pirhoo.github.io/rts-parlometre-assets/answers/'
      generator:
        # Non-cached endpoint
        location: '//rts-parlometre-generator.herokuapp.com/custom/distance/'
        # Cached endpoint (using Varnish)
        # location: '//rts-parlometre-generator-herokuapp-com.global.ssl.fastly.net/custom/distance/'
        proxy: '/api/answers/proxy/'
      cantons:
        BE:
          demonym: 'Bernois'
          label: 'Berne'
          adjective: 'jurasso-bernois'
        FR:
          demonym: 'Fribourgeois'
          label: 'Fribourg'
          adjective: 'fribourgeois'
        GE:
          demonym: 'Genevois'
          label: 'Genève'
          adjective: 'genevois'
        JU:
          demonym: 'Jurassiens'
          label: 'Jura'
          adjective: 'jurassien'
        NE:
          demonym: 'Neuchâtelois'
          label: 'Neuchâtel'
          adjective: 'neuchâtelois'
        VD:
          demonym: 'Vaudois'
          label: 'Vaud'
          adjective: 'vaudois'
        VS:
          demonym: 'Valaisans'
          label: 'Valais'
          adjective: 'valaisan'
      map:
        pixels: 10000
        domain: [0, 15]
        colors: [
          "#0080ff"
          "#7fbfff"
          "#fff2cc"
          "#ff7a7a"
          "#ff4d4d"
        ]
