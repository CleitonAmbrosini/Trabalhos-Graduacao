/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */
 
package;

import flixel.FlxG;
import flixel.FlxSprite;

/**
 * Creation of each enemy
 */
class Enemies extends FlxSprite{

	private var _runSpeed:Int;
	private var _enimyName:String;
	private var _theX:Float;
	private var _theY:Float;
	private var _health:Float;

	/**
	 * On instance each enemy.
	 * Each enemy with yours informations.
	 */
	public function new(sprite:String, width:Int, height:Int, name:String, health:Int, speed:Int, _x:Float, _y:Float ){
		super();
		// create the image of enemy
		loadGraphic(sprite, true, width, height);

		// set the parameters
		_enimyName = name;
		_theX = this.x = _x;
		_theY = this.y = _y;
		velocity.x = speed;
		_runSpeed = speed;
		_health = this.health = health;
	}

	/**
	 * set default position and health when spawn
	 */
	override public function revive():Void{
		this.x = _theX;
		this.y = _theY;
		velocity.x = _runSpeed;
		this.health = _health;
		super.revive();
	}

	/**
	 * to count the points 
	 */
	override public function kill():Void{
		if(!alive){
			return;
		}
		cast(FlxG.state,PlayGameState)._deaths ++;
		super.kill();
	}

	/**
	 * set the movimentation of each enemy
	 */
	override public function update(elapsed:Float):Void{
		super.update(elapsed);

		if(velocity.x != 0){
			if(x < 300){ // when they are near the player
				if(this.getName() == "NinjaGirl"){ // jumping
					this.velocity.y = -150;
					this.velocity.x -= 5;
					this.elasticity = 100;
					animation.play("ATTACK");
				}else if(this.getName() != "Robot"){ // Robot dont have this sprite animation
					animation.play("ATTACK");
				}else{
					animation.play("MOVE");
				}					 
			}else{ // far from the player
				this.velocity.y = 0;
				this.velocity.x = _runSpeed;
				animation.play("MOVE");
			}			
		}	

	}

	/**
	 * this function is to leave more easy the creation of animation
	 */
	public function addAnimation(name:String, positions:Array<Int>, speed:Int):Void{
		animation.add(name, positions, speed, false);
	}

	/**
	 * for control in PlayGameState.
	 * each enemy have different healt, speed and damage
	 */
	public function getName():String{
		return _enimyName;
	}

	/**
	 * set the initial data
	 */
	public function localInTheWorld(_x:Float, _y:Float, speed:Int, HEALTH:Int){
		this.x = _x;
		_theX = _x;
		this.y = _y;
		_theY = _y;
		velocity.x = speed;
		_runSpeed = speed;
		health = HEALTH;
	}

}

