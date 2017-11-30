package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class GameOver extends FlxSubState 
{
	private var Nivel1:FlxText;
	override public function create():Void 
	{
		super.create();
		FlxG.sound.play(AssetPaths.Opcion1_jugador_Muere__wav);
		FlxG.camera.shake(0.05, 0.5);
		Nivel1 = new FlxText(FlxG.width / 2 - 100, FlxG.height / 2 - 70, 0, "GAME OVER", 32);
		Nivel1.color = FlxColor.RED;
		add(Nivel1);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.ESCAPE)
		{
			FlxG.switchState( new Menu());
			Reg.nivelActual = 1;
			Reg.entidadesZombie = 0;
			Reg.entidadesSoldado = 0;
			Reg.entidadesBlindado = 0;
			Reg.entidadesMisil = 0;
			Reg.puntaje = 0;
		}
		if (FlxG.keys.pressed.R)
		{
			
			FlxG.switchState( new Nivel_1_texto());
			Reg.nivelActual = 1;
			Reg.entidadesZombie = 0;
			Reg.entidadesSoldado = 0;
			Reg.entidadesBlindado = 0;
			Reg.entidadesMisil = 0;
			Reg.puntaje = 0;
		}
		if (FlxG.keys.pressed.Q)
		{
			Reg.entidadesZombie = 0;
			Reg.entidadesSoldado = 0;
			Reg.entidadesBlindado = 0;
			Reg.entidadesMisil = 0;
			Reg.entidadesTanque = 0;
			Reg.puntaje = 0;
			switch(Reg.nivelActual)
			{
				// ver si le agrego el reg nivel o no.
				case 1:
					FlxG.switchState( new Nivel_1_texto());
				case 2:
					FlxG.switchState( new Nivel_2_texto());
				case 3:
					FlxG.switchState( new Nivel_3_texto());
				case 4:
					FlxG.switchState( new Nivel_4_texto());
				case 5:
					FlxG.switchState( new Nivel_5_texto());
				case 6:
					FlxG.switchState( new Nivel_6_texto());
				case 7:
					FlxG.switchState( new Nivel_7_texto());
				case 8:
					FlxG.switchState( new Nivel_8_texto());
				case 9:
					FlxG.switchState( new Nivel_9_texto());
				case 10:
					FlxG.switchState( new Nivel_Final_texto());
			}
		}
	}
	
}