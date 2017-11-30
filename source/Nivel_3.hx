package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
/**
 * ...
 * @author Theo leyenda
 */
class Nivel_3 extends FlxSubState 
{
	private var player:Player;
	private var misil:Misil;
	private var GrupMisil:FlxTypedGroup<Enemigo>;
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void 
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.private3_8__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		player = new Player(FlxG.width / 2, FlxG.height / 2);
		add(player);
		
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		
		entrar = true;
		
		GrupMisil = new FlxTypedGroup<Enemigo>();
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		//<-----
		misil = new Misil(1, 2, -10, FlxG.height / 2);
		//misil.makeGraphic(10, 10);
		Reg.entidadesMisil++;
		GrupMisil.add(misil);
		//----->
		misil = new Misil(2, 2, FlxG.width - misil.width , FlxG.height / 2);
		//misil.makeGraphic(10, 10);
		Reg.entidadesMisil++;
		GrupMisil.add(misil);
		//ARRIBA
		misil = new Misil(3,2, FlxG.width / 2 , -10);
		//misil.makeGraphic(10, 10);
		Reg.entidadesMisil++;
		GrupMisil.add(misil);
		//ABAJO
		misil = new Misil(4, 2, FlxG.width / 2, FlxG.height - misil.height);
		//misil.makeGraphic(10, 10);
		Reg.entidadesMisil++;
		GrupMisil.add(misil);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupMisil);
		//add(GrupMisil);
		
		add(GrupDeGrupEnemigo);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.entidadesMisil <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2-10);
			entrar = false;
			add(playerYendose);
		}
		FlxG.overlap(Reg.GrupBalaJugador, GrupMisil, OverlapBalaJMisil);
		FlxG.overlap(GrupMisil, player, OverlapMisilJ);
	}
	public function OverlapMisilJ(misil:Misil, player:Player):Void
	{
		misil.kill();
		misil.destrucionParticulas();
		player.kill();
		FlxG.switchState( new GameOver());
	}
	public function OverlapBalaJMisil(BalaJugador:Bala, misil:Misil):Void
	{
		BalaJugador.kill();
		BalaJugador.getEfecto().kill();
		misil.kill();
		misil.destrucionParticulas();
		Reg.entidadesMisil--;
		Reg.puntaje = Reg.puntaje + 7;
		Puntaje.destroy();
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
	}
}