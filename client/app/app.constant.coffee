angular
  .module 'rtsDialectsApp'
    .constant 'app',
      sharing:
        appid: '662081797256496'
        url: 'http://www.parlometre.ch'
      cdn:
        location: '//s3-eu-west-1.amazonaws.com/parlometre/'
      generator:
        # Non-cached endpoint
        # location: '//rts-parlometre-generator.herokuapp.com/custom/distance/'
        # Cached endpoint (using Varnish)
        location: '//rts-parlometre-generator-herokuapp-com.global.ssl.fastly.net/custom/distance/'
      cantons:
        BE:
          demonym: 'Bernois'
          label: 'Berne'
        FR:
          demonym: 'Fribourgeois'
          label: 'Fribourg'
        GE:
          demonym: 'Genevois'
          label: 'Genève'
        JU:
          demonym: 'Jurassiens'
          label: 'Jura'
        NE:
          demonym: 'Neuchâtelois'
          label: 'Neuchâtel'
        VD:
          demonym: 'Vaudois'
          label: 'Vaud'
        VS:
          demonym: 'Valaisans'
          label: 'Valais'
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
