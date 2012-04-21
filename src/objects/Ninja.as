package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import rahil.Rahil;
	
	/**
	 * The standard enemy. Slice once to kill.
	 */
	public class Ninja extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		
		public function Ninja() {
			super(FP.width, Global.groundY - 16, new Image(Global.GRAPHIC_NINJA), new Pixelmask(FP.getBitmap(Global.GRAPHIC_NINJA)));
		
			//try using a sprite map to animate the object, move the legs and sway the sword
			//should make a cuttable interface
			
			if (Rahil.randomNumber(1, 10) == 1)
				Global.SFX_NINJA3.play();
			else if (Rahil.randomNumber(1, 4) == 1)
				Global.SFX_NINJA2.play();
			else
				Global.SFX_NINJA.play();
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate;
			
			if (x < -16) {
				FP.world.remove(this);
			}
			
			if (this.collide("player", this.x, this.y)){
				Global.player.undress();
			}
			
			if (this.collide("cut", this.x, this.y))
				undress();
				
			if (!Ninja.playedVoiceover && this.x <= FP.width - 16) {
				Game.isPaused = true;
				Global.SFX_NINJA_DIALOGUE.complete = Game.unpause;
				Global.SFX_NINJA_DIALOGUE.play();
				Ninja.playedVoiceover = true;
				
				//TODO: add a zoom in and zoom out tween
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
		}
		
		private function undress():void { //TODO: should make an enemy interface that includes undress
			Global.playSfxSlice();
			Global.playSfxHumanDeath();
			
			//TODO: costume removal animation algorithm
			//possible methods:
			//create an pre-concieved animation for each enemy
			//split the bitmaps in several pre-concieved ways, then move away from the center and remove
			//split the bitmaps according to the slice line, then move away from the center and remove
			
			//for now, split vertically or horizontally
			//create one bitmap and regenerate each time or create two bitmaps that move away from the parent
			
			//set to hitbox?
			
			Global.undressAnimationHandler.playHorizontalCutAnimation(this.x, this.y, Global.GRAPHIC_NINJA);
			this.world.remove(this);
			//this.world.add(new CandyAnimationEntity(this.x, this.y)); //TODO: explosion
			this.world.add(new Boy(this.x));
		}
	}
}