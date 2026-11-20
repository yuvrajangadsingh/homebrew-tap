cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "ab58b454229f9935efd2b01bb87feb02d43e0c949deb4feb87599268ca84c5bf",
         intel: "926c415347429431e14927f824438559db66c5a898df05030a76defdddda503c"

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
