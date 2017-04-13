# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def addFabric
	pod 'Fabric'
	pod 'Crashlytics'
end
target 'InstrumentsTutorial' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  project 'InstrumentsTutorial.xcodeproj'

  # Pods for InstrumentsTutorial
  pod 'OHHTTPStubs/Swift'
  pod 'Alamofire', '~> 4.0'   #swift3.0
  addFabric
  #target 'InstrumentsTutorialTests' do
   # inherit! :search_paths
    # Pods for testing
  #end

end
