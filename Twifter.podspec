#
# Be sure to run `pod lib lint Twifter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Twifter'
  s.version          = '0.1.0'
  s.summary          = 'Twitter library with no developer account required'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library allows you to manipulate the Twitter API without a developer account.
                       DESC

  s.homepage         = 'https://github.com/SNQ-2001/Twifter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SNQ-0' => 'taishin05109@gmail.com' }
  s.source           = { :git => 'https://github.com/SNQ-2001/Twifter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/_SNQ'

  s.ios.deployment_target = '15.0'

  s.source_files = 'Sources/**/*.swift'

  s.swift_version = '5.5'
  
  # s.resource_bundles = {
  #   'Twifter' => ['Twifter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
