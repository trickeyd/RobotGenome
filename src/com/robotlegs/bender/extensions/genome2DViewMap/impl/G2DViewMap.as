//------------------------------------------------------------------------------
//  Copyright (c) 2014 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package com.robotlegs.bender.extensions.genome2DViewMap.impl
{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	import com.genome2d.core.Genome2D;
	
	import flash.utils.Dictionary;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import com.robotlegs.bender.extensions.genome2DViewMap.api.IG2DViewMap;

	public class G2DViewMap implements IG2DViewMap
	{
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		[Inject]
		public var genome2D:Genome2D;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
				
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		/*============================================================================*/
		/* Getters / Setters                                                          */
		/*============================================================================*/
		
		
		
		
		
		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		public function G2DViewMap()
		{
			
		}
		
		
		
		

		
		/*============================================================================*/
		/* Public Methods                                                             */
		/*============================================================================*/
		
		[PostConstruct]
		public function init():void
		{	
			
			if(genome2D.root.isOnStage())
			{
				addG2DView( genome2D.root );
			}
				
			else 
			{
				genome2D.root.onAddedToStage.addOnce(handleRootAddedToStage);
			}
			
			genome2D.root.onNodeAdded.add(addG2DView);
			genome2D.root.onComponentRemoved.add(removeG2DView );
			
		}
		
		public function addG2DView($gNode:GNode) : void
		{
			var components:Dictionary = $gNode.getComponents();
			for each(var component:GComponent in components)
			{
				mediatorMap.mediate(component);
			}
		}

		public function removeG2DView($gNode:GNode) : void
		{
			var components:Dictionary = $gNode.getComponents();
			for each(var component:GComponent in components)
			{
				mediatorMap.unmediate(component);
			}
		}
		
		
		
		
		
		
		/*============================================================================*/
		/* Private Methods
		/*============================================================================*/
	
		
		private function handleRootAddedToStage():void
		{
			addG2DView(genome2D.root);
		}
	}
}
