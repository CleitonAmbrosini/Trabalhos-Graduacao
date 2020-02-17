/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */

package;

import flixel.system.FlxAssets;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.system.FlxSound;

/**
 * The FlxState of game's menu.
 */
class MenuState extends FlxState
{
	// Vars
	private var _playButton:FlxButton;
	private var _creditsButton:FlxButton;
	private var _menuBackground:FlxSprite;
    private var _soundMenu:FlxSound;
	
	/**
	 * Create function, when almost everything is initialized.
	 * Is this the first function to be called. 
	 */
	override public function create():Void
	{
		
		FlxG.mouse.useSystemCursor = true;

		_soundMenu = FlxG.sound.load(FlxAssets.getSound("assets/music/abertura"), false, false);
		_soundMenu.play();

		_menuBackground = new FlxSprite();
		_menuBackground.loadGraphic(AssetPaths.backgroundMenu__png);
		add(_menuBackground);		
		
		super.create();
	}
	
	/**
	 * This is called when this state is destroyed. 
	 * All the objects needied to be finish here, for the well of the memory.
	 */
	override public function destroy():Void{
		
		_playButton = null;
		_creditsButton = null;
		_soundMenu.destroy();
		_menuBackground.destroy();		
		
		super.destroy();
	}

	/**
	 * This function is called once time for frame.
	 * Normally in a second is called 30 times per second.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
			/** Here they are the buttons of the Main Menu.
			 * Is setting the position and function tha will be called when the click;
			 * After that the other information like hit box etc.
			 * Those buttons need to be here because in each frame is possible to have a click. 
			*/
			_playButton = new FlxButton(FlxG.width / 2 - 70, FlxG.height / 2, playTheGame);
			_playButton.loadGraphic("assets/images/button_play_on.png");
			_playButton.width = 166;
			_playButton.height = 46;
			add(_playButton);
			
			_creditsButton = new FlxButton(_playButton.x, _playButton.y + 90, creditsTheGame);
			_creditsButton.loadGraphic("assets/images/button_credits_on.png");
			_creditsButton.width = 166;
			_creditsButton.height = 46;
			add(_creditsButton);
		
	}
	
	/**
	 * Funtions to pass states when have a button click
	 */
	function playTheGame():Void{
		FlxG.switchState(new PlayGameState());
	}

	function creditsTheGame(){
		FlxG.switchState(new CreditsGame());		
	}
}