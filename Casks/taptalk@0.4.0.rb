cask "taptalk@0.4.0" do
  version "0.4.0"
  sha256 "74913d3cf3efa28d77e49efb46a8accba83a551d1c5760f292b865f3f579ece9"

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
