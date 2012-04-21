package {
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import objects.Player;
	import objects.SliceHandler;
	
	public class CreditsScreen extends World {
		private var entity:Entity;
		private var creditsText:Text;
		private var theEndText:Text;
		private var timer:int = 0;
		
		public function CreditsScreen():void {
			super();
			
			FP.screen.color = 0; //default 4280295456
			
			Global.SFX_OUTRO_DIALOGUE.complete = onComplete;
			Global.SFX_OUTRO_DIALOGUE.play();
			
			var floor:Entity = new Entity(0, 0);
			//floor.setHitbox(50, 50, 50, 50); //WTF?
			floor.setHitboxTo(new Rectangle(0, FP.screen.height * 3 / 4, FP.screen.width, 16));
			floor.type = "floor";
			this.add(floor);
			
			this.add(new Player(100));
			this.add(new SliceHandler());
			
			entity = new Entity();
			this.add(entity);
			
			creditsText = new Text("Sound Effects: freesound.org, mostly from Robinhood76/FxProSound\nMusic: newgrounds.com, XsakuX - Halloween Town Sonik (WIP)", 20, FP.screen.height / 4);
			creditsText.color = 0;
			creditsText.size = 8;
			//creditsText.centerOO();
			
			theEndText = new Text("The End", FP.screen.width / 2, FP.screen.height /2);
			theEndText.color = 0;
			theEndText.centerOO();
		}
		
		override public function update():void {
			super.update();
			
			timer++;
			if (timer == FP.assignedFrameRate * 25) {
				entity.graphic = creditsText;
			}
			else if (timer == FP.assignedFrameRate * 35) {
				this.remove(entity);
			}
		}
		
		private function onComplete():void {
			FP.screen.color = 0xFFFFFF;
			entity.graphic = theEndText;
		}
	}
}