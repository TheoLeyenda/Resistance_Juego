package;

import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class Menu extends FlxSubState 
{
	private var NombreJuego:FlxText;
	private var menu:FlxText;
	private var Play:FlxText;
	private var creditos:FlxText;
	private var controles:FlxText;
	private var higscore:FlxText;
	override public function create():Void 
	{
		super.create();
		FlxG.sound.play(AssetPaths.Metallica_FadeToBlackMusic_Video__wav,2,true);

		NombreJuego = new FlxText(FlxG.width / 2-150, 0, 0, "Resistence", 48);
		add(NombreJuego);
		NombreJuego.color = FlxColor.BLUE;
		
		menu = new FlxText(FlxG.width / 2 - 50, 80, "MENU", 32);
		add(menu);
		
		Play = new FlxText(FlxG.width / 2 -70, 144, "1. Jugar", 32);
		add(Play);
		
		creditos = new FlxText(FlxG.width / 2 - 90, 208, "2. Creditos", 32);
		add(creditos);
		
		controles = new FlxText(FlxG.width / 2 - 100, 272, "3. Controles", 32);
		add(controles);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.puntaje > Reg.Hihgscore)
		{
			Reg.Hihgscore = Reg.puntaje;
			higscore = new FlxText(FlxG.width / 2 - 140,336,0, "HighScore:" + Reg.Hihgscore,32);
			add(higscore);
			Reg.puntaje = 0;
		}
		if (FlxG.keys.pressed.ONE)
		{
			FlxG.switchState ( new Nivel_1_texto());
		}
		if (FlxG.keys.pressed.TWO)
		{
			FlxG.switchState( new Creditos());
		}
		if (FlxG.keys.pressed.THREE)
		{
			FlxG.switchState( new Controles());
		}
	}
	
}