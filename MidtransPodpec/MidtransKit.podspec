Pod::Spec.new do |s|

s.name             = "MidtransKit"
s.version          = "1.0.6"
s.summary          = "Veritrans mobile SDK beta version"
s.homepage         = "https://veritrans.co.id/"
s.license          = 'MIT'
s.author           = { "veritrans" => "dev@veritrans.co.id" }
s.source           = { :git => 'https://github.com/veritrans/Veritrans-ios-sdk.git', :tag => s.version}
s.platform     = :ios, '7.0'
s.requires_arc = true

s.subspec 'UI' do |sp|
    sp.source_files = 'MidtransKit/**/*.{h,m}'
    sp.resource_bundles = {
        'MidtransKit' => ['MidtransKit/**/*.{png,plist,xib,storyboard,strings,ttf}']
    }
    sp.dependency 'MidtransCoreKit', '~> 1.0.6'
end

s.subspec 'CardIO' do |sp|
    sp.dependency 'CardIO', '~> 5.4'
end

s.default_subspec = 'UI'

end

