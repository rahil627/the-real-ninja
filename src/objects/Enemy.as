package objects {
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * Base enemy class.
	 */
	public class Enemy extends Entity {
		
		public function Enemy(){
			super(FP.width, Global.groundY);
		}
		
		override public function update():void {
			super.update();
			x -= Global.rate;
			
			if (x < -16) {
				FP.world.remove(this);
			}
			
			if (this.collide("player", this.x, this.y)) {
				//Global.player.die();
				this.world.restart();
			}
		}
	}
}