#
# Be sure to run `pod lib lint ZYFComponentTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZYFComponentTool'
  s.version          = '0.0.4'
  s.summary          = '快速开发工具类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Zyf893549897/ZYFComponentTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '张云飞' => '893549897@qq.com' }
  s.source           = { :git => 'https://github.com/Zyf893549897/ZYFComponentTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'
  s.source_files = 'ZYFComponentTool/Classes/**/*.{swift,h,m,xib}'
  
  # s.resource_bundles = {
  #   'ZYFComponentTool' => ['ZYFComponentTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
#  s.frameworks =  "Foundation","UIKit"
#  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/CommonCrypto" }
  
  s.prefix_header_file = false
  s.prefix_header_file = 'ZYFComponentTool/Classes/PrefixHeader.pch'
#  
  s.dependency 'SnapKit'             #自动布局
  s.dependency 'HXPhotoPicker'       #相册
  s.dependency 'MJRefresh'           #上下拉刷新
  s.dependency 'Kingfisher'          #图片加载
  s.dependency 'FSPagerView'         #banna图
  s.dependency 'MBProgressHUD'       #提示框
  s.dependency 'KNPhotoBrowser'      #图片浏览库
  s.dependency 'LYEmptyView'         #无数据页面
  s.dependency 'LSTPopView'          #各种弹框  启动广告  等 很全
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  
end
