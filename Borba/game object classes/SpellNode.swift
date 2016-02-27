//
//  SpellNode.swift
//  Borba
//
//  Created by Gabriel Uribe on 1/30/16.
//  Copyright © 2016 Team Five Three. All rights reserved.
//

import SpriteKit

class SpellNode: GameObject {
  
  class func useSpell(spell: Spell.Name, angle: CGFloat) -> SKSpriteNode {
    switch spell {
    case .Fireball:
      return fireBallSpell(angle)
    case .Frostbolt:
      return frostBallSpell(angle)
    case .Lightning:
      return lightningSpell(angle)
    }
  }
  
  class func lightningSpell(angle: CGFloat) -> SKSpriteNode {
    let sprite = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(30, 30))
    
    if let myParticlePath = NSBundle.mainBundle().pathForResource("LightningBall", ofType: "sks") {
      let fireParticles = NSKeyedUnarchiver.unarchiveObjectWithFile(myParticlePath) as! SKEmitterNode
      //fireParticles.particlePositionRange = CGVectorMake(20, 5)
      fireParticles.zPosition = zPositions.mapObjects
      fireParticles.position = CGPointMake(0, 0)
      sprite.addChild(fireParticles)
    }
    sprite.zRotation = angle + CGFloat(M_PI)
    sprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(sprite.size.width*2, sprite.size.height*2))
    sprite.physicsBody?.categoryBitMask = CategoryBitMasks.PenetratingSpell.rawValue
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.contactTestBitMask = CategoryBitMasks.Enemy.rawValue
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.dynamic = false
    
    sprite.runAction(SKAction.playSoundFileNamed(SoundFile.lightning, waitForCompletion: false))
    return sprite
  }
  
  class func fireBallSpell(angle: CGFloat) -> SKSpriteNode {
    let sprite = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(10, 10))

    if let myParticlePath = NSBundle.mainBundle().pathForResource("Fireball", ofType: "sks") {
      let fireParticles = NSKeyedUnarchiver.unarchiveObjectWithFile(myParticlePath) as! SKEmitterNode
      //fireParticles.particlePositionRange = CGVectorMake(20, 5)
      fireParticles.zPosition = zPositions.mapObjects
      fireParticles.position = CGPointMake(0, 0)
      sprite.addChild(fireParticles)
      
      // lightnode performance is really bad, disabled for now
//      let lightNode = SKLightNode()
//      lightNode.enabled = true
//      lightNode.lightColor = SKColor.whiteColor()
//      lightNode.position = CGPointMake(0,0)
//      lightNode.alpha = 0.9
//      lightNode.categoryBitMask = 1
//      lightNode.falloff = 0.4
//      lightNode.zPosition = zPositions.map
      
      //sprite.addChild(lightNode)
    }
    sprite.zRotation = angle + CGFloat(M_PI)
    sprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(sprite.size.width*2, sprite.size.height*2))
    sprite.physicsBody?.categoryBitMask = CategoryBitMasks.Spell.rawValue
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.contactTestBitMask = CategoryBitMasks.Enemy.rawValue
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.dynamic = false
    sprite.runAction(SKAction.playSoundFileNamed(SoundFile.fireball, waitForCompletion: false))
    return sprite
  }
  
  class func frostBallSpell(angle: CGFloat) -> SKSpriteNode {
    let sprite = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(10, 10))
    
    if let myParticlePath = NSBundle.mainBundle().pathForResource("Slimebolt", ofType: "sks") {
      let fireParticles = NSKeyedUnarchiver.unarchiveObjectWithFile(myParticlePath) as! SKEmitterNode
      //fireParticles.particlePositionRange = CGVectorMake(0, 0)
      fireParticles.zPosition = zPositions.mapObjects
      fireParticles.position = CGPointMake(0, 0)
      sprite.addChild(fireParticles)
    }
    sprite.zRotation = angle + CGFloat(M_PI)
    sprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(sprite.size.width*2, sprite.size.height*2))
    sprite.physicsBody?.categoryBitMask = CategoryBitMasks.Spell.rawValue
    sprite.physicsBody?.collisionBitMask = 0
    sprite.physicsBody?.contactTestBitMask = CategoryBitMasks.Enemy.rawValue
    sprite.physicsBody?.affectedByGravity = false
    sprite.physicsBody?.dynamic = false
    sprite.runAction(SKAction.playSoundFileNamed(SoundFile.frostbolt, waitForCompletion: false))
    return sprite
  }
  
}
