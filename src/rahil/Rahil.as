package rahil {
	import flash.display.DisplayObjectContainer;
	
	public class Rahil {
		
		/*
		 * Removes all of the children of the object.
		*/
		public static function removeAllChildren(object:DisplayObjectContainer):void { //not really needed, unless you want to remove everything from the topmost object
			while (object.numChildren > 0)
				object.removeChildAt(0);
		}
		
		/*
		 * Removes all of the children of the object and itself.
		*/
		public static function removeAllChildrenAndSelf(object:DisplayObjectContainer):void {
			removeAllChildren(object);
			object.parent.removeChild(object);
		}
		
		/**
		 * Converts degrees into radians.
		 */
		public static function degreesToRadians(degrees:Number):Number {
			return degrees * Math.PI / 180;
		}
		
		/**
		 * Returns a random whole number within the range provided
		 */
		public static function randomNumber(low:Number = 0, high:Number = 1):Number {
		  return Math.floor(Math.random() * (1 + high - low)) + low;
		}
		
		//TODO: if flash punk exists
		/*
		public static function isOffScreen(entity:Entity):Boolean {
			if (entity.x < 0 || entity.x > FP.screen.width || entity.y < 0 || entity.y > FP.screen.height)
				return true;
		}
		*/
	}
}