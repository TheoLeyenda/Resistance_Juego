package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Alto_jugge_op1.png", "assets/images/Alto_jugge_op1.png");
			type.set ("assets/images/Alto_jugge_op1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/balaOpcion_1.png", "assets/images/balaOpcion_1.png");
			type.set ("assets/images/balaOpcion_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/balaSoldado.png", "assets/images/balaSoldado.png");
			type.set ("assets/images/balaSoldado.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/balaTanque.png", "assets/images/balaTanque.png");
			type.set ("assets/images/balaTanque.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fondo5.png", "assets/images/fondo5.png");
			type.set ("assets/images/fondo5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fondo_1_desierto.png", "assets/images/fondo_1_desierto.png");
			type.set ("assets/images/fondo_1_desierto.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo_Nivel2.png", "assets/images/Fondo_Nivel2.png");
			type.set ("assets/images/Fondo_Nivel2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fondo_nivel4.png", "assets/images/fondo_nivel4.png");
			type.set ("assets/images/fondo_nivel4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo_nivel7.png", "assets/images/Fondo_nivel7.png");
			type.set ("assets/images/Fondo_nivel7.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Intento_Nivel5.png", "assets/images/Intento_Nivel5.png");
			type.set ("assets/images/Intento_Nivel5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/jugadorYendose.png", "assets/images/jugadorYendose.png");
			type.set ("assets/images/jugadorYendose.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Municion.png", "assets/images/Municion.png");
			type.set ("assets/images/Municion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/nivel6_op2.png", "assets/images/nivel6_op2.png");
			type.set ("assets/images/nivel6_op2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/nivel_6_op1.png", "assets/images/nivel_6_op1.png");
			type.set ("assets/images/nivel_6_op1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/nivel_9.png", "assets/images/nivel_9.png");
			type.set ("assets/images/nivel_9.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/op1_misil.png", "assets/images/op1_misil.png");
			type.set ("assets/images/op1_misil.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opcion_1_torreta.png", "assets/images/opcion_1_torreta.png");
			type.set ("assets/images/opcion_1_torreta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opcion_3_Jugador.png", "assets/images/opcion_3_Jugador.png");
			type.set ("assets/images/opcion_3_Jugador.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opcion_4_Jugador.png", "assets/images/opcion_4_Jugador.png");
			type.set ("assets/images/opcion_4_Jugador.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opcion_soldado_1.png", "assets/images/opcion_soldado_1.png");
			type.set ("assets/images/opcion_soldado_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/opcion_zombie_1.png", "assets/images/opcion_zombie_1.png");
			type.set ("assets/images/opcion_zombie_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/private3-8.png", "assets/images/private3-8.png");
			type.set ("assets/images/private3-8.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/prueva2.png", "assets/images/prueva2.png");
			type.set ("assets/images/prueva2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pruevaNivel3-8.png", "assets/images/pruevaNivel3-8.png");
			type.set ("assets/images/pruevaNivel3-8.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tanque.png", "assets/images/tanque.png");
			type.set ("assets/images/tanque.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/torreta_jugador_op2.png", "assets/images/torreta_jugador_op2.png");
			type.set ("assets/images/torreta_jugador_op2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/armaSinBalas.wav", "assets/music/armaSinBalas.wav");
			type.set ("assets/music/armaSinBalas.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/disparoJugador.mp3", "assets/music/disparoJugador.mp3");
			type.set ("assets/music/disparoJugador.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/DisparoJugadorAnda.wav", "assets/music/DisparoJugadorAnda.wav");
			type.set ("assets/music/DisparoJugadorAnda.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/EfectoTriggered.wav", "assets/music/EfectoTriggered.wav");
			type.set ("assets/music/EfectoTriggered.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/Metallica-FadeToBlackMusic_Video.wav", "assets/music/Metallica-FadeToBlackMusic_Video.wav");
			type.set ("assets/music/Metallica-FadeToBlackMusic_Video.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Opcion1-jugador_Muere.wav", "assets/music/Opcion1-jugador_Muere.wav");
			type.set ("assets/music/Opcion1-jugador_Muere.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/sonidoDisparoTanque.wav", "assets/music/sonidoDisparoTanque.wav");
			type.set ("assets/music/sonidoDisparoTanque.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
