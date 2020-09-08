Pod::Spec.new do |s|
  s.name = "MMModalWebViewController"
  s.version = ENV['LIB_VERSION'] || '1.0'
  s.summary = "Facebook-like WebViewController"
  s.homepage = "https://mammutmedia.eu"
  s.license = 'MIT'
  s.description = "MMModalWebViewController is an elegant and customizable ViewController to present a website on iOS."
  s.source = {
    :git => "https://github.com/mammutmedia/#{s.name}.git",
    :tag => s.version
  }
  s.social_media_url = 'http://facebook.com/mammutmedia.eu'
  s.authors = { 'Felix Nithammer' => 'f.nithammer@mammutmedia.eu' }
  s.requires_arc = true
  s.swift_versions = ['5.1', '5.2']
  s.ios.deployment_target = "11.0"
  s.platform = :ios, "11.0"
  s.source_files = 'Source/**/*.swift'
  s.resources = ['Resources/*']
end
