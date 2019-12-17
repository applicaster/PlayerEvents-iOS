Pod::Spec.new do |s|
s.name             = "PlayerEvents"
s.version          = '0.1.0'
s.summary          = "PlayerEvents"
s.description      = <<-DESC
Protocol to allow to communicate of player events to a custom plugin.
DESC
s.homepage         = "https://github.com/applicaster/PlayerEvents-iOS"
s.license          = 'CMPS'
s.author           = "Applicaster LTD."
s.source           = { :git => "git@github.com:applicaster/PlayerEvents-iOS.git", :tag => s.version.to_s }
s.platform         = :ios, '10.0'
s.requires_arc 	   = true
s.static_framework = false

s.source_files     = 'PlayerEventsManager.swift', 'PlayerEventsProvider.swift'

s.xcconfig         =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'ENABLE_BITCODE' => 'YES',
    'OTHER_CFLAGS'  => '-fembed-bitcode'
}

s.dependency 'ZappPlugins'

end
