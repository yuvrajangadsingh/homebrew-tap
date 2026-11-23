cask "radif" do
  version "1.0.1"
  sha256 "ff6e9600e6496ee40b301b7ed987bdd0162dafd5e1eba6acaa7c7140b7eb32aa"

  url "https://github.com/yuvrajangadsingh/radif/releases/download/mac-v#{version}/Radif_#{version}_universal.dmg"
  name "Radif"
  desc "YouTube Music client, needs a Premium account"
  homepage "https://github.com/yuvrajangadsingh/radif"

  livecheck do
    url :url
    regex(/^mac-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  # Without deno, signed-in stream lookups fail on ciphered tracks and
  # audio falls back to about 130 kbps.
  depends_on formula: "deno"
  depends_on :macos

  app "Radif.app"

  # Ad-hoc signed and not notarized: without this, Gatekeeper blocks the
  # first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Radif.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.github.yuvrajangadsingh.ytubic",
    "~/Library/Caches/com.github.yuvrajangadsingh.ytubic",
    "~/Library/HTTPStorages/com.github.yuvrajangadsingh.ytubic.binarycookies",
    "~/Library/LaunchAgents/YTubic.plist",
    "~/Library/Logs/com.github.yuvrajangadsingh.ytubic",
    "~/Library/Preferences/com.github.yuvrajangadsingh.ytubic.plist",
    "~/Library/Saved Application State/com.github.yuvrajangadsingh.ytubic.savedState",
    "~/Library/WebKit/com.github.yuvrajangadsingh.ytubic",
  ]
end
