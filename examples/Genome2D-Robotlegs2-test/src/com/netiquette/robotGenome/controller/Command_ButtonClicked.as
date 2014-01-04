package com.netiquette.robotGenome.controller
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class Command_ButtonClicked extends Command
	{
		[Inject]
		public var signalPayload:String;
		
		public function Command_ButtonClicked()
		{
			super();
		}
		
		override public function execute():void
		{
			trace(signalPayload);
		}
		
		
	}
}