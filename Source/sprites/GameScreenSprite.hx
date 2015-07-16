package sprites;
import data.GameNode;
import data.XmlGameManager;
import event.GameEvent;
import event.GameOverEvent;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author Nickan
 */
class GameScreenSprite extends Sprite
{
	var _currentNodeSprite :GameNodeSprite;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		showNode("start");
	}
	
	private function onShowNode(e:GameEvent):Void 
	{
		if (e.nodeToGoNext == "back to title screen") {
			_currentNodeSprite.removeEventListener(GameEvent.SHOW_GAME_NODE, onShowNode);
			dispatchEvent(new GameOverEvent(GameOverEvent.GAME_OVER));
			
			return;
		}
		
		
		if (_currentNodeSprite != null) {
			_currentNodeSprite.removeEventListener(GameEvent.SHOW_GAME_NODE, onShowNode);
			removeChild(_currentNodeSprite);
		}
		showNode(e.nodeToGoNext);
	}
	
	function showNode(nodeName :String) 
	{
		var gameNode = XmlGameManager.getInstance().getNode(nodeName);
		_currentNodeSprite = new GameNodeSprite(gameNode);
		_currentNodeSprite.addEventListener(GameEvent.SHOW_GAME_NODE, onShowNode);
		addChild(_currentNodeSprite);
	}
	
}