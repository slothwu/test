package
{
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import flash.display.Sprite;
	[SWF(width="1000", height="560", backgroundColor="#000000", frameRate="60")]
	public class test_tri extends Sprite
	{
		private var pa:Sprite = new Sprite();
		private var tri:Sprite = new Sprite();
		
		private var MAZE_MAX:int = 20;
		private var map:Array;
		
		private var GRID_NUM:int = 3;
		private var GRID_LENGTH:int = 7;
		
		private function getIntRandom(min:int,max:int):int
		{
			return Math.round(Math.random()*(max-min) + min);
		}
		
		private function createMaze():void
		{
			createGridWallFirst();
		}
		
		private function createGridWallFirst():void
		{
			for(var i:int = 0;i<GRID_NUM;i++)
			{
				for(var j:int = 0;j<GRID_NUM;j++)
				{
					for(var k:int = 0;k<GRID_LENGTH;k++)
					{
						if(j!=GRID_NUM-1)
						{
							if(getIntRandom(0,4) <3)
								map[k+i*GRID_LENGTH][(GRID_LENGTH-1) + j*GRID_LENGTH] = 1;
						}
						if(i!=GRID_NUM-1)
						{
							if(getIntRandom(0,4) <3)
								map[(GRID_LENGTH-1) + i*GRID_LENGTH][k+j*GRID_LENGTH] = 1;
						}
					}
				}
			}
		}
		
		public function test_tri()
		{
			map = new Array(MAZE_MAX+2);
			for(var i:int = 0;i<MAZE_MAX+2;i++)
			{
				map[i] = new Array(MAZE_MAX+2);
			}
			
			//pa.graphics.beginFill(0x000000);
			/*pa.graphics.lineStyle(1, 0x777777);
			for(var i:int = 0;i<500;i++)
			{
				for(var j:int = 0;j<280;j++)
				{
					pa.graphics.moveTo(i*2-1,j*2);
					pa.graphics.lineTo(i*2,j*2);
				}
			}
			pa.cacheAsBitmap = true;
			var lengthLine:int = 100;
			tri.x = 500;
			tri.y = 280;
			tri.graphics.lineStyle(1, 0xffffee);
			tri.graphics.moveTo(0,0);
			tri.graphics.lineTo(0,-lengthLine);
			
			tri.graphics.lineStyle(1, 0xffffee);
			tri.graphics.moveTo(0,0);
			var xx:int = - (lengthLine/2)*Math.sqrt(3);
			var yy:int = (lengthLine/2);
			tri.graphics.lineTo(xx,yy);
			
			tri.graphics.moveTo(0,0);
			tri.graphics.lineStyle(1, 0xffffee);
			xx = (lengthLine/2)*Math.sqrt(3);
			yy = (lengthLine/2);
			tri.graphics.lineTo(xx,yy);
			tri.cacheAsBitmap = true;
			TweenLite.to(tri, 20, {rotation:360*5,scaleX:2.0,scaleY:2.0,ease:Linear.easeNone});
			*/
			createMaze();
			
			pa.graphics.lineStyle(1, 0xff0000);
			
			for(var i:int = 0;i<MAZE_MAX;i++)
			{
				for(var j:int = 0;j<MAZE_MAX;j++)
				{
					if(map[i][j] == 1)
					{
						pa.graphics.beginFill(0x00ff00);
						pa.graphics.drawRect(i*25,j*25,25,25);
						pa.graphics.endFill();
					}
					else
					{
						pa.graphics.drawRect(i*25,j*25,25,25);
					}
				}
			}
			addChild(pa);
			//addChild(tri);
		}
	}
}