cask "taptalk" do
  version "0.3.0"
  sha256 "f6750ac85e680fb68b4eb068eace48f9dcbb0bdf43f00ca090bede7a36f9dd8a"

  url "https://github.com/vakharwalad23/tap-talk/releases/download/v#{version}/TapTalk-#{version}.dmg"
  name "TapTalk"
  desc "Local speech-to-text dictation"
  homepage "https://github.com/vakharwalad23/tap-talk"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "TapTalk.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TapTalk.app"]
  end

  uninstall quit: "talk.tap.app"

  zap trash: [
    "~/Library/Application Support/TapTalk",
    "~/Library/Caches/talk.tap.app",
    "~/Library/Preferences/talk.tap.app.plist",
  ]
end
