# This file is automatically generated. Do not edit.

if Object.const_defined?('TestFlight') and !UIDevice.currentDevice.model.include?('Simulator')
  NSNotificationCenter.defaultCenter.addObserverForName(UIApplicationDidBecomeActiveNotification, object:nil, queue:nil, usingBlock:lambda do |notification|
  
  TestFlight.takeOff('37a3b6123d28a01e59d2fe9b071760ec_MjM3MjI4MjAxMy0wNi0xNyAwMDozNTo0MC44ODAyODI')
  end)
end
