package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author tsgtsdg
 */
class Bala extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(6, 4, 0xffffffff);
		y -= height / 2;
		OOB();
	}
	
	private function OOB():Void
	{
		if (x >= FlxG.camera.scroll.x || x <= FlxG.camera.scroll.x)
		{
			this.destroy;
		}
	}
	
}