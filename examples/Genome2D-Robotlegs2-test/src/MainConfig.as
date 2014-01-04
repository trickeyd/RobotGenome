package
{
	import com.netiquette.robotGenome.controller.Command_ButtonClicked;
	import com.netiquette.robotGenome.signals.Signal_ButtonClicked;
	import com.netiquette.robotGenome.view.MainMediator;
	import com.netiquette.robotGenome.view.MainView;
	import com.robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	public class MainConfig implements IConfig
	{
		
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ISignalCommandMap;
		
		[Inject]
		public var contextView:ContextView;
		
		public function MainConfig()
		{

		}
		
		public function configure():void
		{
			mediatorMap.map(MainView).toMediator(MainMediator);
			
			injector.map(Signal_ButtonClicked).asSingleton(); 
			commandMap.map(Signal_ButtonClicked).toCommand(Command_ButtonClicked);
		}
	}
}