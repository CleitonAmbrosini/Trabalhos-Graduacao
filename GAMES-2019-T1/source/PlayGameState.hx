/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */

package;

import openfl.text.TextFormat;
import flixel.system.FlxAssets;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.addons.display.FlxBackdrop;
import openfl.text.TextField;
import flixel.ui.FlxBar;
import haxe.Timer;
import flixel.group.FlxGroup;

/**
 * This is where it all happens
 */
class PlayGameState extends FlxState{
    //  World 
    private var _ground:FlxSprite;
    public var _background:FlxBackdrop;
    private var _y:Int = FlxG.initialHeight - 255;
    private var _x:Int = FlxG.initialWidth;
    public var _soundBackground:FlxSound;

    // Enemies    
    private var _player:Player;
    private var _robot:Enemies;
    private var _boy:Enemies;
    private var _ninjaGirl:Enemies;
    private var _bird:Enemies;
    private var _enimies:FlxTypedGroup<Enemies>;

    // Bullets
    private var _bullets:FlxTypedGroup<Bullet>;
	private var _badbullets:FlxTypedGroup<Bullet>;
    
	// Player Movements
	private var jump:Float = 0;
	private var jumped:Bool = false;
    private var _go:Int = 0;
    private var _runForrest:Int = 0;
    private var _goText:TextField;
    private var _soundGo:FlxSound;

    // Life Player
    private var _healthBar:FlxBar;
    private var _heart:FlxSprite;
    
    // Score
    public var _deaths:Int = 0; //Obs: Score = quantity of deaths
    private var _wscore:TextField;
      
    // To help game mechanics
    private var _timer:Timer;
    private var _timerSong:Float = 0;    
    private var _delay:Float = 100;

    /**
     * This function is the first function called.
     * Here we initialize almost things; 
     */
    override public function create():Void{
		super.create();
        
        // World
        add(_background = new FlxBackdrop("assets/images/gameBackground.png", 2, 0, true, false));
        _soundBackground = FlxG.sound.load(FlxAssets.getSound("assets/music/fundo"), true, false);
        _soundBackground.play();

        // Create the actual group of bullets here
		_bullets = new FlxTypedGroup<Bullet>();
		_bullets.maxSize = 4;
		_badbullets = new FlxTypedGroup<Bullet>();
        add(_bullets);

        // Player
        add(_player = new Player(10, _y, _bullets));

        _heart = new FlxSprite();
        _heart.loadGraphic(AssetPaths.birdShot__png);
        _heart.x = 10;
        _heart.y = 10;
        add(_heart);

        _healthBar = new FlxBar(50, 10, LEFT_TO_RIGHT, 200, 30, _player, "health", 0, 10, true);
        _healthBar.createColoredFilledBar(0xFFFF0000, true, 0xFFB96608);
        _healthBar.createColoredEmptyBar(0xFFFF6347, true, 0xFFB96608);
        add(_healthBar);

        // Create group of Enemies
        _enimies = new FlxTypedGroup<Enemies>();
        
        _robot = new Enemies("assets/images/inimigo1.png", 128, 240, "Robot", 15, -90, _x, _y);
        _robot.addAnimation("MOVE", [0, 1, 2, 3], 20);
        _enimies.add(_robot);

        _boy = new Enemies("assets/images/inimigo2.png", 158, 158, "Boy", 1, -400, _x, _y + 50);
        _boy.addAnimation("MOVE", [0, 1, 2], 30);
        _boy.animation.add("ATTACK", [3, 4, 5], 20);
        _enimies.add(_boy);

        _ninjaGirl = new Enemies("assets/images/inimigo3.png", 160, 180, "NinjaGirl", 8, -280, _x, _y + 50);
        _ninjaGirl.addAnimation("MOVE", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 35);
        _ninjaGirl.animation.add("ATTACK", [10, 11, 12, 13, 14, 15, 16, 17, 18, 19], 6);
        _enimies.add(_ninjaGirl);

        add(_enimies);
		        
        // Score
        _wscore = new TextField();
        _wscore.defaultTextFormat = new TextFormat ("Arial", 30, 0xFFFFFFFF);
        _wscore.x = 10;
        _wscore.y = 50;
        _wscore.width = 350;
        _wscore.text = "SCORE: 0";
        FlxG.addChildBelowMouse(_wscore);

        // GO! GO! GO!
        _goText = new TextField();
        _goText.defaultTextFormat = new TextFormat ("Arial", 80, 0xFFFF0000);
		_goText.x = 400;
		_goText.y = 100;
		_goText.text = "GO!!";
        _goText.width = 200;
        FlxG.addChildBelowMouse(_goText);
        _goText.visible = false;
        _soundGo = FlxG.sound.load(FlxAssets.getSound("assets/sounds/go"), false, false);
             
	}

	/**
	 * Loop of the game
	 */
	override public function update(elapsed:Float):Void{

        _wscore.text = 'SCORE: $_deaths';

        // When it's time to fight
        if(_deaths < _go + 8){
            _runForrest = 0;
            _background.velocity.set(0, 0);
            _enimies.revive();
            FlxG.overlap(_bullets, _enimies, enimyDamage);
            FlxG.overlap(_player, _enimies, playerDamage);
        }
        else{
            if(_enimies.countLiving() != 0){ // There are still enemies on the screen.
                FlxG.overlap(_bullets, _enimies, enimyDamage);
                FlxG.overlap(_player, _enimies, playerDamage);
            }
            else{               
                if(_runForrest < 400){
                    if(_timerSong > _delay){ // GO! GO! GO!
                        _soundBackground.volume = 0.4;
                        _goText.visible = true;
                        _soundGo.play();
                        _delay += 420;
                    }
                    if(!_soundGo.playing){
                        _soundBackground.volume = 1;
                        _goText.visible = false;
                    }                                      
                    if(FlxG.keys.pressed.RIGHT){ // Running to fight
                        _soundGo.stop();
                        _goText.visible = false;
                        _runForrest++;
                        _background.velocity.set(-100, 0);
                    }
                    else{ // Is stop? counting the time
                        _timerSong++;
                        _background.velocity.set(0, 0);
                    }                   
                }
                else{                                   
                    _go = _deaths; // help to count least of deaths                
                }
            }
        }   
        FlxG.collide(_player, _ground);
        super.update(elapsed);
	}

    // Damage on the player, when colide with enemies
    public function playerDamage(p:Player, e:Enemies){
        e.kill();
        FlxG.camera.shake(0.01, 0.2);
        if(e.getName() == "Robot"){ 
            p.hurt(5);
        }else if(e.getName() == "Boy"){
            p.hurt(2);
        }else if(e.getName() == "NinjaGirl"){
            p.hurt(3);
        }
    }

    // Damage on the enemies, when colide with a bullet
    function enimyDamage(b:Bullet, e:Enemies){
        b.kill();
        if(e.health > 0){
            e.hurt(4);
        }
    };

}