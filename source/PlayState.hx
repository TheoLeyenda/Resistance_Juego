import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
// C Guardo
class PlayState extends FlxSubState
{
	private var fondo:FlxSprite;
	private var player:Player;
	private var zombie:Zombie;
	private var soldado:Soldados;
	private var misil:Misil;
	private var Blindado:SoldadoBlindado;
	private var plataforma:Plataforma;
	private var GrupZombie:FlxTypedGroup<Enemigo>;
	private var GrupSoldado:FlxTypedGroup<Soldados>;
	private var GrupMisil:FlxTypedGroup<Misil>;
	private var GrupdeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	override public function create():Void
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.fondo_1_desierto__png);
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
		add(player.getGrupoBalaPlayer());
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		GrupZombie = new FlxTypedGroup<Enemigo>();
		for (i in 0...10)
		{
			zombie = new Zombie();
			Reg.entidadesZombie = Reg.entidadesZombie +1;
			GrupZombie.add(zombie);
			
		}
		for (i in 0...GrupZombie.length)
		{
			GrupZombie.members[i].x = i  * 64;
			GrupZombie.members[i].y = -10;
			
		}
		GrupdeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupdeGrupEnemigo.add(GrupZombie);
		//ENEMIGO 1 : ZOMBIES
		add(GrupdeGrupEnemigo);
		
		
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		//ver como hacer el grupo de grupos
		//GrupEnemigos.add(GrupZombie);
		//add(GrupEnemigos);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		// VERIFICACION DE COLICIONES
		FlxG.overlap(Reg.GrupBalaJugador, GrupZombie, OverlapBalaZombie);
		FlxG.overlap(player, GrupZombie,OverlapZombieJugador);
		if (Reg.entidadesZombie <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			add(playerYendose);
			entrar = false;
		}
	}
	public function OverlapBalaZombie(Balaplayer:Bala,zombie:Zombie)
	{
		Balaplayer.kill();
		Balaplayer.getEfecto().kill();
		zombie.setVida(zombie.getVida() - 5);
		if (zombie.getVida() <= 0)
		{
			Reg.puntaje = Reg.puntaje + 10;
			Reg.entidadesZombie = Reg.entidadesZombie-1;
			zombie.kill();
			Puntaje.destroy();
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	public function OverlapZombieJugador(player:Player, zombie:Zombie)
	{
		player.kill();
		FlxG.switchState( new GameOver());
	}
}