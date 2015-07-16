package sprites;
import data.GameNode;
import event.GameEvent;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Nickan
 */
class GameNodeSprite extends Sprite
{
	var _gameNode :GameNode;
	
	public function new(gameNode :GameNode) 
	{
		super();
		_gameNode = gameNode;
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		setupGameText(_gameNode.text);
		setupButtons();
	}
	
	function setupGameText(text:String) 
	{
		var textFormat = new TextFormat("Verdana", 45, 0xFFFFFF, true, true, true);
		textFormat.align = TextFormatAlign.CENTER;
		
		var textField = new TextField();
		//textField.x = stage.stageWidth * 0.5;
		textField.y = stage.stageHeight * 0.2;
		textField.width = stage.stageWidth;
		textField.defaultTextFormat = textFormat;
		textField.text = text;
		addChild(textField);
	}
	
	function setupButtons() 
	{
		var STARTING_X :Float = stage.stageWidth * 0.5;
		var STARTING_Y :Float = stage.stageHeight * 0.4;
		
		var normalBitmap = Assets.getBitmapData("assets/button/button_normal.png");
		var overBitmap = Assets.getBitmapData("assets/button/button_over.png");
		var pressedBitmap = Assets.getBitmapData("assets/button/button_pressed.png");
		
		for (index in 0..._gameNode.choices.length) {
			var choicesNode = _gameNode.choices[index];
			var textButton = new TextButton(choicesNode.text, new Bitmap(normalBitmap), new Bitmap(overBitmap), 
												new Bitmap(pressedBitmap), new Bitmap(overBitmap), onButtonDown, choicesNode.nodeToGo);
			addChild(textButton);
			textButton.x = STARTING_X - (textButton.width * 0.5);
			textButton.y = (STARTING_Y - (textButton.height * 0.5)) + (textButton.height * 2) * index;
		}
	}
	
	function onButtonDown(nodeNameToGoNext :String) 
	{
		dispatchEvent(new GameEvent(GameEvent.SHOW_GAME_NODE, false, false, nodeNameToGoNext));
		//trace(nodeNameToGoNext);
	}
	
}