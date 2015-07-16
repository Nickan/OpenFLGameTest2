package;

import event.GameEvent;
import event.GameOverEvent;
import event.TitleEvent;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import sprites.GameScreenSprite;
import sprites.TitleScreenSprite;


class Main extends Sprite {
	
	var _titleScreen :TitleScreenSprite;
	var _gameScreen :GameScreenSprite;
	
	public function new () {
		
		super ();
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		onCreateTitleScreen();
	}
	
	function onCreateTitleScreen() 
	{
		_titleScreen = new TitleScreenSprite();
		addChild(_titleScreen);
		_titleScreen.addEventListener(TitleEvent.GO_TO_GAME_SCREEN, onCreateNewGame);
	}
	
	
	private function onCreateNewGame(e:TitleEvent):Void 
	{
		_titleScreen.removeEventListener(GameEvent.CREATE_NEW_GAME, onCreateNewGame);
		removeChild(_titleScreen);
		_titleScreen = null;
		onCreateGameScreen();
	}
	
	function onCreateGameScreen() 
	{
		_gameScreen = new GameScreenSprite();
		addChild(_gameScreen);
		_gameScreen.addEventListener(GameOverEvent.GAME_OVER, onGameOver);
	}
	
	private function onGameOver(e:GameOverEvent):Void 
	{
		_gameScreen.removeEventListener(GameOverEvent.GAME_OVER, onGameOver);
		removeChild(_gameScreen);
		_gameScreen = null;
		
		Timer.delay(onCreateTitleScreen, 100);
		//onCreateTitleScreen();
	}

}