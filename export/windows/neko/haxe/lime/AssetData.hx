package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/Gradius.oep", "assets/data/Gradius.oep");
			type.set ("assets/data/Gradius.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/LEVEL.oel", "assets/data/LEVEL.oel");
			type.set ("assets/data/LEVEL.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/lvlproto.oel", "assets/data/lvlproto.oel");
			type.set ("assets/data/lvlproto.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Bala.png", "assets/images/Bala.png");
			type.set ("assets/images/Bala.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fideo.png", "assets/images/fideo.png");
			type.set ("assets/images/fideo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/jhmvfdsuhdfsjbfsd.psd", "assets/images/jhmvfdsuhdfsjbfsd.psd");
			type.set ("assets/images/jhmvfdsuhdfsjbfsd.psd", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/images/PruevaScrolling.png", "assets/images/PruevaScrolling.png");
			type.set ("assets/images/PruevaScrolling.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tiles.png", "assets/images/Tiles.png");
			type.set ("assets/images/Tiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/wachin.png", "assets/images/wachin.png");
			type.set ("assets/images/wachin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
