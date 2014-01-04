package com.netiquette.robotGenome.view
{
	import com.genome2d.components.GComponent;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.core.GNodeFactory;
	import com.genome2d.textures.factories.GTextureFactory;
	
	public class MainView extends GComponent
	{
		internal var button:GSprite;
		
		public function MainView(p_node:GNode)
		{
			super(p_node);
			
			button = GNodeFactory.createNodeWithComponent(GSprite) as GSprite;
			button.setTexture(GTextureFactory.createFromColor('button', 0xFFFFFF, 400, 200));
			button.node.mouseEnabled = true;
			node.addChild(button.node);
		}
	}
}