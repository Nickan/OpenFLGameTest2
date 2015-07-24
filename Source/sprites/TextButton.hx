package sprites;
import lime.project.SplashScreen;
import openfl.display.DisplayObject;
import openfl.display.SimpleButton;
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
class TextButton extends Sprite
{
	var _text :String;
	var _textToReturn :String;
	var _simpleButton :SimpleButton;
	var _functionToCallOnButtonDown :String->Void;
	
	public function new(text :String, upState :DisplayObject = null, overState :DisplayObject = null, 
							downState :DisplayObject = null, hitTestState :DisplayObject = null, 
							functionToCallOnButtonDown :String->Void, textToReturn :String) 
	{
		super();
		//super(upState, overState, downState, hitTestState);
		_simpleButton = new SimpleButton(upState, overState, downState, hitTestState);
		_text = text;
		_functionToCallOnButtonDown = functionToCallOnButtonDown;
		_textToReturn = textToReturn;
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		setupSimpleButton();
		setupText();
	}
	
	function setupSimpleButton() 
	{
		addChild(_simpleButton);
		if (_simpleButton.hitTestState == null)
			_simpleButton.hitTestState = _simpleButton.upState;
		_simpleButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		if (_functionToCallOnButtonDown != null)
			_functionToCallOnButtonDown(_textToReturn);
		dispose();
	}
	
	function setupText() 
	{
		var textFormat = new TextFormat("Verdana", 30, 0x00FF00);
		textFormat.align = TextFormatAlign.CENTER;
		
		var textField = new TextField();
		textField.width = _simpleButton.width;
		textField.autoSize = TextFieldAutoSize.CENTER;
		textField.text = _text;
		textField.mouseEnabled = false;
		addChild(textField);
		var textBounds = textField.getBounds(textField);
		#if html5
			textField.x = width * 0.5 - textField.width * 0.5;
		#end
		textField.y = (textBounds.height * 0.5);
	}
	
	public function dispose() {
		_simpleButton.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		_functionToCallOnButtonDown = null;
	}
	
}