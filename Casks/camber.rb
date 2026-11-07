cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "57e83e0ca471f041ab07a24018cc62320c8c8143c344c713b03c88d91cf31731",
         intel: "cef51241a9cb053cf536239e3ebe6ca4ca1471738c8922cca846ebd527c3d19b"

  url "https://github.com/yuvrajangadsingh/camber/releases/download/v#{version}/camber-#{version}-#{arch}.dmg"
  name "camber"
  desc "Open-source Arc-style browser with sidebar, spaces and Arc import"
  homepage "https://www.yuvrajangadsingh.com/camber"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "camber.app"

  # Ad-hoc signed and not notarized: without this, Gatekeeper blocks the
  # first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/camber.app"]
  end

  zap trash: [
    "~/Library/Application Support/camber",
    "~/Library/Preferences/com.camber.browser.plist",
  ]
end
