package event;
import openfl.events.Event;

/**
 * ...
 * @author Nickan
 */
class TitleEvent extends Event
{
	public static inline var GO_TO_GAME_SCREEN :String = "go game";
	
	public function new(type :String, bubbles :Bool = false, cancelable :Bool = false) 
	{
		super(type, bubbles, cancelable);
	}
	
}