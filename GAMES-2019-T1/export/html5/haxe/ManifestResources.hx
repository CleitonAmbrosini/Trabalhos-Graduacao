package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y36:assets%2Fimages%2FbackgroundMenu.pngR2i501910R3y5:IMAGER5R7R6tgoR0y30:assets%2Fimages%2FbirdShot.pngR2i2827R3R8R5R9R6tgoR0y39:assets%2Fimages%2Fbutton_credits_on.pngR2i6823R3R8R5R10R6tgoR0y36:assets%2Fimages%2Fbutton_exit_on.pngR2i5813R3R8R5R11R6tgoR0y36:assets%2Fimages%2Fbutton_play_on.pngR2i5847R3R8R5R12R6tgoR0y26:assets%2Fimages%2Fexit.pngR2i2430R3R8R5R13R6tgoR0y36:assets%2Fimages%2FgameBackground.pngR2i1735105R3R8R5R14R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R15R6tgoR0y30:assets%2Fimages%2Finimigo1.pngR2i102567R3R8R5R16R6tgoR0y30:assets%2Fimages%2Finimigo2.pngR2i138578R3R8R5R17R6tgoR0y30:assets%2Fimages%2Finimigo3.pngR2i489036R3R8R5R18R6tgoR0y30:assets%2Fimages%2FmainMenu.pngR2i2864R3R8R5R19R6tgoR0y33:assets%2Fimages%2Fscreenshot1.pngR2i492164R3R8R5R20R6tgoR0y26:assets%2Fimages%2Fshot.pngR2i4710R3R8R5R21R6tgoR0y34:assets%2Fimages%2FspritePlayer.pngR2i874246R3R8R5R22R6tgoR0y29:assets%2Fimages%2Fyoulose.pngR2i10977R3R8R5R23R6tgoR2i7649689R3y5:MUSICR5y29:assets%2Fmusic%2Fabertura.oggy9:pathGroupaR25R25R25hR6tgoR2i1596064R3R24R5y26:assets%2Fmusic%2Ffundo.oggR26aR27R27R27hR6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R28R6tgoR2i39440R3y5:SOUNDR5y36:assets%2Fsounds%2FarcadeGameOver.oggR26aR30R30R30hR6tgoR2i42174R3R29R5y24:assets%2Fsounds%2Fgo.oggR26aR31R31R31hR6tgoR2i899780R3R29R5y33:assets%2Fsounds%2FmusicFinish.oggR26aR32R32R32hR6tgoR2i39440R3R29R5y32:assets%2Fsounds%2FplayerDead.oggR26aR33R33R33hR6tgoR2i401257R3R29R5y31:assets%2Fsounds%2FplayerRun.oggR26aR34R34R34hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R35R6tgoR2i30117R3R29R5y29:assets%2Fsounds%2Fyoulose.oggR26aR36R36R36hR6tgoR0R1R2zR3R4R5R1R6tgoR0R7R2i501910R3R8R5R7R6tgoR0R9R2i2827R3R8R5R9R6tgoR0R10R2i6823R3R8R5R10R6tgoR0R11R2i5813R3R8R5R11R6tgoR0R12R2i5847R3R8R5R12R6tgoR0R13R2i2430R3R8R5R13R6tgoR0R14R2i1735105R3R8R5R14R6tgoR0R15R2zR3R4R5R15R6tgoR0R16R2i102567R3R8R5R16R6tgoR0R17R2i138578R3R8R5R17R6tgoR0R18R2i489036R3R8R5R18R6tgoR0R19R2i2864R3R8R5R19R6tgoR0R20R2i492164R3R8R5R20R6tgoR0R21R2i4710R3R8R5R21R6tgoR0R22R2i874246R3R8R5R22R6tgoR0R23R2i10977R3R8R5R23R6tgoR2i7649689R3R24R5R25R26aR25R25R25hgoR2i1596064R3R24R5R27R26aR27R27R27hgoR0R28R2zR3R4R5R28R6tgoR2i39440R3R29R5R30R26aR30R30R30hgoR2i42174R3R29R5R31R26aR31R31R31hgoR2i899780R3R29R5R32R26aR32R32R32hgoR2i39440R3R29R5R33R26aR33R33R33hgoR2i401257R3R29R5R34R26aR34R34R34hgoR0R35R2zR3R4R5R35R6tgoR2i30117R3R29R5R36R26aR36R36R36hgoR0R1R2zR3R4R5R1R6tgoR0R7R2i501910R3R8R5R7R6tgoR0R9R2i2827R3R8R5R9R6tgoR0R10R2i6823R3R8R5R10R6tgoR0R11R2i5813R3R8R5R11R6tgoR0R12R2i5847R3R8R5R12R6tgoR0R13R2i2430R3R8R5R13R6tgoR0R14R2i1735105R3R8R5R14R6tgoR0R15R2zR3R4R5R15R6tgoR0R16R2i102567R3R8R5R16R6tgoR0R17R2i138578R3R8R5R17R6tgoR0R18R2i489036R3R8R5R18R6tgoR0R19R2i2864R3R8R5R19R6tgoR0R20R2i492164R3R8R5R20R6tgoR0R21R2i4710R3R8R5R21R6tgoR0R22R2i874246R3R8R5R22R6tgoR0R23R2i10977R3R8R5R23R6tgoR2i7649689R3R24R5R25R26aR25R25R25hgoR2i1596064R3R24R5R27R26aR27R27R27hgoR0R28R2zR3R4R5R28R6tgoR2i39440R3R29R5R30R26aR30R30R30hgoR2i42174R3R29R5R31R26aR31R31R31hgoR2i899780R3R29R5R32R26aR32R32R32hgoR2i39440R3R29R5R33R26aR33R33R33hgoR2i401257R3R29R5R34R26aR34R34R34hgoR0R35R2zR3R4R5R35R6tgoR2i30117R3R29R5R36R26aR36R36R36hgoR2i2114R3R24R5y26:flixel%2Fsounds%2Fbeep.mp3R26aR37y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R24R5y28:flixel%2Fsounds%2Fflixel.mp3R26aR39y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R29R5R38R26aR37R38hgoR2i33629R3R29R5R40R26aR39R40hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R41R42y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R47R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R48R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_exit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_screenshot1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_exit_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo3 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo4 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_screenshot2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shot_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg1 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_exit_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo5 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo6 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inimigo7 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_screenshot3 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_shot_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg2 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/backgroundMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png extends lime.graphics.Image {}
@:keep @:image("assets/images/birdShot.png") @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/button_credits_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png extends lime.graphics.Image {}
@:keep @:image("assets/images/button_exit_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png extends lime.graphics.Image {}
@:keep @:image("assets/images/button_play_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png extends lime.graphics.Image {}
@:keep @:image("assets/images/exit.png") @:noCompletion #if display private #end class __ASSET__assets_images_exit_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gameBackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/inimigo1.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo2.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo3.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mainMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png extends lime.graphics.Image {}
@:keep @:image("assets/images/screenshot1.png") @:noCompletion #if display private #end class __ASSET__assets_images_screenshot1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/shot.png") @:noCompletion #if display private #end class __ASSET__assets_images_shot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spritePlayer.png") @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png extends lime.graphics.Image {}
@:keep @:image("assets/images/youlose.png") @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png extends lime.graphics.Image {}
@:keep @:file("assets/music/abertura.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/fundo.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arcadeGameOver.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/musicFinish.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerDead.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerRun.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/youlose.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/backgroundMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/birdShot.png") @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_credits_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_exit_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_play_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/exit.png") @:noCompletion #if display private #end class __ASSET__assets_images_exit_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/gameBackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png1 extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt1 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inimigo1.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo2 extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo2.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo3 extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo3.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo4 extends lime.graphics.Image {}
@:keep @:image("assets/images/mainMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/screenshot1.png") @:noCompletion #if display private #end class __ASSET__assets_images_screenshot2 extends lime.graphics.Image {}
@:keep @:image("assets/images/shot.png") @:noCompletion #if display private #end class __ASSET__assets_images_shot_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/spritePlayer.png") @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png1 extends lime.graphics.Image {}
@:keep @:image("assets/images/youlose.png") @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png1 extends lime.graphics.Image {}
@:keep @:file("assets/music/abertura.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/music/fundo.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arcadeGameOver.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/musicFinish.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerDead.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerRun.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt1 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/youlose.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg1 extends haxe.io.Bytes {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt2 extends haxe.io.Bytes {}
@:keep @:image("assets/images/backgroundMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundmenu_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/birdShot.png") @:noCompletion #if display private #end class __ASSET__assets_images_birdshot_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_credits_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_credits_on_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_exit_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_exit_on_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/button_play_on.png") @:noCompletion #if display private #end class __ASSET__assets_images_button_play_on_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/exit.png") @:noCompletion #if display private #end class __ASSET__assets_images_exit_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/gameBackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_gamebackground_png2 extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt2 extends haxe.io.Bytes {}
@:keep @:image("assets/images/inimigo1.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo5 extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo2.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo6 extends lime.graphics.Image {}
@:keep @:image("assets/images/inimigo3.png") @:noCompletion #if display private #end class __ASSET__assets_images_inimigo7 extends lime.graphics.Image {}
@:keep @:image("assets/images/mainMenu.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/screenshot1.png") @:noCompletion #if display private #end class __ASSET__assets_images_screenshot3 extends lime.graphics.Image {}
@:keep @:image("assets/images/shot.png") @:noCompletion #if display private #end class __ASSET__assets_images_shot_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/spritePlayer.png") @:noCompletion #if display private #end class __ASSET__assets_images_spriteplayer_png2 extends lime.graphics.Image {}
@:keep @:image("assets/images/youlose.png") @:noCompletion #if display private #end class __ASSET__assets_images_youlose_png2 extends lime.graphics.Image {}
@:keep @:file("assets/music/abertura.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_abertura_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/music/fundo.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_fundo_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/arcadeGameOver.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_arcadegameover_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/go.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_go_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/musicFinish.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_musicfinish_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerDead.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerdead_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/playerRun.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_playerrun_ogg2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt2 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/youlose.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_youlose_ogg2 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
