#
# Be sure to run `pod lib lint TVersaPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TVersaPlayer'
  s.version          = '0.1.2'
  s.summary          = 'AVPlayer and AVPlayerController implementation for tvOS'
  s.description      = 'AVPlayer and AVPlayerController implementation for tvOS using VersaPlayer as base.'
  s.homepage         = 'https://github.com/josejuanqm/TVersaPlayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jose Quintero' => 'jose.juan.qm@gmail.com' }
  s.source           = { :git => 'https://github.com/josejuanqm/TVersaPlayer.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/josejuanqm'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'TVersaPlayer/Classes/**/*'
end
