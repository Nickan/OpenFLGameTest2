package sprites;
import event.GameEvent;
import event.TitleEvent;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Nickan
 */
class TitleScreenSprite extends Sprite
{

	public function new() 
	{
		super();
		
		
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}

	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		setupBackground();
		setupGameTitle();
	}
	
	function setupBackground() 
	{
		graphics.beginFill(0x808080);
		graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		graphics.endFill();
	}
	
	function setupGameTitle() 
	{
		var textFormat = new TextFormat("Verdana", 30, 0x80FFFF);
		textFormat.align = TextFormatAlign.CENTER;
		
		var textField = new TextField();
		textField.defaultTextFormat = textFormat;
		textField.text = "Title Screen";
		textField.width = stage.stageWidth;
		textField.mouseEnabled = false;
		textField.autoSize = TextFieldAutoSize.CENTER;
		textField.y = stage.stageHeight * 0.5;
		addChild(textField);
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		Timer.delay(dispatch, 500);
		
		//...
		trace("Create new game");
	}
	
	function dispatch() 
	{
		dispatchEvent(new TitleEvent(TitleEvent.GO_TO_GAME_SCREEN));
	}
	
}