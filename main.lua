local composer = require( "composer" )

soundBackdround = audio.loadSound( "SoundBackground.mp3" )
soundChanel = audio.play( soundBackdround, {loops = -1} )

isCheckSound = true

countPage = 1
countTextImage = 2
isTextView = true

w = display.actualContentWidth
h = display.actualContentHeight

if h/w > 1.34 then
	arrowHeight = 9
	arrowWidth = 15
	typeFile = "@2"
	widthRightRect = w + w/4
	widthLeftRect = h-w-w/4
else
	arrowHeight = 10
	arrowWidth = 15
	typeFile = ""
	widthRightRect = w
	widthLeftRect = h-w
end

--скрытие статус бара 
display.setStatusBar( display.HiddenStatusBar )

--переход на главную сцену
composer.gotoScene( "pages.homePage" )