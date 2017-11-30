package;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Theo leyenda
 */
class Controles extends FlxSubState 
{
	private var controles:FlxText;
	private var UsaElmous:FlxText;
	private var Restart:FlxText;
	private var restartNivel:FlxText;
	private var SolovalidoEnGameOVer:FlxText;
	private var Z:FlxText;
	private var FLACO:FlxText;
	override public function create():Void 
	{
		super.create();
		controles = new FlxText(FlxG.width / 2 - 160, 0, 0, "CONTROLES", 48);
		controles.color = FlxColor.YELLOW;
		
		UsaElmous = new FlxText(FlxG.width / 2 - 272, FlxG.height - 160, 0, "PARA LO DEMAS USA EL MOUS", 32);
		UsaElmous.color = FlxColor.RED;
		//FLACO = new FlxText(FlxG.width / 2 - 50, FlxG.height - 128, 0, "FLACO", 32);
		//FLACO.color = FlxColor.RED;
		
		Restart = new FlxText(0, FlxG.height / 2-120, 0, "Resetear Nivel: Q", 24);
		restartNivel = new FlxText(FlxG.width - 272, FlxG.height / 2-120, 0, "Resetear Juego: R",24);
		
		SolovalidoEnGameOVer = new FlxText(90, FlxG.height / 3 + 48, 0, "(Estos botones solo estan validos en GAME OVER)", 16);
		Z = new FlxText(FlxG.width - 64, FlxG.height - 48, 0, "Z", 32);
		add(controles);
		add(UsaElmous);
		add(Restart);
		add(restartNivel);
		add(Z);
		add(SolovalidoEnGameOVer);
		//add(FLACO);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.Z)
		{
			FlxG.switchState(new Menu());
		}
	}
	
}