package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Theo leyenda
 */
//ACA PONER EL MENSAJE: ESTABAS DESTINADO A MORIR DE TODOS MODOS. Y QUE LUEGO DE 3 SEGUNDOS TE MANDE AL MENU
class Perdiste extends FlxSubState 
{
	private var Timer:Float;
	private var Nivel8:FlxText;
	private var deTodosModos:FlxText;
	override public function create():Void 
	{
		super.create();
		Nivel8 = new FlxText(32, FlxG.height / 2 - 32, 0, "Y ESTABAS DESTINADO A MORIR", 32);
		deTodosModos = new FlxText(FlxG.width/2-160, FlxG.height / 2, 0, "DE TODOS MODOS...", 32);
		Nivel8.color = FlxColor.RED;
		deTodosModos.color = FlxColor.RED;
		add(Nivel8);
		add(deTodosModos);
		Timer = 2;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Timer >= 4 && Timer < 6)
		{
			FlxG.camera.shake(0.05, 0.5);
			FlxG.sound.play(AssetPaths.EfectoTriggered__wav);
		}
		if (Timer >= 6)
		{
			FlxG.sound.pause();
		}
		if (Timer >= 7)
		{
			FlxG.switchState( new Menu());
		}
		Timer = Timer + elapsed;
	}
}