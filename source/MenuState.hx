package;

import flash.Lib;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	//fps
	private var _times:Array<Float>;	
	private var _fpsCounter:FlxText;
	
	private var txt_screenSize:FlxText;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		FlxG.cameras.bgColor = 0xff70c4ce;
		
		var grid:FlxSprite = new FlxSprite(0, 0, Reg.assets_dir + "grid.png");
		//grid.setPosition(20 * Reg.density_scale, 20 * Reg.density_scale);
		add(grid);
		
		var sprite_test:FlxSprite = new FlxSprite(0, 0, Reg.assets_dir + "sprite_test.png");
		sprite_test.setPosition(80 * Reg.density_scale, 80 * Reg.density_scale);
		add(sprite_test);
		
		_fpsCounter = new FlxText(0, 30* Reg.density_scale, FlxG.width, "FPS: " + 30);
		_fpsCounter.setFormat(null, 22 * Reg.density_scale, FlxColor.RED, "center");
		add(_fpsCounter);
		_times = [];
		
		txt_screenSize = new FlxText(0, FlxG.height - 80 * Reg.density_scale, FlxG.width, "Game width: " + FlxG.width + " height: " + FlxG.height 
									+ "\nScreen width: " + FlxG.stage.stageWidth + "height: " + FlxG.stage.stageHeight
									+ "\nPath: " + Reg.assets_dir);
		txt_screenSize.setFormat(null, 18 * Reg.density_scale, FlxColor.BLUE, "center");
		add(txt_screenSize);
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
				var t = Lib.getTimer();
		
		var now:Float = t / 1000;
		_times.push(now);
		
		while (_times[0] < now - 1)
		{
			_times.shift();
		}
		
		_fpsCounter.text = "FPS: " + _times.length + "/" + Lib.current.stage.frameRate;
	}	
	
		
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}
}