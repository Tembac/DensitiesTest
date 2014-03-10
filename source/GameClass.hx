package;

import flash.geom.Rectangle;
import flash.Lib;
import flixel.FlxGame;
import flixel.FlxState;

class GameClass extends FlxGame
{
	var gameWidth:Int = 480; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 320; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var initialState:Class<FlxState> = MenuState; // The FlxState the game starts with.
	var zoom:Float = -1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = false; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets

	//reference inspiration: http://www.shoe-box.org/blog/?p=363
	//landscape widths
	var landscape_width_ldpi:Int = 360;
	var landscape_width_mdpi:Int = 720;
	var landscape_width_hdpi:Int = 1080;
	var landscape_width_xhdpi:Int = 1280;
	var landscape_width_xxhdpi:Int = 1920;
	
	var deviceSize:Rectangle;
	
	/**
	 * You can pretty much ignore this logic and edit the variables above.
	 */
	public function new()
	{
		deviceSize = new Rectangle(0, 0,
						Math.max(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight),
						Math.min(Lib.current.stage.stageWidth, Lib.current.stage.stageHeight));
	
		set_landscape_size();
		
		//var stageWidth:Int = Lib.current.stage.stageWidth;
		//var stageHeight:Int = Lib.current.stage.stageHeight;
		//
		//if (zoom == -1)
		//{
			//var ratioX:Float = stageWidth / gameWidth;
			//var ratioY:Float = stageHeight / gameHeight;
			//zoom = 1;//Math.min(ratioX, ratioY);
			//gameWidth = Math.ceil(stageWidth / zoom);
			//gameHeight = Math.ceil(stageHeight / zoom);
		//}
		//Reg.assets_dir = "assets/images/ldpi/";
		//Reg.density_scale = zoom;
		//Lib.trace(zoom);
		
		
		super(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen);
	}
	
	private function set_landscape_size():Void
	{
		//landscape 
		if (deviceSize.width <= landscape_width_ldpi)
		{
			gameWidth = 360;
			gameHeight = 240;
			Reg.assets_dir = "assets/images/ldpi/";
			Reg.density_scale = 0.75;
			return;
		}	
		if (deviceSize.width <= landscape_width_mdpi)
		{
			gameWidth = 480;
			gameHeight = 320;
			Reg.assets_dir = "assets/images/mdpi/";
			Reg.density_scale = 1;
			return;
		}
		if (deviceSize.width <= landscape_width_hdpi)
		{
			gameWidth = 720;
			gameHeight = 480;
			Reg.assets_dir = "assets/images/hdpi/";
			Reg.density_scale = 1.5;
			return;
		}
		if (deviceSize.width <= landscape_width_xhdpi)
		{
			gameWidth = 1080;
			gameHeight = 720;
			Reg.assets_dir = "assets/images/xhdpi/";
			Reg.density_scale = 2.25;
			return;
		}
		//if (deviceSize.width <= landscape_width_xxhdpi)
		{
			gameWidth = 1440;
			gameHeight = 960;
			Reg.assets_dir = "assets/images/xxhdpi/";
			Reg.density_scale = 3;
			return;
		}
	}
}
