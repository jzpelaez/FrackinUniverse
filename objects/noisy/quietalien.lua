function init()
  self.count = 0
  object.setInteractive(true)
end

function onInteraction()
  if self.count == 0 then
    self.random = math.random(1,4)
    if self.random == 1 then
      world.spawnItem("wrappedbodyalien", object.position(), 1)  
      self.count = self.count +1
    elseif self.random == 2 then
      world.spawnItem("wrappedbody", object.position(), 1)  
      self.count = self.count +1
    elseif self.random == 3 then
      world.spawnItem("wrappedbodyputrid", object.position(), 1) 
      self.count = self.count +1          
    else
      self.count = self.count +1
    end
  end
end

function onNpcPlay(npcId)
  local interact = config.getParameter("npcToy.interactOnNpcPlayStart")
  if interact == nil or interact ~= false then
    onInteraction()
  end
end
