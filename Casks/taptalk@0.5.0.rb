cask "taptalk@0.5.0" do
  version "0.5.0"
  sha256 "0424e9a43c4f2e6d9d1fab1ed0a0e4deb8b9cdf1859929a9c181314bd04d9dc0"

  url "https://github.com/vakharwalad23/tap-talk/releases/download/v#{version}/TapTalk-#{version}.dmg"
  name "TapTalk"
  desc "Local speech-to-text dictation"
  homepage "https://github.com/vakharwalad23/tap-talk"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  conflicts_with cask: "taptalk"

  app "TapTalk.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/TapTalk.app"],
        must_succeed: false
  end

  uninstall quit: "talk.tap.app"

  zap trash: [
    "~/Library/Application Support/TapTalk",
    "~/Library/Caches/talk.tap.app",
    "~/Library/Preferences/talk.tap.app.plist",
  ]
end
