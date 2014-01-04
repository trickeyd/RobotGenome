//------------------------------------------------------------------------------
//  Copyright (c) 2009-2014 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package com.robotlegs.bender.extensions.genome2DViewMap
{
	import com.genome2d.core.Genome2D;
	
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;
	import com.robotlegs.bender.extensions.genome2DViewMap.api.IG2DViewMap;
	import com.robotlegs.bender.extensions.genome2DViewMap.impl.G2DViewMap;

	public class G2DViewMapExtension implements IExtension
	{

		
		
		
		
		/*============================================================================*/
		/* Public Properties                                                         */
		/*============================================================================*/
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		
		
		
		
		
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _uid:String;
		
		private var _context:IContext;
		
		
		
		
		
		
		/*============================================================================*/
		/* Getters / Setters                                                          */
		/*============================================================================*/
		
		
		
		
		
		
		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		public function G2DViewMapExtension()
		{
			_uid = UID.create( G2DViewMapExtension );
		}
		
		
		
		
		
		
		
		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		
		public function extend($context:IContext):void
		{
			_context = $context;
			_context.addConfigHandler(instanceOfType(Genome2D), handleStarling);
			_context.injector.map(IG2DViewMap).toSingleton(G2DViewMap);
		}
	
		
		
		
		
		
		
		/*============================================================================*/
		/* Private Functions                                                           */
		/*============================================================================*/	
		
		private function handleStarling($genome2D:Genome2D):void
		{
			_context.injector.map(Genome2D).toValue($genome2D);
			_context.injector.getInstance(IG2DViewMap);
		}		
	}
}
