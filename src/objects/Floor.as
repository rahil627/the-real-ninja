package objects 
{
	import net.flashpunk.Entity;
	/**
	 * Hitbox for the ground.
	 */
	public class Floor extends Entity {
		
		public function Floor(x:int, y:int) {
			super(x, y);
			
			this.setHitbox(320, 16);
			this.type = "floor";
		}
	}
}