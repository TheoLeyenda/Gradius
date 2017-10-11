package;

import flash.display.Sprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
class PlayState extends FlxState
{
	private var wachin:Wachin;
	private var tilemap:FlxTilemap;
	private var camarita:BigBrother;
	private var textVidas:FlxText;
	private var enemyGroup:FlxTypedGroup<Enemigos>;
	private var stopGroup:FlxTypedGroup<Enemigos>;
	
	override public function create():Void
	{
		super.create();
		enemyGroup = new FlxTypedGroup<Enemigos>();
		stopGroup = new FlxTypedGroup<Enemigos>();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.lvlproto__oel);
		tilemap = loader.loadTilemap(AssetPaths.fideo__png, 16, 16, "tiles");
		loader.loadEntities(placeEntities, "entities");
		wachin = new Wachin(FlxG.width / 2 - 15, FlxG.height / 2, AssetPaths.wachin__png);
		camarita = new BigBrother(0, 0);
		Global.vidas = 3;
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.ANY);
		tilemap.setTileProperties(6, FlxObject.ANY);
		tilemap.setTileProperties(7, FlxObject.ANY);
		tilemap.setTileProperties(8, FlxObject.ANY);
		textVidas = new FlxText(0, 0, 0, "", 16);
		textVidas.pixelPerfectPosition = false;
		
		add(camarita);
		add(tilemap);
		add(wachin);
		add(enemyGroup);
		add(stopGroup);
		add(textVidas);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height); // expandir la colision a todo el tilemap
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(wachin, tilemap, collideWachinTilemap);
		FlxG.collide(wachin, stopGroup, stopWachin);
		textVidas.setPosition(FlxG.camera.scroll.x , FlxG.height - 20);
		textVidas.text = "VIDAS " + Global.vidas;
		
		if (wachin.alive == false)
		{
			camarita.setCamaraX(200);
			wachin.reset(1, FlxG.height / 2);
		}
		
		if (Global.vidas == 0)
		{
			FlxG.switchState(new PlayState());
		}
	}
	
	private function collideWachinTilemap(w:Wachin,t:FlxTilemap):Void
	{
		Global.vidas -= 1;
		wachin.kill();	
	}
	
	private function stopWachin(w:Wachin,s:Enemigos):Void
	{
		Global.camVelocityX = 0;
		wachin.velocity.x = 0;
		stopGroup.kill();
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var X:Int = Std.parseInt(entityData.get("x"));
		var Y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{
			case "Tiburonsin1":
				var e:Tiburonsin1 = new Tiburonsin1(X, Y);
				e.makeGraphic(16, 16, 0xff000080);
				enemyGroup.add(e);
			case "Boss":
				var b:Boss = new Boss(X, Y);
				b.makeGraphic(128, 128, 0xff000080);
				enemyGroup.add(b);
			case"StopWachin":
				var s:Enemigos = new Enemigos(X, Y);
				s.makeGraphic(16, 16, 0x00000000);
				stopGroup.add(s);
		}
	}
}