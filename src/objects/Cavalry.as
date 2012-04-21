package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * A Knight mounted on a horse.
	 * 
	 * The player may either use the chandelier to kill him instantly or slice him off of the horse first,
	 * then kill the Knight.
	 */
	public class Cavalry extends Entity {
		
		private static var playedVoiceover:Boolean = false;
		
		public function Cavalry() {
			super(FP.width, Global.groundY - FP.getBitmap(Global.GRAPHIC_CAVALRY).height, new Image(Global.GRAPHIC_CAVALRY), new Pixelmask(FP.getBitmap(Global.GRAPHIC_CAVALRY)));
			this.type = "cavalry";
			
			Global.SFX_CAVALRY.play();
			//TODO: animation
		}
		
		override public function update():void {
			super.update();
			
			x -= Global.rate * 1.5;
			
			if (x < -16)
				FP.world.remove(this);
			
			if (this.collide("player", this.x, this.y)) {
				Global.player.undress();
			}
			
			if (this.collide("chandelier", this.x, this.y)) {
				(this.collide("chandelier", this.x, this.y) as Chandelier).undress();
				undress();
			}
			
			if (this.collide("cut", this.x, this.y)) {
				//fall off of the horse
				undress();
				this.world.add(new Knight(this.x + 100));
			}
			
			if (!Cavalry.playedVoiceover && this.x <= FP.width - FP.getBitmap(Global.GRAPHIC_CAVALRY).width) {
				Game.isPaused = true;
				Global.SFX_CAVALRY_DIALOGUE.complete = Game.unpause;
				Global.SFX_CAVALRY_DIALOGUE.play();
				Cavalry.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
		}
		
		private function undress():void {
			Global.playSfxSlice();
			Global.playSfxHumanDeath(); //TODO: horse death?
			Global.undressAnimationHandler.playVerticalCutAnimation(this.x, this.y, Global.GRAPHIC_HORSE);
			this.world.add(new Parent_Cavalry(this.x));
			this.world.add(new Parent_Cavalry(this.x + 10));
			this.world.remove(this);
		}
	}
}