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
	private var velocidad:Int;
	private var bulletTime :Int;
	private var timeToShoot:Bool;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		bulletTime = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movimiento();
		//limite();
		shoot();
		timeToShoot = false;
		bulletTime++;
		if (bulletTime == 25)
		{
			bulletTime = 0;
		}
	}
	private function shoot():Void
	{
		if (FlxG.keys.pressed.J) 
		{
			if (bulletTime == 0) 
			{
				var bala:Bala = new Bala(x + width / 2, y + height / 2);
				FlxG.state.add(bala);
			}
		}
		
	}
	private function movimiento():Void
	{
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
	private function limite():Void
	{
		if (x >= FlxG.camera.scroll.x-width)
		{
			x= FlxG.camera.scroll.x-width;
		}
		if (x <= FlxG.camera.scroll.x)
		{
			x = FlxG.camera.scroll.x;
		}
		if (y <= FlxG.camera.scroll.y)
		{
			y = FlxG.camera.scroll.y;
		}
		if (y >= FlxG.camera.scroll.y-height)
		{
			y = FlxG.camera.scroll.y-height;
		}
	}
}
