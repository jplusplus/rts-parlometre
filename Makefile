run:
	grunt serve

build:
	grunt build

deploy: build
	grunt buildcontrol:heroku

install:
	npm install
	bower install
