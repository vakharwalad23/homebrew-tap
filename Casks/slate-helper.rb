cask "slate-helper" do
  version "1.1.0"
  sha256 "8847ec963c82a243c7dee52ce5fce6ecaecae4b16a0ccbad29adb4f3f871fe56"

  url "https://github.com/vakharwalad23/slate/releases/download/v#{version}/slate-helper-#{version}.dmg",
      verified: "github.com/vakharwalad23/slate/"
  name "SlateHelper"
  desc "Menu-bar controller for the Slate phone Stream Deck"
  homepage "https://github.com/vakharwalad23/slate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "SlateHelper.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SlateHelper.app"]
  end

  uninstall quit: "com.slate.helper"

  zap trash: [
    "~/Library/Preferences/com.slate.helper.plist",
    "~/Library/Caches/com.slate.helper",
  ]
end
