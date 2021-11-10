package;

import haxe.rtti.CType.Rights;
#if desktop
import Discord.DiscordClient;
#end
import Section.SwagSection;
import Song.SwagSong;
import WiggleEffect.WiggleEffectType;
import flixel.FlxBasic;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxSort;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import haxe.Json;
import lime.utils.Assets;
import openfl.display.BlendMode;
import openfl.display.StageQuality;
import openfl.filters.ShaderFilter;
import openfl.utils.Assets as OpenFlAssets;
import editors.ChartingState;
import editors.CharacterEditorState;
import Achievements;
import StageData;
import FunkinLua;
import DialogueBoxPsych;

#if sys
import sys.FileSystem;
#end

using StringTools;

class Events {
    public static function runPremadeEvent(funnyid:Int, vars:Array<Dynamic>) {
        trace('RUNNING EVENT ${Std.string(funnyid)} LOL');
        switch (funnyid) {
            case 0:
                if (vars[0] == "cheating")
                {
                    if (vars[1] == 1) {
                        FlxTween.tween(vars[2], {x: (FlxG.width * 0.25) + (vars[3] * (32 * 5))}, 2, { type: FlxTweenType.PINGPONG, ease: FlxEase.quadInOut});
                    }
                    else
                    {	
                        vars[2].alpha = 1;
                        FlxTween.tween(vars[2], {alpha: 0}, 2, { type: FlxTweenType.PINGPONG, ease: FlxEase.quadInOut});
                    }
                }
                return funnyid;
            case 1:
		        if (vars[0] == "cheating") {
		        	vars[1].x -= 30;
		        	FlxTween.tween(vars[1], {x: 30}, 1, {type: FlxTweenType.PINGPONG, ease: FlxEase.sineInOut});
		        }
                return funnyid;
            default:
                trace("invalid id lol");
                return funnyid;
        }
    }
}