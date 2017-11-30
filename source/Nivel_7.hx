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
class Nivel_7 extends FlxSubState 
{
	// utilizar la op 1 de torreta en el sprite del soldado y luego moverlo...
	// hacer el nivel 7 con los planos del nivel 8
	private var soldadoMov1:Soldados;
	private var soldadoMov2:Soldados;
	private var soldadoMov3:Soldados;
	private var player:Player;
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	private var timer1:Int = 0;
	private var timer2:Int = 0;
	private var timer3:Int = 0;
	private var GrupSoldados:FlxTypedGroup<Enemigo>;
	private var EntrarEnSegundaFase:Bool;
	private var soldadoBlindado:SoldadoBlindado;
	private var zombies:Zombie;
	private var GrupZombies:FlxTypedGroup<Enemigo>;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	// mover las torretas(soldadoMov1, soldadoMov2 Y soldadoMov3) por timer basandose en as plataformas
	override public function create():Void 
	{
		//TERMINAR EL NIVEL 7 COMO LO DICEN LOS PLANOS....
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.Fondo_nivel7__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		GrupZombies = new FlxTypedGroup<Enemigo>();
		GrupSoldados = new FlxTypedGroup<Enemigo>();
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		timer1 = 0;
		timer2 = 0;
		timer3 = 0;
		entrar = true;
		EntrarEnSegundaFase = true;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		soldadoMov1 = new Soldados(1.5, 5, 0);
		Reg.entidadesSoldado++;
		soldadoMov1.loadGraphic(AssetPaths.opcion_1_torreta__png);
		soldadoMov1._setHabilitarMovSoldado(true);
		add(soldadoMov1);
		
		soldadoMov2 = new Soldados(1.5, 5, 25);
		Reg.entidadesSoldado++;
		soldadoMov2.loadGraphic(AssetPaths.opcion_1_torreta__png);
		soldadoMov2._setHabilitarMovSoldado(true);
		add(soldadoMov2);
		
		soldadoMov3 = new Soldados(1.5, FlxG.width - 30, 25);
		Reg.entidadesSoldado++;
		soldadoMov3.loadGraphic(AssetPaths.opcion_1_torreta__png);
		soldadoMov3._setHabilitarMovSoldado(true);
		add(soldadoMov3);
		
		GrupSoldados.add(soldadoMov1);
		GrupSoldados.add(soldadoMov2);
		GrupSoldados.add(soldadoMov3);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupSoldados);
		add(GrupDeGrupEnemigo);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (EntrarEnSegundaFase)
		{
			timer1++;
			if (timer1 < 200)
			{
				soldadoMov1.velocity.x = 75;
			}
			if (timer1 == 400)
			{
				soldadoMov1.velocity.x = 0;
				timer1 = 0;
			}
			if (timer1 > 200)
			{
				soldadoMov1.velocity.x = -75;
			}
			
			timer2++;
			if (timer2 < 150)
			{
				soldadoMov2.velocity.y = 75;
			}
			if (timer2 == 300)
			{
				soldadoMov2.velocity.y = 0;
				timer2 = 0;
			}
			if (timer2 > 150)
			{
				soldadoMov2.velocity.y = -75;
			}
			
			timer3++;
			if (timer3 < 150)
			{
				soldadoMov3.velocity.y = 75;
			}
			if (timer3 == 300)
			{
				soldadoMov3.velocity.y = 0;
				timer3 = 0;
			}
			if (timer3 > 150)
			{
				soldadoMov3.velocity.y = -75;
			}
			FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlapBalaJugadorBalaSoldado);
			FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
			FlxG.overlap(Reg.GrupBalaJugador, GrupSoldados, OverlapBalaJugadorSoldado);
			if (Reg.entidadesSoldado <= 0 && EntrarEnSegundaFase)
			{
				EntrarEnSegundaFase = false;
				for (i in 0...4)
				{
					zombies = new Zombie(-25, i * 64+50);
					Reg.entidadesZombie++;
					GrupZombies.add(zombies);
				}
				for (i in 0...4)
				{
					zombies = new Zombie(FlxG.width, i * 64+50);
					Reg.entidadesZombie++;
					GrupZombies.add(zombies);
				}
				GrupDeGrupEnemigo.add(GrupZombies);
				add(GrupDeGrupEnemigo);
			}
		}
		else
		{
			FlxG.overlap(player, GrupZombies, OverlapZombieJugador);
			FlxG.overlap(Reg.GrupBalaJugador, GrupZombies , OverlapBalaJugadorZombie);
			FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlapBalaJugadorBalaSoldado);
			FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
			if (Reg.entidadesZombie <= 0 && entrar)
			{
				playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
				entrar = false;
				add(playerYendose);
			}
		}
	}
	public function OverlapBalaSoldadoJugador(balaSoldado:BalaSoldado, jugador:Player):Void
	{
		FlxG.switchState( new GameOver());
	}
	public function OverlapBalaJugadorBalaSoldado(balaJugador:Bala, balaSoldado:BalaSoldado):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		balaSoldado.kill();
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
	}
	public function OverlapBalaJugadorSoldado(balaJugador:Bala , soldado:Soldados):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		soldado.kill();
		Reg.entidadesSoldado--;
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +20;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
	}
	public function OverlapBalaJugadorZombie(balaJugador:Bala, zombie:Zombie):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		zombie.setVida(zombie.getVida() - 5);
		if (zombie.getVida() <= 0)
		{
			zombie.kill();
			Reg.entidadesZombie--;
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje +10;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	public function OverlapZombieJugador(jugador:Player, zombie:Zombie):Void
	{
		FlxG.switchState( new GameOver());
	}
}