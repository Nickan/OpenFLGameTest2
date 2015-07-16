package data;
import haxe.xml.Fast;
import openfl.Assets;

/**
 * ...
 * @author Nickan
 */
class XmlGameManager
{
	static var _instance :XmlGameManager;
	
	var _fast:Fast;
	
	public function new() 
	{
		var string = Assets.getText("assets/adventure.xml");
		var xml = Xml.parse(string);
		_fast = new Fast(xml.firstElement());
		
		//for (node in _fast.nodes.node) {
			//trace(node.att.name);
		//}
		//var gameNode = getNode("start");
		//
		//trace(gameNode.text);
		//for (choice in gameNode.choices)
			//trace(choice.text + " " + choice.nodeToGo);
	}
	
	public function getNode(nodeName :String) {
		var gameNode :GameNode = null;
		for (node in _fast.nodes.node) {
			if (node.att.name == nodeName) {
				var fast = node.node.text;
				//trace(fast.innerData);
				// Getting the <text> content
				gameNode = new GameNode(fast.innerData);
				
				// Getting the <choice> 'node' attribute and content 
				for (choice in node.nodes.choice) {
					//trace(choice.att.node);
					//trace(choice.innerData);
					gameNode.addChoices(new Choice(choice.att.node, choice.innerData));
				}
			}
		}
		
		return gameNode;
	}
	
	public static function getInstance() {
		if (_instance == null)
			_instance = new XmlGameManager();
		return _instance;
	}
	
}