package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class FinalCreditsState extends MusicBeatState
{
	private static var creditsStuff:Array<Dynamic> = [
		// String - HEAD/SUBHEAD/NAME/DESC - Color
		[['Friday Night Funkin\''], "SUBHEAD", FlxColor.CYAN],
		[['Vs ZFans'], "SUBHEAD", FlxColor.WHITE],
		[[''], "NULL"],
		[['Made in'], "SUBHEAD"],
		[['Psych Engine'], "SUBHEAD"],
		[['by ShadowMario and RiverOaken'], "NAME"],
		[[''], "NULL"],
		[['Project Managers'], "SUBHEAD", FlxColor.MAGENTA],
		[['BandanaX Flame'], "NAME"],
		[['Main Project Manager'], "DESC"],
		[['MeowcaTheoRange'], "NAME"],
		[['Idea-Maker and Psych Engine Porter'], "DESC"],
		[['(officially approved port)'], "DESC"],
		[[''], "NULL"],
		[['Programmers'], "SUBHEAD", FlxColor.LIME],
		[['MeowcaTheoRange'], "NAME"],
		[['Main Programmer'], "DESC"],
		[['BandanaX Flame'], "NAME"],
		[['Song Charting, Character Creation'], "DESC"],
		[[''], "NULL"],
		[['Art'], "SUBHEAD", FlxColor.ORANGE],
		[['Main Art'], "SUBSUBHEAD"],
		[['EnigmX'], "NAME"],
		[['[???]'], "DESC"],
		[['Sal Bites You'], "NAME"],
		[['[???]'], "DESC"],
		[['BandanaX Flame'], "NAME"],
		[['"Flame"'], "DESC"],
		[['"3D Flame"', 'made by MeowcaTheoRange'], "DESC"],
		[['Benjamin Banjo'], "NAME"],
		[['[???]'], "DESC"],
		[['Diamondbootz'], "NAME"],
		[['[???]'], "DESC"],
		[['Bossaroni'], "NAME"],
		[['[???]'], "DESC"],
		[['pinkmoment'], "NAME"],
		[['"Devin"', 'made by MeowcaTheoRange'], "DESC"],
		[['Goos'], "NAME"],
		[['[???]'], "DESC"],
		[['Jofer2345'], "NAME"],
		[['"Jofer"'], "DESC"],
		[['SpartanFar'], "NAME"],
		[['[???]'], "DESC"],
		[['MeowcaTheoRange'], "NAME"],
		[['"Mikey"'], "DESC"],
		[['"3D Mikey"'], "DESC"],
		[['Background Art'], "SUBSUBHEAD"],
		[['Sal Bites You'], "NAME"],
		[['"Silver\'s Stage"'], "DESC"],
		[['BandanaX Flame'], "NAME"],
		[['"Out Of Bounds"'], "DESC"],
		[['Benjamin Banjo'], "NAME"],
		[['[???]'], "DESC"],
		[['MeowcaTheoRange'], "NAME"],
		[['"Silver\'s Stage"', 'made by Sal Bites You'], "DESC"],
		[['"Mikey\'s Stage"'], "DESC"],
		[[''], "NULL"],
		[['Music'], "SUBHEAD", FlxColor.PINK],
		[['Audio Design and SFX'], "SUBSUBHEAD"],
		[['MeowcaTheoRange'], "NAME"],
		[['"Menu screens"'], "DESC"],
		[['"Mikey misses"'], "DESC"],
		[['Music'], "SUBSUBHEAD"],
		[['MeowcaTheoRange'], "NAME"],
		[['"Out Of Bounds"'], "DESC"],
		[['"Goos - Vocals"'], "DESC"],
		[['"Silver"'], "DESC"],
		[['"Mikey"'], "DESC"],
		[['"Credits Music"'], "DESC"],
		[['"Gettin\' Freaky - ZFans Remix"'], "DESC"],
		[['"Cheating - ZFans Remix"'], "DESC"],
		[['KiwiBoiStudios'], "NAME"],
		[['"Goos"'], "DESC"],
		[['Soundfonts'], "SUBSUBHEAD"],
		[['MeowcaTheoRange'], "NAME"],
		[['"MightyGoos - Goos"'], "DESC"],
		[['"pinkmoment - Devin"'], "DESC"],
		[['"KawaiSprite - Boyfriend"'], "DESC"],
		[['"Sal Bites You - Sal"'], "DESC"],
		[['"KiwiBoiStudios - Kiwi"'], "DESC"],
		[[''], "NULL"],
		[['GUEST EXISTERS'], "SUBHEAD", FlxColor.CYAN],
		[['Yully Man'], "NAME"],
		[['"Yully"'], "DESC"],
		[['drannieiscool'], "NAME"],
		[['"Bitty"'], "DESC"],
		[['"3D Bitty"', 'made by MeowcaTheoRange'], "DESC"],
		[['Deja Aves'], "NAME"],
		[['[???]'], "DESC"],
		[['Hero Star'], "NAME"],
		[['Diamond', 'made by MeowcaTheoRange'], "DESC"],
		[[''], "NULL"],
		[['PLAYTESTING'], "SUBHEAD", FlxColor.RED],
		[['BandanaX Flame'], "NAME"],
		[['"Game testing"'], "DESC"],
		[['"Bug fixing"'], "DESC"],
		[['MeowcaTheoRange'], "NAME"],
		[['"Game building"'], "DESC"],
		[['"Game testing"'], "DESC"],
		[['"Game releasing"'], "DESC"],
		[['AND YOU'], "SUBHEAD", FlxColor.WHITE],
		[['Thank you for playing!'], "SUBSUBHEAD", FlxColor.WHITE, "STATIONARY"],
		[[''], "NULL"],
		[[''], "NULL"],
		[[''], "NULL"],
		[[''], "NULL"],
		[[''], "NULL"],
		[['PRESS BACKSPACE TO LEAVE'], "DESC", FlxColor.WHITE, "SUBSTATIONARY"]
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var arrow:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;
	private var grpOptions:FlxTypedGroup<Alphabet>;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Final Credits", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var textsizelol:Float;
			var lineheight:Int;
			var isbold:Bool;
			if (creditsStuff[i][1] == "HEAD")
			{
				textsizelol = 1.5;
				lineheight = 70;
				isbold = true;
			}
			else if (creditsStuff[i][1] == "SUBHEAD")
			{
				textsizelol = 1.25;
				lineheight = 52;
				isbold = true;
			}
			else if (creditsStuff[i][1] == "SUBSUBHEAD")
			{
				textsizelol = 1;
				lineheight = 35;
				isbold = true;
			}
			else if (creditsStuff[i][1] == "DESC")
			{
				textsizelol = 0.75;
				lineheight = 17;
				isbold = false;
			}
			else
			{
				textsizelol = 1;
				lineheight = 35;
				isbold = false;
			}
			var optionText:Alphabet = new Alphabet(0, lineheight * i, creditsStuff[i][0][0], isbold, false, 0.05, textsizelol);
			optionText.isMenuItem = true;
			optionText.ID = i;
			optionText.screenCenter(X);
			optionText.forceX = optionText.x;
			optionText.targetY = i;
			grpOptions.add(optionText);
		}
        FlxG.sound.playMusic(Paths.music('fcredits', "shared"), 0.7);

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);
		arrow = new FlxText(0, 0, 0, "", 32);
        arrow.screenCenter(Y);
		arrow.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		arrow.scrollFactor.set();
		arrow.borderSize = 2.4;
		add(arrow);

		bg.color = creditsStuff[0][2];
		intendedColor = bg.color;
		super.create();
	}

	override function update(elapsed:Float)
	{
		var lastIndex:Int = 0;
		for (item in grpOptions.members)
		{
			if (item.getScreenPosition().y >= 200 && item.getScreenPosition().y <= 290)
			{
		        descText.text = (creditsStuff[item.ID][0][1] != null ? creditsStuff[item.ID][0][1] : "");
                arrow.text = (creditsStuff[item.ID][0][1] != null ? ">" : "");
                arrow.x = item.getScreenPosition().x - 50;
                arrow.y = item.getScreenPosition().y + 70;
				if (item.ID > lastIndex)
				{
					var newColor:Int = (creditsStuff[item.ID][2] != null ? creditsStuff[item.ID][2] : 0);
					if (newColor != 0 && newColor != intendedColor)
					{
						if (colorTween != null)
						{
							colorTween.cancel();
						}
						intendedColor = newColor;
						colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
							onComplete: function(twn:FlxTween)
							{
								colorTween = null;
							}
						});
					}
				}
			}
			var velocity:Float = -0.008;
			if (FlxG.keys.pressed.DOWN)
			{
				velocity += -0.008;
			}
			if (FlxG.keys.pressed.UP)
			{
				velocity += 0.004;
			}
			if (FlxG.keys.pressed.SPACE)
			{
				velocity += 0.024;
			}
			if (FlxG.keys.pressed.SEVEN)
			{
				velocity += -0.176;
			}
			if (item.getScreenPosition().y <= FlxG.height / 2 - 35 && creditsStuff[item.ID][3] == "STATIONARY")
			{
				// nothing
			}
			else if (item.getScreenPosition().y <= FlxG.height / 2 + 105 && creditsStuff[item.ID][3] == "SUBSTATIONARY")
			{
				// nothing
			}
			else
			{
				item.targetY += velocity;
			}
			lastIndex = item.ID;
		}
		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
