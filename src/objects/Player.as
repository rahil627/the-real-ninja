package objects {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import Global;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * The player.
	 */
	public class Player extends Entity {
		private var timer:int = 0;		
		private var spriteMap:Spritemap = new Spritemap(Global.GRAPHIC_PLAYER, 16, 16, null);
		public const speed:Point = new Point(0, 0);
		public const gravity:Number = 0.2;
		
		public function Player(x:Number) {
			super(x, -spriteMap.height, spriteMap); //falls from above
			
			//add the animations
			//spriteMap.add("standing", [0], 0, false);
			spriteMap.add("walking", [0, 1], 1/60, true);
			spriteMap.add("air", [2], 0, false); //jumping/falling
			spriteMap.add("ducking", [3], 0, false);
			spriteMap.play("walking");
			type = "player";
			
			//spriteMap.centerOrigin();
			//this.centerOrigin();
			
			//TODO: add ninja gaiden style animation of sheathing and slicing whenever the player slices something
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			//jumping
			if (collide("floor", x, y + 1)) {
				
				if (Input.check(Key.UP) || Input.check(Key.W)) { //jump
					speed.y = -3;
				}
				else if (Input.check(Key.DOWN) || Input.check(Key.S)) { //duck
					spriteMap.play("ducking");
				}
				else {
					spriteMap.play("walking"); //walk
				}
			}
			else {
				speed.y += gravity;
				spriteMap.play("air"); //TODO: *****player is able to jump over most enemies! =/
			}
			
			for (var i:int = 0; i < Math.abs(speed.y); i++) {
				if (!collide("floor", x, y + FP.sign(speed.y))) {
					y += FP.sign(speed.y);
				} else {
					speed.y = 0;
				}
			}
			
			var maskBitmapData:BitmapData = new BitmapData(16, 16, true, 0);
			spriteMap.render(maskBitmapData, new Point(0, 0), new Point(0, 0));
			this.mask = new Pixelmask(maskBitmapData);
		}
		
		public function undress(restart:Boolean = true):void {
			Global.playSfxHumanDeath();
			
			var bitmapData:BitmapData = new BitmapData(16, 16, true, 0); //sloppy
			spriteMap.render(bitmapData, new Point(0, 0), new Point(0, 0));
			
			Global.undressAnimationHandler.playHorizontalCutAnimationBitmap(this.x, this.y, bitmapData);
			this.world.remove(this);
			this.world.add(new Boy(this.x, true));
			
			//TODO: ultra zoom in to face, tear/cry, zoom out, restart?
			if (restart)
				this.world.restart();
		}
	}
}