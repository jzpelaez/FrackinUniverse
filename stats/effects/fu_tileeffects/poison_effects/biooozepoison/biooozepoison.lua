function init()
  animator.setParticleEmitterOffsetRegion("drips", mcontroller.boundBox())
  animator.setParticleEmitterActive("drips", true)
  script.setUpdateDelta(20)
  self.tickTime = 2.0
  self.tickTimer = self.tickTime
  self.baseDamage = config.getParameter("healthDown",0)
  self.baseTime = setEffectTime()
  effect.addStatModifierGroup({
      { stat = "electricResistance", amount = -self.baseDamage },
      { stat = "physicalResistance", amount = -self.baseDamage }
  })   
end

function setEffectTime()
  return self.tickTimer * math.min(1 - status.stat("poisonResistance",0), 0.45)
end

function update(dt)
  if ( status.stat("poisonResistance",0)  >= 0.4 ) then
    effect.expire()
  end
  
  if status.isResource("food") then
      hungerLevel = status.resource("food")
  else
      hungerLevel = 50
  end

  self.tickTimer = self.tickTimer - dt

  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    if status.isResource("food") then
      adjustedHunger = hungerLevel - (hungerLevel * 0.0095)
      status.setResource("food", adjustedHunger)
    end
  end
  
  effect.setParentDirectives("fade=CCFF33="..self.tickTimer * 0.4)
end

function uninit()

end
