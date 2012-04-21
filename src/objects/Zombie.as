package objects {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Draw;
	import rahil.Rahil;
	
	/**
	 * The player must slice the Zombie's head off to kill it.
	 */
	public class Zombie extends Entity {
		
		private var spriteMap:Spritemap = new Spritemap(Global.GRAPHIC_ZOMBIE, 16, 16);
		private static var playedVoiceover:Boolean = false;
		
		public function Zombie() {
			super(FP.width, Global.groundY - FP.getBitmap(Global.GRAPHIC_ZOMBIE).height, spriteMap);
			this.setHitbox(1, 2, -8, -9); //set the hitbox to the neck TODO: why is it negative?
			this.type = "zombie";
			//trace("originX: " + originX, "originY: " + originY, "width: " + width, "height: " + height);

			spriteMap.add("walking", [0, 1], 1 / 60, true);
			spriteMap.play("walking");
			
			Rahil.randomNumber(0, 1) == 1 ? Global.SFX_ZOMBIE.play(): Global.SFX_ZOMBIE2.play();
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate * .5;
			
			if (x < -16) {
				FP.world.remove(this);
			}
			
			if (this.collide("player", this.x, this.y)) {
				Global.player.undress();
			}
			
			if (this.collide("cut", this.x, this.y))
				undress();
				
			if (!Zombie.playedVoiceover && this.x == FP.width - 16) {
				Game.isPaused = true;
				Global.SFX_ZOMBIE_DIALOGUE.complete = Game.unpause;
				Global.SFX_ZOMBIE_DIALOGUE.play();
				Zombie.playedVoiceover = true;
				
				FP.screen.scale = 10;
				FP.setCamera(this.x - FP.screen.width / 10, this.y - FP.screen.height / 10);
			}
				
			//blinking hitbox
			var bitmapData:BitmapData = new BitmapData(16, 16, true, 0)
			spriteMap.render(bitmapData, new Point(0, 0), new Point(0, 0));
			Draw.setTarget(bitmapData);
			Draw.hitbox(this, false, FP.rand(0xFFFFFF), 1);
			Draw.resetTarget();
			this.graphic = new Image(bitmapData);
		}
		
		private function undress():void {
			Global.playSfxSlice();
			Global.playSfxHumanDeath();
			
			//TODO: play costume removal animation
			//possible methods:
			//create an pre-concieved animation for each enemy
			//split the bitmaps in several pre-concieved ways, then move away from the center and remove
			//split the bitmaps according to the slice line, then move away from the center and remove
			
			//for now, split vertically or horizontally
			//create one bitmap and regenerate each time or create two bitmaps that move away from the parent
			
			//set to hitbox?
			var bitmapData:BitmapData = new BitmapData(16, 16, true, 0); //sloppy
			spriteMap.render(bitmapData, new Point(0, 0), new Point(0, 0));
			
			Global.undressAnimationHandler.playHorizontalCutAnimationBitmap(this.x, this.y, bitmapData); //TODO: need to cut from the head
			this.world.remove(this);
			
			//add boy
			this.world.add(new Boy(this.x));
		}
	}
}