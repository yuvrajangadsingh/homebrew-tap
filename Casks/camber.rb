cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "4bdaee2062239931084e150a7ccab81f2e8c5287eab3a6ef5bfd7371a0b1fde9",
         intel: "11e221ba4a04cd56b0200b0f1c476a350ba5fd2d30dceb8114a5e16eac3f7695"

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
