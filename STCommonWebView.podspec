Pod::Spec.new do |s|

  s.name         = "STCommonWebView"
  s.version      = "0.0.1"
  s.summary      = "A common subclass of WKWebView."
  s.homepage     = "https://github.com/shien7654321/STCommonWebView"
  s.author       = { "Suta" => "shien7654321@163.com" }
  s.source       = { :git => "https://github.com/shien7654321/STCommonWebView.git", :tag => s.version.to_s }
  s.platform     = :ios, "9.0"
  s.requires_arc = true
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.frameworks   = "Foundation", "UIKit", "WebKit"
  s.source_files = "STCommonWebView/*.{swift}"
  s.compiler_flags = "-fmodules"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  s.description    = <<-DESC
  STCommonWebView is a common subclass of WKWebView..
                       DESC

end
