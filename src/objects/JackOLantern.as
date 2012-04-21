package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * An object that must be jumped over.
	 */
	public class JackOLantern extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		
		public function JackOLantern() {
			super(FP.width, FP.height - 32, new Image(Global.GRAPHIC_JACKOLANTERN), new Pixelmask(FP.getBitmap(Global.GRAPHIC_JACKOLANTERN_HITBOX)));
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate;
			
			if (x < -16) {
				FP.world.remove(this);
			}
			
			if (this.collide("player", this.x, this.y)) {
				Global.player.undress();
			}
			
			if (!JackOLantern.playedVoiceover && this.x <= FP.width - 16) {
				Game.isPaused = true; //static vs global reference to the instance?
				Global.SFX_JACKOLANTERN_DIALOGUE.complete = Game.unpause;
				Global.SFX_JACKOLANTERN_DIALOGUE.play();
				JackOLantern.playedVoiceover = true;
				
				FP.screen.scale = 10; //even after scaling, screen.width and screen.height remain (320, 96)
				//apparently it never updates, check FP.stage.width adn FP.stage.height
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
		}
	}
}