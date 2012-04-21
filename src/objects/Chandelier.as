package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 */
	public class Chandelier extends Entity {
		private var falling:Boolean = false;
		private var speed:int = Global.rate * .5;
		private var blinking:Boolean = false;
		private var timer:int = 0;
		private var timeCollided:int;
		
		public function Chandelier(){
			super(FP.width, 0, new Image(Global.GRAPHIC_CHANDELIER));
			this.setHitbox(2, 8, -7, 0); //set the hitbox to the pole TODO: why is it negative?
			this.type = "chandelier";
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			this.x -= speed * 1.5;
			
			if (this.x < -16)
				this.world.remove(this);
			
			//if cut, fall
			if (this.collide("cut", this.x, this.y)) {
				falling = true;
				Global.playSfxSlice();
				//speed = Global.rate * .25; //change speed to match the knights speed;
				this.mask =  new Pixelmask (FP.getBitmap(Global.GRAPHIC_CHANDELIER));
			}
			
			if (falling)
				this.y += 2;
			
			//if (this.collideTypes(["knight", "cavalry", "bossKnight"], this.x, this.y) /* && !blinking*/)
				//takeHit();
				//undress(); //run this function from knight/cavalry/bossKnight
			
			if (this.collide("floor", this.x, this.y) /* && ! blinking*/)
				undress();
		
		/*
		   if (blinking && timer % 15 == 0) //could make a function for this. beginBlinking(timer:int, interval:int, entity:Entity) using FP.someTimeVar or this.world.timer
		   this.graphic.visible = !this.graphic.visible;
		
		   if (timeCollided && timer == timeCollided + 180)
		   this.world.remove(this);
		
		 */
		}
		
		public function undress():void {
			Global.undressAnimationHandler.playHorizontalCutAnimation(this.x, this.y, Global.GRAPHIC_CHANDELIER);
			this.world.remove(this);
		}
		
		public function takeHit():void {
			//stop, blink, and remove
			falling = false;
			blinking = true;
			timeCollided = timer;
			//this.mask = null; //remove the hitbox
			//this.setHitbox(0, 0, 0, 0);
			
			Global.SFX_CHANDELIER_DEATH.play();
		}
	}
}