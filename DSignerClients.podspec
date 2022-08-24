#
# Be sure to run `pod lib lint DSignerClients.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DSignerClients'
  s.version          = '1.0.0'
  s.summary          = 'A SDK of DSigner for ios'
  s.description      = 'A SDK of DSigner for signing files'
  s.homepage         = 'https://www.develsystems.com'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Javier Alvarez' => 'jalvarez@develsystems.com' }
  s.source           = { :git => 'https://github.com/josemangandid/DSignerClients.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.source_files = 'DSignerClients/Classes/**/*'
  s.dependency 'Alamofire', '5.6.2'
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  #s.ios.vendored_frameworks = 'DSignerClients.framework'

end
