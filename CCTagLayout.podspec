#
# Be sure to run `pod lib lint CCTagLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CCTagLayout'
  s.version          = '1.0.0'
  s.summary          = 'iOS 标签'
  s.description      = <<-DESC
TODO: iOS 动态标签
                       DESC

  s.homepage         = 'https://github.com/CaiChenghan/CCTagLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1178752402@qq.com' => '蔡成汉' }
  s.source           = { :git => 'https://github.com/CaiChenghan/CCTagLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'CCTagLayout/*.{h,m}'
end
