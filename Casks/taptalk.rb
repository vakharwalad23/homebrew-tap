cask "taptalk" do
  version "0.4.1"
  sha256 "5e9ab3e7e18765546847123f3fefbd98ea122ae9207bafe109b06947fccc62d2"

  url "https://github.com/vakharwalad23/tap-talk/releases/download/v#{version}/TapTalk-#{version}.dmg"
  name "TapTalk"
  desc "Local speech-to-text dictation"
  homepage "https://github.com/vakharwalad23/tap-talk"

  depends_on macos: :sonoma
  depends_on arch: :arm64

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
