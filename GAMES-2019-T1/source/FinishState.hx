/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */

package;

import flash.system.System;
import flixel.system.FlxAssets;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxSound;
import haxe.Timer;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

/**
 * Game Over State. Basically the final menu
 */
class FinishState extends FlxState{

	private var _soundFinish:FlxSound;
	private var _shakeTimer:Timer;
	private var _mainMenu:FlxButton;
	private var _youLose:FlxSprite;

	
	override public function create():Void{		
		FlxG.cameras.bgColor = 0xff000000;

		//every 3 seconds the screen shakes
		_shakeTimer = new Timer(3000);  
		_shakeTimer.run = function(){
			_youLose.camera.shake(0.001, 0.5);
		}

		// Title
		_youLose = new FlxSprite();
		_youLose.loadGraphic("assets/images/youlose.png");
		_youLose.x = 160;
		_youLose.y = 100;
		add(_youLose);		

		// Background sad sound
		_soundFinish = FlxG.sound.load(FlxAssets.getSound("assets/sounds/musicFinish"), true, false);
		_soundFinish.play();

		super.create();
	}

	/**
	 * This function is called once time for frame.
	 */
	override public function update(elapsed:Float):Void{
		/** Here they are the buttons of the Main Menu.
		* Is setting the position and function tha will be called when the click;
		* After that the other information like hit box etc.
		* Those buttons need to be here because in each frame is possible to have a click. 
		*/		
		_mainMenu = new FlxButton(FlxG.width / 2 - 90, FlxG.height / 2, mainMenu);
		_mainMenu.loadGraphic("assets/images/mainMenu.png");
		_mainMenu.width = 194;
		_mainMenu.height = 39;
		add(_mainMenu);
		
		super.update(elapsed);
	}
	
	/**
	 * Funtions to pass states when have a button click
	 */
	public function mainMenu(){
		FlxG.switchState(new MenuState());
	}

}