Pod::Spec.new do |spec|
    spec.name             = 'PopupWindow'
    spec.version          = '0.2.17'
    spec.license          = { :type => 'MIT' }
    spec.homepage         = 'https://github.com/shin8484/PopupWindow'
    spec.authors          = { 'Shinji Hayashii' => 'shintetu84@gmail.com' }
    spec.summary          = 'Creates and displays Popup on another UIWindow.'
    spec.source           = {:git => 'https://github.com/shin8484/PopupWindow.git', :tag => '0.2.17'}
    spec.platform         = :ios, '10.0'
    spec.ios.deployment_target = '10.0'
    spec.source_files     = 'PopupWindow/**/*.swift'
    spec.framework        = 'UIKit'
    spec.requires_arc     = true
end
