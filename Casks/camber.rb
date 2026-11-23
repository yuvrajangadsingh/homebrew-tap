cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.3"
  sha256 arm:   "1a344f107b32153aea529a2a8e70167b042beb2da33dd3aca2bfb069fa4c2c4f",
         intel: "7ef3d681112816a61c02823aa1d0ceedda5be5f2e82cf726333a3e083395bbcb"

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
