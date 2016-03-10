#
# Be sure to run `pod lib lint RSEmailFeedback.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RSEmailFeedback"
  s.version          = "0.2.0"
  s.summary          = "An iOS component to present the email compose sheet with device and app info in the body."

  s.description      = <<-DESC
A simple way to get direct feedback from your App users is via email. This component simplifies the presentation of the email composer by adding blocks, and pre-populates the email message body with details about the device, OS and app version.
                       DESC

  s.homepage         = "https://github.com/ricsantos/RSEmailFeedback"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ric Santos" => "rics@ntos.me" }
  s.source           = { :git => "https://github.com/ricsantos/RSEmailFeedback.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ric__santos'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RSEmailFeedback' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
