package;

import flixel.FlxState;
import flixel.FlxSprite;
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
class Nivel_5 extends FlxSubState 
{
	private var zombie:Zombie;
	private var soldadoBlindado:SoldadoBlindado;
	private var player:Player;
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	
	private var Puntaje:FlxText;
	private var GrupZombie:FlxTypedGroup<Enemigo>;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void 
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.fondo5__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		entrar = true;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		soldadoBlindado = new SoldadoBlindado(FlxG.width/ 2, 0);
		add(soldadoBlindado);
		Reg.entidadesBlindado++;
		GrupZombie = new FlxTypedGroup<Enemigo>();
		
		for (i in 0...3)
		{
			zombie = new Zombie(i * 64, 0);
			Reg.entidadesZombie++;
			GrupZombie.add(zombie);
		}
		
		for (i in 0...3)
		{
			zombie = new Zombie(FlxG.width - i * 64, 0);
			Reg.entidadesZombie++;
			GrupZombie.add(zombie);
		}
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupZombie);
		add(GrupDeGrupEnemigo);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.entidadesZombie <= 0 && Reg.entidadesBlindado <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			entrar = false;
			add(playerYendose);
		}
		//colicion entre la bala del jugador y el zombie(funciona)
		FlxG.overlap(Reg.GrupBalaJugador, GrupZombie, OverlapBalaZombie);
		
		//colicion entre la bala del jugador y el blindado(funciona)
		FlxG.overlap(Reg.GrupBalaJugador, soldadoBlindado, OverlapBalaJugger);
		
		//colicion entre el jugador y los zombies(funciona)
		FlxG.overlap(player, GrupZombie, OverlapZombieJugador);
		
		//colicion entre el jugador y el blindado(funciona)
		FlxG.overlap(player, soldadoBlindado, OverlapJuggerJugador);
	}
	public function OverlapBalaZombie(Balaplayer:Bala,zombie:Zombie):Void
	{
		Balaplayer.kill();
		Balaplayer.getEfecto().kill();
		zombie.setVida(zombie.getVida() - 5);
		if (zombie.getVida() <= 0)
		{
			Reg.entidadesZombie = Reg.entidadesZombie-1;
			zombie.kill();
			Reg.puntaje = Reg.puntaje +10;
			Puntaje.destroy();
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	public function OverlapBalaJugger(BalaPlayer:Bala, jugger:SoldadoBlindado):Void
	{
		BalaPlayer.kill();
		BalaPlayer.getEfecto().kill();
		jugger.setVida(jugger.getVida() - 14);
		if (jugger.getVida() <= 0)
		{
			Reg.entidadesBlindado = Reg.entidadesBlindado -1;
			jugger.kill();
			jugger.destruirBarraVida();
			Reg.puntaje = Reg.puntaje +100;
			Puntaje.destroy();
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
			
		}
		else
		{
			Reg.puntaje = Reg.puntaje +5;
			Puntaje.destroy();
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	public function OverlapZombieJugador(player:Player, zombie:Zombie):Void
	{
		player.kill();
		if (entrar)
		{
			FlxG.switchState( new GameOver());
		}
	}
	public function OverlapJuggerJugador(player:Player , jugger:SoldadoBlindado):Void
	{
		player.kill();
		if (entrar)
		{
			FlxG.switchState( new GameOver());
		}
	}
}