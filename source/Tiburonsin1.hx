package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Tiburonsin1 extends Enemigos 
{
	private var timeShoot:Float = 0;
	public var bullet:Bala;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = -10 * FlxG.elapsed * FlxG.updateFramerate;
		bullet = new Bala();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkBound();
		pewpew();
	}
	
	private function pewpew():Void
	{
		timeShoot += FlxG.elapsed;
		
		if (timeShoot > 1)
		{
		var bala:Bala = new Bala(x + width / 2, y + height / 2);
		FlxG.state.add(bala);
		bala.velocity.x =  -100;
		timeShoot = 0;
		}
	}
}