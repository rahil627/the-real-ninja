package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * The standard enemy. Slice once to kill.
	 */
	public class Cop extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		private static var playedVoiceover2:Boolean = false;
		
		public function Cop() {
			super(FP.width, Global.groundY - 32, new Image(Global.GRAPHIC_COP), new Pixelmask(FP.getBitmap(Global.GRAPHIC_COP)));
		
			//TODO: police siren
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate;
			
			if (x < -1000) { //the end
				//FP.world.remove(this);
				//TODO: fade out?
				FP.world = new CreditsScreen();
			}
			
			if (!Cop.playedVoiceover2 && this.collide("player", this.x, this.y)) {
				Global.player.undress(false); //undress the player, but don't restart the game
				Game.isPaused = true;
				Global.SFX_PLAYER_DEATH_DIALOGUE.complete = Game.unpause;
				Global.SFX_PLAYER_DEATH_DIALOGUE.play();
				Cop.playedVoiceover2 = true;
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10); //center on player, then the cop?
			}
			
			if (!Cop.playedVoiceover && this.x == FP.width - FP.getBitmap(Global.GRAPHIC_COP).width) {
				Game.isPaused = true;
				Global.SFX_COP_DIALOGUE.complete = Game.unpause;
				Global.SFX_COP_DIALOGUE.play();
				Cop.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
		}
	}
}