package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * The Knight.
	 * 
	 * The Knight cannot be killed by slicing. The player must use a chandelier to kill him.
	 */
	public class Knight extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		
		public function Knight(x:Number = 0) {
			if (x == 0)
				x = FP.width; //default to FP.width
			
			super(x, Global.groundY - FP.getBitmap(Global.GRAPHIC_KNIGHT).height, new Image(Global.GRAPHIC_KNIGHT), new Pixelmask(FP.getBitmap(Global.GRAPHIC_KNIGHT)));
			this.type = "knight";
		
			Global.SFX_KNIGHT.play();
			//TODO: animation
		}
		
		override public function update():void {
			super.update();
			
			x -= Global.rate * .25;
			
			if (x < -16)
				FP.world.remove(this);
			
			if (this.collide("player", this.x, this.y)) {
				Global.player.undress();
			}
			
			if (this.collide("chandelier", this.x, this.y)) {
				(this.collide("chandelier", this.x, this.y) as Chandelier).undress();
				undress();
			}
			
			if (!Knight.playedVoiceover && this.x <= FP.width - 16) {
				Game.isPaused = true;
				Global.SFX_KNIGHT_DIALOGUE.complete = Game.unpause;
				Global.SFX_KNIGHT_DIALOGUE.play();
				Knight.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
		}
		
		private function undress():void {
			Global.playSfxSlice();
			Global.playSfxHumanDeath();
			Global.undressAnimationHandler.playVerticalCutAnimation(this.x, this.y, Global.GRAPHIC_KNIGHT);
			this.world.add(new Girl(this.x));
			this.world.remove(this);
		}
	}
}