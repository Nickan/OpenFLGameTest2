package data;

/**
 * ...
 * @author Nickan
 */
class GameNode
{
	public var text(default, null) :String;
	public var choices(default, null) :Array<Choice>;
	
	public function new(text :String) 
	{
		this.text = text;
		choices = [];
	}
	
	public function addChoices(choice :Choice)
	{
		choices.push(choice);
	}
	
}