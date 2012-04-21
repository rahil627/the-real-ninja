package objects {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import rahil.Rahil;
	
	/**
	 * Samurais can only be attacked when their guard is down.
	 */
	public class Samurai extends Entity {
		
		private var spriteMap:Spritemap = new Spritemap(Global.GRAPHIC_SAMURAI, 16, 16, null);
		private static var playedVoiceover:Boolean = false;
		
		public function Samurai() {
			super(FP.width, Global.groundY - 16, spriteMap);
			//spriteMap.add("guarding", [0], 0, true);
			//spriteMap.add("attacking", [1], 0, true);
			spriteMap.add("guardingAndAttacking", [0, 1], 1/60, true);
			spriteMap.play("guardingAndAttacking");
			
			Rahil.randomNumber(0, 1) == 1 ? Global.SFX_SAMURAI.play() : Global.SFX_SAMURAI2.play();
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate * .80;
			
			if (x < -16) {
				FP.world.remove(this);
			}
			
			if (this.collide("player", this.x, this.y)){
				Global.player.undress();
			}
			
			if (this.collide("cut", this.x, this.y) && spriteMap.frame == 0)
				undress();
			
			if (!Samurai.playedVoiceover && this.x <= FP.width - 16) {
				Game.isPaused = true;
				Global.SFX_SAMURAI_DIALOGUE.complete = Game.unpause;
				Global.SFX_SAMURAI_DIALOGUE.play();
				Samurai.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
			
			var bitmapData:BitmapData = new BitmapData(16, 16, true, 0);
			spriteMap.render(bitmapData, new Point(0, 0), new Point(0, 0));
			this.mask = new Pixelmask(bitmapData);
		}
		
		private function undress():void {
			Global.playSfxSlice();
			Global.playSfxHumanDeath();
			
			var bitmapData:BitmapData = new BitmapData(16, 16, true, 0); //sloppy
			spriteMap.render(bitmapData, new Point(0, 0), new Point(0, 0));
			Global.undressAnimationHandler.playHorizontalCutAnimationBitmap(this.x, this.y, bitmapData);
			
			this.world.remove(this);
			this.world.add(new Boy(this.x));
		}
	}
}