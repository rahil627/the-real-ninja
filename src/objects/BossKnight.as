package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	/**
	 * The BAUS knight!
	 */
	public class BossKnight extends Entity {
		
		private var hp:int = 5;
		private var linearMotionTween:LinearMotion;
		private static var playedVoiceover:Boolean = false;
		
		public function BossKnight() {
			super(FP.width, Global.groundY - FP.getBitmap(Global.GRAPHIC_BOSS_KNIGHT).height, new Image(Global.GRAPHIC_BOSS_KNIGHT), new Pixelmask(FP.getBitmap(Global.GRAPHIC_BOSS_KNIGHT)));
			this.type = "bossKnight";
			
			linearMotionTween = new LinearMotion();
			this.addTween(linearMotionTween);
			
			Global.SFX_BOSS_KNIGHT.play();
		}
		
		override public function update():void {
			super.update();
			
			this.x -= Global.rate * .25 / 2;
			
			if (linearMotionTween.active)
				this.x = linearMotionTween.x;
			
			if (x < -16)
				FP.world.remove(this);
			
			if (this.collide("player", this.x, this.y)) {
				Global.player.undress();
			}
			
			if (!BossKnight.playedVoiceover && this.x <= FP.width - FP.getBitmap(Global.GRAPHIC_BOSS_KNIGHT).width / 2) {
				Game.isPaused = true;
				Global.SFX_BOSS_KNIGHT_DIALOGUE.complete = Game.unpause;
				Global.SFX_BOSS_KNIGHT_DIALOGUE.play(); //TODO: adventure time "WORD TO YOUR MOTHERRRR"?
				BossKnight.playedVoiceover = true;
				
				FP.screen.scale = 4;
				FP.setCamera(this.x - FP.screen.width / 4, this.y - FP.screen.height / 4);
			}
			
			if (this.collide("chandelier", this.x, this.y)) {
				(this.collide("chandelier", this.x, this.y) as Chandelier).undress();
				hp--;
				//fall back
				linearMotionTween.setMotion(this.x, this.y, this.x + 25, this.y, 30);
				linearMotionTween.start();
			}
			
			if (hp == 0)
				undress();
		}
		
		private function undress():void {
			super.removed(); //should this be at the end?
			Global.SFX_BOSS_KNIGHT_DEATH.play();
			Global.undressAnimationHandler.playVerticalCutAnimation(this.x, this.y, Global.GRAPHIC_BOSS_KNIGHT);
			this.world.add(new Boy(this.x));
			this.world.add(new Girl(this.x + 10));
			this.world.add(new Girl(this.x - 10));
			this.world.add(new Boy(this.x + 20));
			this.world.add(new Boy(this.x - 20));
			//undress all enemies on the stage, stop spawning enemies, then add a cop after 5 seconds
			Global.game.bossKnightDied = true;		
			this.world.remove(this);
		}
	}
}