package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class CryingChild extends Character
{
	public var stunned:Bool = false;

	public function new(x:Float, y:Float, ?char:String = 'cryingchild')
	{
		super(x, y, char, true);
	}

	override function update(elapsed:Float)
	{
		if (!debugMode)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}
			else
				holdTimer = 0;

			if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
			{
				playAnim('idle', true, false, 10);
			}

			if (animation.curAnim.name == 'firstDeath' && animation.curAnim.finished)
			{
				playAnim('deathLoop');
			}
		}

		super.update(elapsed);
	}
}
