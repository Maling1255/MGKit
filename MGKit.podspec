

Pod::Spec.new do |spec|

  spec.name         = "MGKit"
  spec.version      = "1.0.0"
  spec.summary      = "Quickly create UI views."

  spec.description  = <<-DESC
                        Do some auxiliary type operations for development
                       DESC
  spec.homepage     = "https://github.com/Maling1255/MGKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "maling" => "maling@amberweather.com" }
 
  spec.platform     = :ios, "8.0"
  spec.ios.deployment_target = "8.0"

  spec.source       = { :git => "https://github.com/Maling1255/MGKit.git", :tag => spec.version }
  spec.requires_arc = true

  spec.source_files  = "MGKit/MGKit.h"
  spec.public_header_files = "MGKit/MGKit.h"

  spec.subspec 'Foundation' do |ss|

    ss.source_files = "MGKit/Foundation/**/*.{h,m}"
    ss.public_header_files = "MGKit/Foundation/**/*.h"

  end  

  spec.subspec 'UIKit' do |ss|

    ss.source_files = "MGKit/UIKit/**/*.{h,m}"
    ss.public_header_files = "MGKit/UIKit/**/*.h"

  end

   spec.subspec 'NSObject' do |ss|

    ss.source_files = "MGKit/NSObject/**/*.{h,m}"
    ss.public_header_files = "MGKit/NSObject/**/*.h"

  end
   


end
