Pod::Spec.new do |s|

  s.name         = "Zombie"
  s.version      = "0.1.1"
  s.summary      = "The RxSwift-based viper framework"
  
  s.description  = <<-DESC
		    This is a framework based on rxswift and moya, which is currently under development and has only a few basic features but is already a very good MVVM framework
  		 DESC
  
  s.homepage     = "https://github.com/Sanchew/Zombie"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }
  
  s.author       = { "sanchew" => "sanchew@mail.com" }
  
  s.platform     = :ios, "8.0"
  
  s.source       = { :git => "https://github.com/sanchew/Zombie.git", :tag => s.version}

  s.swift_version = '4.0'
  
  s.source_files = "Zombie/Sources/**/*.swift"
  
  s.requires_arc = true
  
  s.dependency 'RxSwift', '~> 4.0'
  s.dependency 'RxCocoa', '~> 4.0'
  s.dependency 'RxDataSources', '~> 3.0'
  s.dependency 'RxOptional', '~> 3.3'
  s.dependency 'RxFeedback', '~> 1.0'
  s.dependency 'Moya/RxSwift', '~> 10.0'
  s.dependency 'Kingfisher', '~> 4.3'
  s.dependency 'STRegex', '~> 2.0'

  s.dependency 'MJRefresh', '~> 3.1'
  
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
 
  s.frameworks   = "UIKit"

end
