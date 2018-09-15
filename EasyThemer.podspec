#
# Be sure to run `pod lib lint EasyThemer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyThemer'
  s.version          = '1.1.3'
  s.summary          = 'An easy way to add themes to your iOS app, using Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
EasyThemer is an easy way to add themes to your iOS app. It is written in Swift. It comes with premade themeable controls, and the ability to declare themes in Swift or with JSON.
                       DESC

  s.homepage         = 'https://github.com/wfltaylor/EasyThemer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'William Taylor' => 'wfltaylor@gmail.com' }
  s.source           = { :git => 'https://github.com/wfltaylor/EasyThemer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'EasyThemer/Classes/**/*'
  
  s.swift_version = '4.0'
  # s.resource_bundles = {
  #   'EasyThemer' => ['EasyThemer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
