package event;
import openfl.events.Event;

/**
 * ...
 * @author Nickan
 */
class GameOverEvent extends Event
{
	public static inline var GAME_OVER :String = "game over";
	
	public function new(type :String, bubbles :Bool = false, cancelable :Bool = false) 
	{
		super(type, bubbles, cancelable);
	}
	
}