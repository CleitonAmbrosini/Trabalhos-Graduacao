/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */
 
package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
