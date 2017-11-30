package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author Theo leyenda
 */
class BalaSoldado extends FlxSprite 
{
	
	private var objetivo:FlxTween;
	private var guia:FlxPoint;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		//makeGraphic(5, 5, 0xff0000ff);
		loadGraphic(AssetPaths.balaSoldado__png);
		
		//
		//Comentar en caso de no querer rotar la bala del soldado
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
		this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x+12.5, guia.y+10), true)+90;
		//
		objetivo = FlxTween.tween(this, {x:Reg.playerPosX+7, y:Reg.playerPosY+10}, 4, {type:FlxTween.ONESHOT});
		objetivo.start();
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (objetivo.finished)
		{
			this.destroy();
		}
	}
	
	
}