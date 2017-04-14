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
  pod 'OHHTTPStubs'
  pod 'OHHTTPStubs/Swift'
  pod 'Alamofire', '~> 4.0'   #swift3.0
  addFabric
  
  #出现以下两个问题：
  #问题1: ld: framework not found OHHTTPStubs for architecture x86_64
  #问题2: ld: framework not found OHHTTPStubs for architecture arm64
  # 检查和第三方包无关，需要对单元测试配置依赖，如下target 'Tests' do
  target 'InstrumentsTutorialTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
