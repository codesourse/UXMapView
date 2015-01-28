Pod::Spec.new do |s|

  s.name         = "UXMapView"
  s.version      = "1.0.0"
  s.summary      = "Baidu Maps SDK for iOS"

  s.description  = <<-DESC
                   A longer description of Baidu-Maps-iOS-SDK in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://developer.baidu.com/map/sdk-ios.htm"

  s.license      = { 
	:type => 'Cpoyright', 
	:text => 'LICENSE  ©2014 Baidu, Inc. All rights reserved' 
  }

  s.author             = { "xiakejie" => "codesourse@gmail.com" }

  s.platform     = :ios

  s.source       = { 
	:git =>  'https://github.com/codesourse/UXMapView.git', 
	:tag => "1.0.0"
  }

  s.source_files = '*.{h,m}'
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.requires_arc = true

end
