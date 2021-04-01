
Pod::Spec.new do |s|

  s.name         = "TabBarUIAction"
  s.version      = "0.8.0"
  s.summary      = "A custom SwiftUI TabBar for iOS, iPadOS and macOS."
  s.description  = <<-DESC
A SwiftUI custom TabBar view with action button for modal content display. Fully compatible with Mac Catalyst.
                   DESC
  s.homepage     = "https://github.com/chicio/TabBarUIAction"
  s.screenshots  = "https://github.com/chicio/TabBarUIAction/blob/main/Screenshots/iphones-screens.png?raw=true"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }
  s.author             = { "chicio" => "fabrizio.duroni@gmail.com" }
  s.social_media_url   = "https://github.com/chicio"
  s.platform     = :ios, "14.0"
  s.source       = { :git => "https://github.com/chicio/TabBarUIAction.git", :tag => "#{s.version}" }
  s.source_files  = "Source", "Source/**/*.{h,m}", "Source/**/*.swift"
  s.swift_version = '5.0'
  s.weak_framework = 'SwiftUI'
  
end
