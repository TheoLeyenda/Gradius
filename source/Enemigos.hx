package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Enemigos extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		pixelPerfectPosition = false;
	}
	
	private function checkBound():Void
	{
		 if (x > FlxG.camera.scroll.x + FlxG.width || x < FlxG.camera.scroll.x || y > FlxG.camera.scroll.y + FlxG.height || y < FlxG.camera.scroll.y)
		{
			kill();
		}
	}
	
}