package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class Nivel_8 extends FlxSubState 
{
	private var player:Player;
	private var EntrarFase1:Bool;
	private var EntrarFase2:Bool;
	private var EntrarFase3:Bool;
	private var EntrarFase4:Bool;
	private var misil:Misil;
	private var GrupMisiles:FlxTypedGroup<Enemigo>;
	private var playerYendose:PlayerYendoseXD;
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
		EntrarFase1 = true;
		EntrarFase2 = false;
		EntrarFase3 = false;
		EntrarFase4 = false;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		GrupMisiles = new FlxTypedGroup<Enemigo>();
		//fase 1
		misil = new Misil(3, 2, FlxG.width/2, -17);
		Reg.entidadesMisil++;
		GrupMisiles.add(misil);
		
		misil = new Misil(4, 2, FlxG.width / 2, FlxG.height);
		Reg.entidadesMisil++;
		GrupMisiles.add(misil);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupMisiles);
		add(GrupDeGrupEnemigo);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(Reg.GrupBalaJugador, GrupMisiles, OverlapBalaJugadorMisil);
		FlxG.overlap(GrupMisiles,player , OverlapMisilJugador);
		if (Reg.entidadesMisil <= 0 && EntrarFase1)
		{
			//fase 2
			EntrarFase1 = false;
			EntrarFase2 = true;
			
			misil = new Misil(1, 2, -13, FlxG.height / 2);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			misil = new Misil(2, 2, FlxG.width, FlxG.height / 2);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			GrupDeGrupEnemigo.add(GrupMisiles);
			add(GrupDeGrupEnemigo);
			//add(GrupMisiles);
		}
		if (Reg.entidadesMisil <= 0 && EntrarFase2)
		{
			//fase 3
			EntrarFase2 = false;
			EntrarFase3 = true;
			
			misil = new Misil(1, 2, -13, FlxG.height / 2);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			misil = new Misil(2, 2, FlxG.width, FlxG.height / 2);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			misil = new Misil(3, 2, FlxG.width/2, -17);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			misil = new Misil(4, 2, FlxG.width / 2, FlxG.height);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			GrupDeGrupEnemigo.add(GrupMisiles);
			add(GrupDeGrupEnemigo);
			//add(GrupMisiles);
			
		}
		if (Reg.entidadesMisil <= 0 && EntrarFase3)
		{
			//fase 4
			EntrarFase3 = false;
			EntrarFase4 = true;
			
			misil = new Misil(0, 1, 0, 0);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			misil = new Misil(0, 1, FlxG.width - 13, 0);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			misil = new Misil(0, 1, 0, FlxG.height-17);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			misil = new Misil(0, 1, FlxG.width - 13, FlxG.height - 17);
			Reg.entidadesMisil++;
			GrupMisiles.add(misil);
			
			GrupDeGrupEnemigo.add(GrupMisiles);
			add(GrupDeGrupEnemigo);
			//add(GrupMisiles);
		}
		if (Reg.entidadesMisil <= 0 && EntrarFase4)
		{
			EntrarFase4 = false;
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2-10);
			add(playerYendose);
		}
	}
	public function OverlapBalaJugadorMisil(balaJugador:Bala, misil:Misil):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +7;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		misil.kill();
		misil.destrucionParticulas();
		Reg.entidadesMisil--;
	}
	public function OverlapMisilJugador(misil:Misil, player:Player):Void
	{
		FlxG.switchState( new GameOver());
	}
}