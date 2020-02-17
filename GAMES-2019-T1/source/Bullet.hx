/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */

package;

import flixel.FlxSprite;

/**
 * One bullet
 */
class Bullet extends FlxSprite{
    /**
     * just creates the bullet but does not give to life
     */
    public function new(){
        super();     
        loadGraphic(AssetPaths.shot__png, false);
        exists = false;
    }

    /**
     * On firing this function is called.
     * Here is setting the velocity and the life of bullet. 
     */
    public function shoot(x:Int, y:Int, velocityX:Int):Void{
        super.reset(x + 40, y + 73);

        solid = true;
        velocity.x = velocityX;
    
    }

}