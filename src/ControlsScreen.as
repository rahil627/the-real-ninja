package {
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import objects.Player;
	import objects.SliceHandler;
	
	public class ControlsScreen extends World {
		
		public function ControlsScreen():void {
			super();
			
			FP.screen.color = 0; //default 4280295456
			
			var title:Text = new Text("Controls:\nuse W and S or the up and down arrows to jump and duck\nhold down the left mouse button and drag to slice");
			//title.color = 0;
			title.size = 8
			//title.centerOO();
			this.addGraphic(title, 0, 35, FP.screen.height / 8);
			
			var start:Text = new Text("press space to begin");
			//start.color = 0;
			start.centerOO();
			this.addGraphic(start, 0, FP.screen.width / 2, FP.screen.height * 3 / 4);
			
			var floor:Entity = new Entity(0, 0);
			//floor.setHitbox(50, 50, 50, 50); //WTF?
			floor.setHitboxTo(new Rectangle((FP.screen.width / 2) - start.width / 2, (FP.screen.height * 3 / 4) - start.height / 2, start.width, start.height));
			floor.type = "floor";
			this.add(floor);
			
			this.add(new Player(100));
			this.add(new SliceHandler());
			
			Global.SFX_INTRO_DIALOGUE.complete = onComplete;
		}
		
		private var timer:int = 0;
		override public function update():void {
			super.update();
			timer++;
			if (Input.check(Key.SPACE) && !Global.SFX_INTRO_DIALOGUE.playing && timer > FP.assignedFrameRate * 2) {
				Global.SFX_INTRO_DIALOGUE.play();
			}
		}
		
		private function onComplete():void {
			FP.world = new Game();
		}
	}
}