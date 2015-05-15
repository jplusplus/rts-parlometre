run:
	grunt serve

build:
	grunt build

install:
	npm install
	bower install

staging: build
	grunt buildcontrol:heroku
