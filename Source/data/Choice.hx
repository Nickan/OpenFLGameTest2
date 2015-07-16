package data;

/**
 * ...
 * @author Nickan
 */
class Choice
{
	public var nodeToGo(default, null) :String;
	public var text(default, null) :String;
	
	public function new(nodeToGo :String, text :String) 
	{
		this.nodeToGo = nodeToGo;
		this.text = text;
	}
	
}