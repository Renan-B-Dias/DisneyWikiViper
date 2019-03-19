platform :ios, '10.0'

use_frameworks!

workspace 'DisneyWiki'

project 'data/data.xcodeproj'
project 'domain/domain.xcodeproj'
project 'app/app.xcodeproj'

def rx_pods
  pod 'RxSwift'
  pod 'RxCocoa'
end

def network_pods
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper/RxSwift'
end

def ui_pods
  pod 'Cartography'
  pod 'Kingfisher'
end

target 'data' do
  project 'data/data.xcodeproj'
  network_pods
end

target 'domain' do
  project 'domain/domain.xcodeproj'
  rx_pods
end

target 'app' do
  project 'app/app.xcodeproj'
  ui_pods
  network_pods
  network_pods
  rx_pods
end
