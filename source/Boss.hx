package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Boss extends Enemigos 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.y = Global.VelB;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		checkBound();
		
		if (y >= FlxG.camera.scroll.y + 232)
		{
			velocity.y *=-1 ;
			y = FlxG.camera.scroll.y + 232;
		}
		if (y <= FlxG.camera.scroll.y) 
		{
			velocity.y *=-1 ;
			y = FlxG.camera.scroll.y;
		}
	}
	
}