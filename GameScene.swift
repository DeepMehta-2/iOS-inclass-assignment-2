
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    
    var Ocean1: ocean?
    var Ocean2: ocean?
    var player: Player?
    var island: Island?
    var clouds: [Cloud] = []
    
    override func sceneDidLoad()
    {
        
        screenWidth = frame.width
        screenHeight = frame.height
        print("Screen Width: \(String(describing: screenWidth))")
        print("Screen Height: \(String(describing: screenHeight))")

        name = "GAME"
        
        //add the first ocean in scene
        Ocean1 = ocean()
        Ocean1?.Reset()
        addChild(Ocean1!)
        
        //add the second ocean in scene
        Ocean2 = ocean()
        Ocean2?.position.y = -627
        addChild(Ocean2!)
        
        //add the player in scene
        player = Player()
        addChild(player!)
        
        //add the island in scene
        island = Island()
        addChild(island!)
        
        //add 3 clouds to the scene
        for _ in 0...2
        {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -640))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        Ocean1?.Update()
        Ocean2?.Update()
        player?.Update()
        island?.Update()
        
        //update each cloud 
        for cloud in clouds
        {
            cloud.Update()
        }
    }
}
