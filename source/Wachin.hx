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
	private var bulletTime :Float;
	private var timeToShoot:Bool;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = 0;
		velocity.y = 0;
		bulletTime = 0;
		pixelPerfectPosition = false;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movimiento();
		limite();
		shoot();
		
		
		if (timeToShoot == false)
		{
			bulletTime += elapsed;
		}
		
		if (bulletTime > 0.3)
		{
			timeToShoot = true;
			bulletTime = 0;
		}
	}
	private function shoot():Void
	{
		if (FlxG.keys.pressed.J && timeToShoot) 
		{
			var bala:Bala = new Bala(x + width / 2, y + height / 2);
			FlxG.state.add(bala);
			bala.velocity.x = 400;
			timeToShoot = false;
			
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
		if (x >= FlxG.camera.scroll.x + FlxG.width)
		{
			
			x = FlxG.camera.scroll.x + FlxG.width;
		}
		
		if (y >= FlxG.camera.scroll.y + FlxG.height)
		{
			velocity.y = 0;
			y = FlxG.camera.scroll.y + FlxG.height;
		}
		
		if (x <= FlxG.camera.scroll.x)
		{
			x = FlxG.camera.scroll.x;
		}
		
		if (y <= FlxG.camera.scroll.y)
		{
			velocity.y = FlxG.camera.y;
			y = FlxG.camera.scroll.y;
		}
		
	}
}
