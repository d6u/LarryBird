Pod::Spec.new do |spec|
  spec.name = 'LarryBird'
  spec.version = '0.0.2'
  spec.summary = 'An alternative Twitter client in Swift.'
  spec.homepage = 'https://github.com/d6u/LarryBird'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Daiwei Lu' => 'daiweilu123@gmail.com' }
  spec.source = { :git => 'https://github.com/d6u/LarryBird.git', :tag => "v#{spec.version}" }

  spec.source_files = 'LarryBird/**/*.{h,swift}'
  spec.requires_arc = true

  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'

  spec.dependency 'Alamofire', '~> 1.3.0'
  spec.dependency 'CryptoSwift', '~> 0.0.12'
end
