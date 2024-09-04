platform :ios, '13.0'
source "https://github.com/imamalys/net2call-podspec.git"
source "https://github.com/CocoaPods/Specs.git"

def all_pods
  pod 'Net2CallSDK', '1.6'
  pod 'net2call-core', '1.0'
end

target 'Net2Call' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!
  pod 'SnapKit', '~> 5.6.0'
  all_pods
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
