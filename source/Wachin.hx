package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Chimi
 */
class Wachin extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movimiento();
	}
	
	private function movimiento():Void
	{
		var velocidad:Int;
		velocidad = 4;
		if(FlxG.keys.pressed.D){
			x = x + velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.A){
			x = x - velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.S){
			y = y + velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.W){
			y = y - velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
	}
	
}
