/**
 * The proposal of this work is the criation of a game
 * with interaction with object lists, colision,
 * keyboard and mouse input, with unless 3 states and
 * with interaction with object lists
 * 
 * Author: Cleiton A. Ambrosini <cleiton.ambro@gmail.com>
 */
 
package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * Here be who contributed to the game
 */
class CreditsGame extends FlxState{
    var _text:FlxText;

    override public function create(){
        super.create();

        FlxG.camera.bgColor = 0xFF000000;
  
        var text = "
        Click or wait to the end for back to game menu.\n\n
        \nEnimies Design:
        Human Robot     Carlos Alface      <carlosalface.blogspot.pt/>
        Ninja Girl      pzUH     <opengameart.org/users/pzuh>
        Boy             <freesourceunity.club>
        \nPlayer Design:
        Cat     megupets.com <opengamegraphics.com>
        Demon Eye       Grefuntor   <atmostatic.blogspot.com>
        \nThe Game:
        Created by     Cleiton A. Ambrosini
        Programming      Cleiton A. Ambrosini
        Background      Free Game Assets    <free-game-assets.itch.io>
        Buttons     Creative Game Assets    <creativegameassets.com>
        \nSounds:
        'Go! Go! Go!'       theuncertainman <https://freesound.org/people/theuncertainman/sounds/402644/>
        'You Lose'       Rocotilos <https://freesound.org/people/Rocotilos/sounds/178875/>
        Player Running      InspectorJ <https://freesound.org/people/InspectorJ/sounds/416967/>";

        _text = new FlxText(100, FlxG.initialHeight - 64, 0, text, 12, false);
        _text.setFormat("Arial", 24, 0xFFFFFFFF);
        add(_text);      
    }

    override public function update(elapsed:Float):Void{
        super.update(elapsed);
        _text.y --; // move the screen up
        if ( !_text.isOnScreen())
            FlxG.switchState(new MenuState()); // on the finish, back to Main Menu
        if(FlxG.mouse.pressed){
            FlxG.switchState(new MenuState()); // on click any time, back to Main Menu
        }
    }

}
