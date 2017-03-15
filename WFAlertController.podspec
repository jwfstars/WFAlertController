Pod::Spec.new do |s|
  s.name         = 'WFAlertController'
  s.summary      = 'A block based UIAlertController'
  s.version      = '0.0.4'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      =  {'Jiang Wenfan' => 'jwfstars@163.com' }
  s.homepage     = 'https://github.com/jwfstars/WFAlertController'
  
  s.platform     =  :ios, '8.0'
  s.source       =  { :git => 'https://github.com/jwfstars/WFAlertController.git', :tag => s.version }

  s.source_files = 'WFAlertController/*.{h,m}'
  s.frameworks   =  'Foundation', 'UIKit'
  s.requires_arc = true
end