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
class Nivel_10 extends FlxSubState 
{
	private var zombie:Zombie;
	private var soldado:Soldados;
	private var tanque:Tanque;
	private var plataforma:Plataforma;
	private var misil:Misil;
	private var soldadoBlindado:SoldadoBlindado;
	private var player:Player;
	private var entrar:Bool;
	private var entrarFase1:Bool;
	private var entrarFase2:Bool;
	private var entrarFase3:Bool;
	private var entrarFase4:Bool;
	private var entrarFase5:Bool;
	private var entrarFase6:Bool;
	private var entrarFase7:Bool;
	
	private var GrupZombie:FlxTypedGroup<Enemigo>;
	private var GrupSoldado:FlxTypedGroup<Enemigo>;
	private var GrupTanque:FlxTypedGroup<Enemigo>;
	private var GrupMisil:FlxTypedGroup<Enemigo>;
	private var playerYendose:PlayerYendoseXD;
	private var GrupSoldadoBlindado:FlxTypedGroup<Enemigo>;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var entrarFinal:Bool;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var noAmo:FlxText;
	private var contador:Float;
	private var empezarTimer:Bool;
	override public function create():Void 
	{
		//PARA EL NIVEL DEL TANQUE
		//tanque = new Tanque(2, 0, 0);
		//add(tanque);
		//Reg.GrupBalaTanque = new FlxTypedGroup<BalaTanque>();
		//add(Reg.GrupBalaTanque);
		//-----------------------------------------------
		super.create();
		contador = 0;
		empezarTimer = false;
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		entrar = true;
		entrarFase1 = true;
		entrarFase2 = false;
		entrarFase3 = false;
		entrarFase4 = false;
		entrarFase5 = false;
		entrarFase6 = false;
		entrarFase7 = false;
		entrarFinal = false;
		
		player = new Player(FlxG.width/2, FlxG.height-50);
		add(player);
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		Reg.GrupBalaTanque = new FlxTypedGroup<BalaTanque>();
		add(Reg.GrupBalaTanque);
		
		GrupMisil = new FlxTypedGroup<Enemigo>();
		GrupSoldado = new FlxTypedGroup<Enemigo>();
		GrupSoldadoBlindado = new FlxTypedGroup<Enemigo>();
		GrupTanque = new FlxTypedGroup<Enemigo>();
		GrupZombie = new FlxTypedGroup<Enemigo>();
		
		zombie = new Zombie(FlxG.width/2-192, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		zombie = new Zombie(FlxG.width/2-128, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		tanque = new Tanque(3.5,FlxG.width/2-64, 0);
		Reg.entidadesTanque++;
		GrupTanque.add(tanque);
		
		zombie = new Zombie(FlxG.width/2-32, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		tanque = new Tanque(3.5,FlxG.width/2, 0);
		Reg.entidadesTanque++;
		GrupTanque.add(tanque);
		
		zombie = new Zombie(FlxG.width/2+32, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		tanque = new Tanque(3.5,FlxG.width/2+64, 0);
		Reg.entidadesTanque++;
		GrupTanque.add(tanque);
		
		zombie = new Zombie(FlxG.width/2+128, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		zombie = new Zombie(FlxG.width/2+192, 0);
		Reg.entidadesZombie++;
		GrupZombie.add(zombie);
		
		soldado = new Soldados(1.5,0, 125);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		soldado = new Soldados(1.5,FlxG.width - 25, 125);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupSoldado);
		GrupDeGrupEnemigo.add(GrupTanque);
		GrupDeGrupEnemigo.add(GrupZombie);
		
		add(GrupDeGrupEnemigo);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//1
		FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupBalaTanque,OverlapBalaJugadorBalaTanque);
		//2
		FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlapBalaJugadorBalaSoldado);
		//3
		FlxG.overlap(Reg.GrupBalaJugador, GrupTanque, OverlapBalaJuegoTanque);
		//4
		FlxG.overlap(Reg.GrupBalaJugador, GrupSoldado, OverlapBalaJugadorSoldado);
		//5
		FlxG.overlap(Reg.GrupBalaJugador, GrupZombie, OverlapBalaJugadorZombie);
		//6
		FlxG.overlap(Reg.GrupBalaTanque, player, OverlapBalaTanqueJugador);
		//7
		FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
		//8
		FlxG.overlap(GrupZombie, player, OverlapZombieJugador);
		//9
		FlxG.overlap(GrupSoldadoBlindado, player, OverlapSoldadoBlindadoJugador);
		//10
		FlxG.overlap(Reg.GrupBalaJugador, GrupSoldadoBlindado , OverlapBalaJugadorBlindado);
		//11
		FlxG.overlap(Reg.GrupBalaJugador, GrupMisil, OverlapBalaJugadorMisil);
		//12
		FlxG.overlap(GrupMisil, player, OverlapJugadorMisil);
		if (Reg.entidadesSoldado <= 0 && Reg.entidadesTanque<=0 && Reg.entidadesZombie<=0 && entrarFase1)
		{
			entrarFase1 = false;
			entrarFase2 = true;
			
			soldadoBlindado = new SoldadoBlindado(FlxG.width / 2 - 32, -32);
			Reg.entidadesBlindado++;
			GrupSoldadoBlindado.add(soldadoBlindado);
			
			soldadoBlindado = new SoldadoBlindado(FlxG.width / 2 + 32, -32);
			Reg.entidadesBlindado++;
			GrupSoldadoBlindado.add(soldadoBlindado);
			
			misil = new Misil(1, 2, -13, FlxG.height -48);
			Reg.entidadesMisil++;
			GrupMisil.add(misil);
			
			misil = new Misil(2, 2, FlxG.width, FlxG.height -48);
			Reg.entidadesMisil++;
			GrupMisil.add(misil);
			
			//poner en caso de ser facil
			/*
			misil = new Misil(4, 2, FlxG.width / 2, FlxG.height);
			Reg.entidadesMisil++;
			GrupMisil.add(misil);
			*/
			GrupDeGrupEnemigo.add(GrupMisil);
			GrupDeGrupEnemigo.add(GrupSoldadoBlindado);
			
			add(GrupDeGrupEnemigo);
		}
		if (Reg.entidadesMisil <= 0 && Reg.entidadesBlindado <= 0 && entrarFase2)
		{
			player.x = FlxG.width / 2;
			player.y = FlxG.height / 2;
			Reg.playerPosX = player.x;
			Reg.playerPosY = player.y;
			
			entrarFase2 = false;
			entrarFase3 = true;
			for (i in 0...8)
			{
				zombie = new Zombie(FlxG.width, i * 64);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombie);
			add(GrupDeGrupEnemigo);
		}
		if (Reg.entidadesZombie <= 0 && entrarFase3)
		{
			
			entrarFase3 = false;
			entrarFase4 = true;
			for (i in 0...8)
			{
				zombie = new Zombie( -25, i * 64);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombie);
			add(GrupDeGrupEnemigo);
		}
		if (Reg.entidadesZombie <= 0 && entrarFase4)
		{
			entrarFase4 = false;
			entrarFase5 = true;
			for (i in 0...10)
			{
				zombie = new Zombie((i * 64)-25, 0);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombie);
			add(GrupDeGrupEnemigo);
		}
		if (Reg.entidadesZombie <= 0 && entrarFase5)
		{
			entrarFase5 = false;
			entrarFase6 = true;
			for (i in 0...10)
			{
				zombie = new Zombie(i * 64, FlxG.height);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombie);
			add(GrupDeGrupEnemigo);
		}
		if (empezarTimer)
		{
			contador = contador + elapsed;
		}
		if (contador >= 2)
		{
			noAmo.destroy();
			noAmo = new FlxText(Reg.playerPosX - 100, Reg.playerPosY+35, 0, "Nada sirve de nada si estas solo....", 16);
			noAmo.color = FlxColor.RED;
			add(noAmo);
		}
		if (contador >= 4)
		{
			noAmo.destroy();
		}
		if (Reg.entidadesZombie <= 0 && entrarFase6)
		{
			super.update(elapsed);
			entrarFinal = true;
			noAmo = new FlxText(Reg.playerPosX - 50, Reg.playerPosY + 35, 0, "Sin municion....", 16);
			noAmo.color = FlxColor.YELLOW;
			add(noAmo);
			empezarTimer = true;
			player.setDisparar(false);
			for (i in 0...8)
			{
				zombie = new Zombie(FlxG.width-50, i * 64);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			for (i in 0...8)
			{
				zombie = new Zombie( 0, i * 64);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			for (i in 0...10)
			{
				zombie = new Zombie(i * 64, 0);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			for (i in 0...10)
			{
				zombie = new Zombie(i * 64, FlxG.height-25);
				Reg.entidadesZombie++;
				GrupZombie.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombie);
			add(GrupDeGrupEnemigo);
		}
		
	}
	//1
	public function OverlapBalaJugadorBalaTanque(balaJugador:Bala, balaTanque:BalaTanque):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje + 10;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		balaTanque.setVida(balaTanque.getVida() - 5);
		if (balaTanque.getVida() <= 0)
		{
			balaTanque.kill();
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje + 250;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
		
	}
	//2
	public function OverlapBalaJugadorBalaSoldado(balaJugador:Bala, balaSoldado:BalaSoldado):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje + 5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		balaSoldado.kill();
	}
	//3
	public function OverlapBalaJuegoTanque(balaJugador:Bala, tanque:Tanque):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		tanque.setVida(tanque.getVida() - 10);
		if (tanque.getVida() <= 0)
		{
			tanque.destruirBarraVida();
			tanque.kill();
			Reg.entidadesTanque--;
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje + 50;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	//4
	public function OverlapBalaJugadorSoldado(balaJugador:Bala, soldado:Soldados):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje + 20;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		soldado.kill();
		Reg.entidadesSoldado--;
	}
	//5
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
			Reg.puntaje = Reg.puntaje + 10;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	//6
	public function OverlapBalaTanqueJugador(balaTanque:BalaTanque, jugador:Player):Void
	{
		balaTanque.kill();
		jugador.kill();
		
		FlxG.switchState( new GameOver());
	}
	//7
	public function OverlapBalaSoldadoJugador(balaSoldado:BalaSoldado, jugador:Player):Void
	{
		balaSoldado.kill();
		jugador.kill();
		
		FlxG.switchState( new GameOver());
	}
	//8
	public function OverlapZombieJugador(zombie:Zombie, jugador:Player):Void
	{
		if (entrarFinal)
		{
			FlxG.switchState( new Perdiste());
		}
		else
		{
			FlxG.switchState( new GameOver());
		}
	}
	//9
	public function OverlapSoldadoBlindadoJugador(soldadoBlindado:SoldadoBlindado,jugador:Player):Void
	{
		jugador.kill();
		FlxG.switchState( new GameOver());
	}
	//10
	public function OverlapBalaJugadorBlindado(balaJugador:Bala, blindado:SoldadoBlindado):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje + 5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		blindado.setVida(blindado.getVida() - 14);
		if (blindado.getVida() <= 0)
		{
			blindado.kill();
			blindado.destruirBarraVida();
			Reg.entidadesBlindado--;
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje + 100;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	//11
	public function OverlapBalaJugadorMisil(balaJugador:Bala, misil:Misil):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje + 7;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		misil.kill();
		Reg.entidadesMisil--;
		misil.destrucionParticulas();
	}
	//12
	public function OverlapJugadorMisil(misil:Misil, jugador:Player):Void
	{
		misil.kill();
		misil.destrucionParticulas();
		jugador.kill();
		FlxG.switchState( new GameOver());
	}
	//terminar las demas coliciones.
}