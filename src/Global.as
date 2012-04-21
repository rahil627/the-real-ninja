package {
	import backgrounds.Background;
	import backgrounds.Ground;
	import net.flashpunk.Sfx;
	import objects.Player;
	import objects.SliceHandler;
	import objects.UndressAnimationHandler;
	import rahil.Rahil;
	
	/**
	 * Game specific constants.
	 */
	public class Global {
		
		//classes
		public static var game:Game, player:Player, background:Background, ground:Ground, sliceHandler:SliceHandler, 
		undressAnimationHandler:UndressAnimationHandler
		public static var enemyTypes:Array = new Array(["ninja"]);
		
		//primary data types
		public static const rate:int = 2;
		public static const groundY:int = 96 - 16;
		
		//make images and sounds in a global class so that you only embed them once, not for each entity
		
		//graphics
		[Embed(source = '../assets/graphics/background_glow2.png')] //also easier access to assets
		public static const GRAPHIC_BACKGROUND:Class;
		
		[Embed(source = '../assets/graphics/ground_street.png')]
		public static const GRAPHIC_GROUND:Class;
		
		[Embed(source = '../assets/graphics/player.png')] //TODO: should add ninja gaiden style animation, sheathed sword, then animate sword when slicing
		public static const GRAPHIC_PLAYER:Class;
		
		[Embed(source = '../assets/graphics/jackolantern.png')]
		public static const GRAPHIC_JACKOLANTERN:Class
		
		[Embed(source = '../assets/graphics/jackolantern_hitbox.png')]
		public static const GRAPHIC_JACKOLANTERN_HITBOX:Class;
		
		[Embed(source = '../assets/graphics/parent.png')]
		public static const GRAPHIC_PARENT:Class;
		
		[Embed(source = '../assets/graphics/parent_hitbox.png')]
		public static const GRAPHIC_PARENT_HITBOX:Class;
		
		[Embed(source = '../assets/graphics/boy.png')]
		public static const GRAPHIC_BOY:Class;
		
		[Embed(source = '../assets/graphics/girl.png')]
		public static const GRAPHIC_GIRL:Class;
		
		[Embed(source = "../assets/graphics/ninja.png")]
		public static const GRAPHIC_NINJA:Class;
		
		[Embed(source = '../assets/graphics/samurai.png')]
		public static const GRAPHIC_SAMURAI:Class;
		
		[Embed(source = '../assets/graphics/zombie.png')]
		public static const GRAPHIC_ZOMBIE:Class;
		
		[Embed(source = '../assets/graphics/chandelier.png')]
		public static const GRAPHIC_CHANDELIER:Class;
		
		[Embed(source = '../assets/graphics/knight.png')]
		public static const GRAPHIC_KNIGHT:Class;
		
		[Embed(source = '../assets/graphics/cavalry.png')]
		public static const GRAPHIC_CAVALRY:Class;
		
		[Embed(source = '../assets/graphics/parent_cavalry.png')]
		public static const GRAPHIC_PARENT_CAVALRY:Class;
		
		[Embed(source = '../assets/graphics/horse.png')]
		public static const GRAPHIC_HORSE:Class;
		
		[Embed(source = '../assets/graphics/boss_knight.png')]
		public static const GRAPHIC_BOSS_KNIGHT:Class
		
		[Embed(source = '../assets/graphics/cop.png')]
		public static const GRAPHIC_COP:Class;
		
		//[Embed(source = '../assets/graphics/princess.png')] //unused
		//public static const GRAPHIC_PRINCESS:Class;
		
		//sounds
		
		//music
		[Embed(source = '../assets/sounds/music2.mp3')]
		public static const SOUND_MUSIC:Class;
		public static const SFX_MUSIC:Sfx = new Sfx(SOUND_MUSIC);
		
		//sound effects and voiceovers
		[Embed(source = '../assets/sounds/slice.mp3')]
		public static const SOUND_SLICE:Class;
		public static const SFX_SLICE:Sfx = new Sfx(SOUND_SLICE);
		
		[Embed(source = '../assets/sounds/slice2.mp3')]
		public static const SOUND_SLICE2:Class;
		public static const SFX_SLICE2:Sfx = new Sfx(SOUND_SLICE2);
		
		[Embed(source = '../assets/sounds/slice3.mp3')]
		public static const SOUND_SLICE3:Class;
		public static const SFX_SLICE3:Sfx = new Sfx(SOUND_SLICE3);
		
		[Embed(source = '../assets/sounds/slice4.mp3')]
		public static const SOUND_SLICE4:Class;
		public static const SFX_SLICE4:Sfx = new Sfx(SOUND_SLICE4);
		
		[Embed(source = '../assets/sounds/slice5.mp3')]
		public static const SOUND_SLICE5:Class;
		public static const SFX_SLICE5:Sfx = new Sfx(SOUND_SLICE5);
		
		[Embed(source = '../assets/sounds/whiff.mp3')] //unused
		public static const SOUND_WHIFF:Class;
		public static const SFX_WHIFF:Sfx = new Sfx(SOUND_WHIFF);
		
		[Embed(source = "../assets/sounds/human_death.mp3")]
		public static const SOUND_HUMAN_DEATH:Class;
		public static const SFX_HUMAN_DEATH:Sfx = new Sfx(SOUND_HUMAN_DEATH);
		
		[Embed(source = '../assets/sounds/human_death2.mp3')]
		public static const SOUND_HUMAN_DEATH2:Class;
		public static const SFX_HUMAN_DEATH2:Sfx = new Sfx(SOUND_HUMAN_DEATH2);
		
		[Embed(source = "../assets/sounds/human_death3.mp3")]
		public static const SOUND_HUMAN_DEATH3:Class;
		public static const SFX_HUMAN_DEATH3:Sfx = new Sfx(SOUND_HUMAN_DEATH3);
		
		[Embed(source = "../assets/sounds/human_death4.mp3")]
		public static const SOUND_HUMAN_DEATH4:Class;
		public static const SFX_HUMAN_DEATH4:Sfx = new Sfx(SOUND_HUMAN_DEATH4);
		
		[Embed(source = "../assets/sounds/human_death5.mp3")]
		public static const SOUND_HUMAN_DEATH5:Class;
		public static const SFX_HUMAN_DEATH5:Sfx = new Sfx(SOUND_HUMAN_DEATH5);
		
		[Embed(source = '../assets/sounds/kid.mp3')]
		public static const SOUND_KID:Class;
		public static const SFX_KID:Sfx = new Sfx(SOUND_KID);
		
		[Embed(source = '../assets/sounds/chandelier_death.mp3')]
		public static const SOUND_CHANDELIER_DEATH:Class;
		public static const SFX_CHANDELIER_DEATH:Sfx = new Sfx(SOUND_CHANDELIER_DEATH);
		
		[Embed(source = '../assets/sounds/jackolantern_dialogue.mp3')]
		public static const SOUND_JACKOLANTERN_DIALOGUE:Class;
		public static const SFX_JACKOLANTERN_DIALOGUE:Sfx = new Sfx(SOUND_JACKOLANTERN_DIALOGUE);
		
		[Embed(source = '../assets/sounds/parent_dialogue.mp3')]
		public static const SOUND_PARENT_DIALOGUE:Class;
		public static const SFX_PARENT_DIALOGUE:Sfx = new Sfx(SOUND_PARENT_DIALOGUE);
		
		[Embed(source = '../assets/sounds/ninja.mp3')]
		public static const SOUND_NINJA:Class;
		public static const SFX_NINJA:Sfx = new Sfx(SOUND_NINJA);
		
		[Embed(source = '../assets/sounds/ninja2.mp3')]
		public static const SOUND_NINJA2:Class;
		public static const SFX_NINJA2:Sfx = new Sfx(SOUND_NINJA2);
		
		[Embed(source = '../assets/sounds/ninja3.mp3')]
		public static const SOUND_NINJA3:Class;
		public static const SFX_NINJA3:Sfx = new Sfx(SOUND_NINJA3);
		
		[Embed(source = '../assets/sounds/ninja_dialogue.mp3')]
		public static const SOUND_NINJA_DIALOGUE:Class;
		public static const SFX_NINJA_DIALOGUE:Sfx = new Sfx(SOUND_NINJA_DIALOGUE);
		
		[Embed(source='../assets/sounds/samurai.mp3')]
		public static const SOUND_SAMURAI:Class;
		public static const SFX_SAMURAI:Sfx = new Sfx(SOUND_SAMURAI);
		
		[Embed(source='../assets/sounds/samurai2.mp3')]
		public static const SOUND_SAMURAI2:Class;
		public static const SFX_SAMURAI2:Sfx = new Sfx(SOUND_SAMURAI2);
		
		[Embed(source = '../assets/sounds/samurai_dialogue.mp3')]
		public static const SOUND_SAMURAI_DIALOGUE:Class;
		public static const SFX_SAMURAI_DIALOGUE:Sfx = new Sfx(SOUND_SAMURAI_DIALOGUE);
		
		[Embed(source = '../assets/sounds/zombie.mp3')]
		public static const SOUND_ZOMBIE:Class;
		public static const SFX_ZOMBIE:Sfx = new Sfx(SOUND_ZOMBIE);
		
		[Embed(source = '../assets/sounds/zombie2.mp3')]
		public static const SOUND_ZOMBIE2:Class
		public static const SFX_ZOMBIE2:Sfx = new Sfx(SOUND_ZOMBIE2);
		
		[Embed(source = '../assets/sounds/zombie_dialogue.mp3')]
		public static const SOUND_ZOMBIE_DIALOGUE:Class;
		public static const SFX_ZOMBIE_DIALOGUE:Sfx = new Sfx(SOUND_ZOMBIE_DIALOGUE);
		
		[Embed(source = '../assets/sounds/knight.mp3')]
		public static const SOUND_KNIGHT:Class;
		public static const SFX_KNIGHT:Sfx = new Sfx(SOUND_KNIGHT);
		
		[Embed(source = '../assets/sounds/cavalry.mp3')]
		public static const SOUND_CAVALRY:Class;
		public static const SFX_CAVALRY:Sfx = new Sfx(SOUND_CAVALRY);
		
		[Embed(source = '../assets/sounds/cavalry_dialogue.mp3')]
		public static const SOUND_CAVALRY_DIALOGUE:Class;
		public static const SFX_CAVALRY_DIALOGUE:Sfx = new Sfx(SOUND_CAVALRY_DIALOGUE);
		
		[Embed(source = '../assets/sounds/knight_dialogue.mp3')]
		public static const SOUND_KNIGHT_DIALOGUE:Class;
		public static const SFX_KNIGHT_DIALOGUE:Sfx = new Sfx(SOUND_KNIGHT_DIALOGUE);
		
		[Embed(source = '../assets/sounds/boss_knight.mp3')]
		public static const SOUND_BOSS_KNIGHT:Class;
		public static const SFX_BOSS_KNIGHT:Sfx = new Sfx(SOUND_BOSS_KNIGHT);
		
		[Embed(source = '../assets/sounds/boss_knight_dialogue.mp3')]
		public static const SOUND_BOSS_KNIGHT_DIALOGUE:Class;
		public static const SFX_BOSS_KNIGHT_DIALOGUE:Sfx = new Sfx(SOUND_BOSS_KNIGHT_DIALOGUE);
				
		[Embed(source = '../assets/sounds/boss_knight_death.mp3')]
		public static const SOUND_BOSS_KNIGHT_DEATH:Class;
		public static const SFX_BOSS_KNIGHT_DEATH:Sfx = new Sfx(SOUND_BOSS_KNIGHT_DEATH);
		
		[Embed(source = '../assets/sounds/cop_dialogue.mp3')]
		public static const SOUND_COP_DIALOGUE:Class;
		public static const SFX_COP_DIALOGUE:Sfx = new Sfx(SOUND_COP_DIALOGUE);
		
		[Embed(source = '../assets/sounds/player_death.mp3')]
		public static const SOUND_PLAYER_DEATH_DIALOGUE:Class;
		public static const SFX_PLAYER_DEATH_DIALOGUE:Sfx = new Sfx(SOUND_PLAYER_DEATH_DIALOGUE);
		
		//other voiceovers
		
		[Embed(source = '../assets/sounds/intro_dialogue.mp3')]
		public static const SOUND_INTRO_DIALOGUE:Class;
		public static const SFX_INTRO_DIALOGUE:Sfx = new Sfx(SOUND_INTRO_DIALOGUE);
		
		[Embed(source = '../assets/sounds/outro.mp3')]
		public static const SOUND_OUTRO_DIALOGUE:Class;
		public static const SFX_OUTRO_DIALOGUE:Sfx = new Sfx(SOUND_OUTRO_DIALOGUE);
		
		//outro
	
		private static var SFX_SLICE_ARRAY:Array = new Array(); //[SFX_SLICE, SFX_SLICE2, SFX_SLICE3, SFX_SLICE4, SFX_SLICE5]); //didn't work
		private static var SFX_HUMAN_DEATH_ARRAY:Array = new Array();
		
		//to set arrays, cannot create const array or even declare it with values
		public static function initialize() {
			SFX_SLICE_ARRAY.push(SFX_SLICE, SFX_SLICE2, SFX_SLICE3, SFX_SLICE4, SFX_SLICE5);
			SFX_HUMAN_DEATH_ARRAY.push(SFX_HUMAN_DEATH, SFX_HUMAN_DEATH2, SFX_HUMAN_DEATH3, SFX_HUMAN_DEATH4, SFX_HUMAN_DEATH5);
		}
		
		public static function playSfxSlice():void {
			(SFX_SLICE_ARRAY[Rahil.randomNumber(0, 4)] as Sfx).play();
		}
		
		public static function playSfxHumanDeath():void {
			(SFX_HUMAN_DEATH_ARRAY[Rahil.randomNumber(0, 4)] as Sfx).play();
		}
	}
	
	//intro
	//The protagonist is conceiving a plan for this halloween. "Every Halloween, kids come dress up to be semething they aren't. What a joke. I'm going to slice their disguises off and reveal who they really are: spoiled brats. I'll show them. I'll show them what a real ninja is."
	
	//jack o' lantern
	//What the. Who's putting jack o' lanterns on the street? No matter. I'll just have to jump over them to avoid being seen.
	
	//parent
	//Parents! They're not to blame. Best to avoid them. I'll just have to duck under their flashlight.
	
	//ninja
	//Great wannabe ninjas with broadswords. This will be cake. Just slice 'em.
	
	//samurai //TODO: *I'll* attack him
	//What kind of ninja brings friends along? Time to show this samurai professional swordsmanship. Attack him when his guard is down.
	
	//zombie
	//Ahhh, the classic... I guess I'm supposed aim for the neck?
	
	//medieval level
	
	//knight
	//Look at this kid. He wrapped himself in aluminum and claims he's a knight. I'll find another way to further humiliate him. Perhaps those chandeliers will come in handy.
	
	//cavalry
	//Wait...Are those parents underneath that horse? *sigh*. White people.
	
	//boss knight
	//Wow... Now that's just a waste of aluminum foil. I bet their mothers are angry.
	//...
	//WORD TO YOUR MOTHER!!!
	
	//end
	//A cop shows up. "Hey, kid. You there. The kids have been compaining about you. I heard you've been tearing kid's costumes in this neighborhood."
	//p: ...
	//Oh don't want to talk, huh? Let's see who you really are.
	//[in game, the cop approaches the protagonist]
	//The cop forcefully removes the protagonists costume
	//the protagonist cries [stop music]
	//no...no...Nooooooo!!
	//cop: So this is the little runt causing all the trouble? Sure is ugly. Let's find his parents. --see WATCHMEN, Rorshach revealed
	//[player dies]
	//the protagonist is shown, decostumed, crying
	
	//later... [black screen]
	
	//I'm no ninja. I'm no better than any other kid...Not yet, at least. With more training, I WILL, beceme a REAL ninja.
	
	//the background should be black, with random lights in the back representing other trick-or-treaters. There should be houses every now and then too. Generate the background? Add glow effects, try to make it pretty.
	
	//tint it red/purple for medieval?
}