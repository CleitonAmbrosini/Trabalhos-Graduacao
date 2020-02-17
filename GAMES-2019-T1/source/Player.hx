/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */

package;

import flixel.util.FlxColor;
import flixel.system.FlxAssets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import haxe.Timer;
import flixel.group.FlxGroup;
import flixel.FlxObject;


class Player extends FlxSprite{

	// Movements
	private var _jump:Float = 0;
	private var _jumpPressed:Bool = false;	
	private var _playerRun:FlxSound;

	// Position
	private var  _playerOnFloor:Float = FlxG.initialHeight - 255;

	// Bullets
	public static inline var BULLET_SPEED:Int = 800;
	public static inline var GUN_DELAY:Float = 0.4;
	public var _bullets:FlxTypedGroup<Bullet>;
	public var _blt:Bullet;
	public var _cooldown:Float;

	// Game Over
	private var _timerLose:Timer;
	private var _timer:Timer;	
	private var _youLose:FlxSound;
	private var _arcadeGameOver:FlxSound;

    /**
     * This function is called when the player is instancied
     */
    public function new(x:Int, y:Int, Bullets:FlxTypedGroup<Bullet>){
        super(x,y);

		// Player
		loadGraphic(AssetPaths.spritePlayer__png, true, 158, 209);
		_bullets = Bullets;
		_cooldown = GUN_DELAY;
		health = 10;

		// Sounds
		_playerRun = FlxG.sound.load(FlxAssets.getSound("assets/sounds/playerRun"), true, false);
		_youLose = FlxG.sound.load(FlxAssets.getSound("assets/sounds/youlose"));
		_arcadeGameOver = FlxG.sound.load(FlxAssets.getSound("assets/sounds/arcadeGameOver"), false, false);
		
		// Game Over
		_timerLose = new Timer(4000);	
		_timer = new Timer(6000);

		// Bounding box 
		width = 6;
		height = 100;
		offset.set(1, 1);

		// animations
		animation.add("Run",  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 30, true);
		animation.add("Jump", [20, 21, 22, 23, 24, 25, 26, 27, 28], 30, true);
		animation.add("Stop", [29], 30, true);
		animation.add("Shooting", [30, 31, 32, 33], 3, true);
    	}
	/**
	 * Override the main function Kill for call the FiniashState.
	 * And to play effects
	 * */
	override public function kill():Void{
		cast(FlxG.state,PlayGameState)._soundBackground.stop();
		FlxG.camera.fade(FlxColor.BLACK, 4, false, function(){
    		FlxG.switchState(new FinishState());
		});
		_arcadeGameOver.play();
		_timerLose.run = function(){
			_youLose.play();			
		}
		_timer.run = function(){
			_youLose.kill();
		}
		super.kill();
	}

	/**
	 * Control the movements and the animations of the sprite player
	 */
	override public function update(elapsed:Float):Void
	{		
		if(FlxG.keys.justPressed.W){
			_jumpPressed = true;
			animation.play("Jump");
		}
		if(_jumpPressed){
			_jump += FlxG.elapsed; // control the jump height
			if(_jump < 0.4){
				velocity.y = -600;
			}
			else if(this.y < _playerOnFloor) {
				velocity.y = 1000;
			}
			else{
				velocity.y = 0;
				this.y = _playerOnFloor;
				_jumpPressed = false;
				_jump = 0;
			}
		}
		if (FlxG.keys.pressed.D && cast(FlxG.state,PlayGameState)._background.velocity.x != 0){
			animation.play("Run");
			_playerRun.play();
		}
		else if((this.y == _playerOnFloor) && (_jumpPressed == false)){
			animation.play("Stop");
			_playerRun.stop();
		}

		if (FlxG.mouse.justPressed){
			shoot();
		}
		if(FlxG.mouse.pressed){
			animation.play("Shooting");
		}

		_cooldown += elapsed;

		super.update(elapsed);
	}

	/**
	 * Function where the bullets is controlled
	 */
	function shoot():Void{
		// Prepare some variables to pass on to the bullet
		var bulletX:Int = Math.floor(x);
		var bulletY:Int = Math.floor(y + 4);
		var bXVeloc:Int = 0;
		
		if (_cooldown >= GUN_DELAY)
		{
			_blt = _bullets.recycle(Bullet.new);
			
			if (_blt != null)
			{
				if (flipX)
				{
					// nudge it a little to the side so it doesn't emerge from the middle
					bulletX -= Math.floor(_blt.width - 8); 
					bXVeloc = -BULLET_SPEED;
				}
				else
				{
					bulletX += Math.floor(width - 8);
					bXVeloc = BULLET_SPEED;
				}
				
				_blt.shoot(bulletX, bulletY, bXVeloc);
				// reset the shot clock
				_cooldown = 0; 
			}
		}
	}

}

