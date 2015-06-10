angular
  .module 'rtsDialectsApp'
    .constant 'app',
      sharing:
        appid: '662081797256496'
        url: 'http://parlometre.ch'
      cdn:
        location: '//s3-eu-west-1.amazonaws.com/parlometre/hashes/'
      map:
        pixels: 10000
        domain: [0, 15]
        colors: [
          "#ffffff"
          "#0080ff"
          "#7fbfff"
          "#fff2cc"
          "#ffa6a6"
          "#ff7a7a"
          "#ff4d4d"
        ]
