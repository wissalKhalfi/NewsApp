# Uncomment the next line to define a global platform for your project

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'NewsApp' do
# Comment the next line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

pod 'Alamofire', '~> 4.4'
pod 'NVActivityIndicatorView' , '~> 4.1.1'


post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end

# Pods for Doctor.me

end
