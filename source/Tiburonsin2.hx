package;

import flixel.FlxG;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Tiburonsin2 extends Enemigos 
{
	private var timeShoot:Float = 0;
	public var bullet:Bala;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, 0xFF3E4D3A);
		velocity.x = -20;
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
		
		if (timeShoot > 2)
		{
		var bala:Bala = new Bala(x + width / 2, y + height / 2);
		FlxG.state.add(bala);
		bala.velocity.x = - 100;
		bala.velocity.y = 100;
		timeShoot = 0;
		}
	}
}