cask "taptalk@0.5.1" do
  version "0.5.1"
  sha256 "fb6ca24201101118a05fe116e79e4bc08bd00f70410c104c18af586c1d710443"

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
