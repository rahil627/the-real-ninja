package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * An object that must be ducked under.
	 */
	public class Parent extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		
		public function Parent() {
			super(FP.width, Global.groundY - FP.getBitmap(Global.GRAPHIC_PARENT).height, new Image(Global.GRAPHIC_PARENT), new Pixelmask(FP.getBitmap(Global.GRAPHIC_PARENT_HITBOX))); //TODO: can see a line in the flashlight image!
			//this.centerOrigin(); //did not work
			//TODO: animate legs
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
			
			if (!Parent.playedVoiceover && this.x <= FP.width - FP.getBitmap(Global.GRAPHIC_PARENT).width) {
				Game.isPaused = true;
				Global.SFX_PARENT_DIALOGUE.complete = Game.unpause;
				Global.SFX_PARENT_DIALOGUE.play();
				Parent.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10); //TODO: currently zooms in to the entity's origin which is currently located on the top left of the graphic
			}
		}
	}
}