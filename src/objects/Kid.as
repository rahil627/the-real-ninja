package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	
	/**
	 * The kid underneath the costume. Base Class for boy and girl.
	 */
	public class Kid extends Entity {
		
		private var timer:int = 0;
		public var spriteMap:Spritemap;
		private var runningDirection:int;
		
		public function Kid(x:Number, y:Number, graphic:Class, mask:Mask, runningDirectionIsLeft:Boolean = false) {
			spriteMap = new Spritemap(graphic, 16, 16, null);
			super(x, y, spriteMap, mask);
			
			spriteMap.add("standing", [0], 0, false);
			spriteMap.add("crying", [1, 0], 1/60, true);
			spriteMap.play("standing");
			
			runningDirection = runningDirectionIsLeft ? -1 : 1;
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			
			if (timer > 30) {//wait before running
				x += Global.rate * 1 * runningDirection;
				spriteMap.play("crying");
				//Global.SFX_KID.play(.25); //TODO: new baby crying sound?
			}
			
			if (x > FP.screen.width + 16 || x < -16) {
				FP.world.remove(this);
			}
		}
	}
}