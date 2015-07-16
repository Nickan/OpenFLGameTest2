package event;
import openfl.events.Event;

/**
 * ...
 * @author Nickan
 */
class GameEvent extends Event
{
	public static inline var SHOW_GAME_NODE :String = "Show game node";
	public static inline var GAME_OVER :String = "game over";
	public static inline var CREATE_NEW_GAME :String = "create new game";
	
	public var nodeToGoNext(default, null) :String;
	
	public function new(type :String, bubbles :Bool = false, cancelable :Bool = false, nodeToGoNext :String = "") 
	{
		super(SHOW_GAME_NODE, bubbles, cancelable);
		this.nodeToGoNext = nodeToGoNext;
	}
	
}