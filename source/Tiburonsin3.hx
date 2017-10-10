package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Tiburonsin3 extends Enemigos 
{
	private var timeShoot:Float = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, 0xFF3E4D3A);
		velocity.x = -30;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkBound();
	}

}