cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "0f0bbd4394684b3a72dc384371d5f50ed87301ac9936fc3f4adf0f6497a8d5e8",
         intel: "24adf287b35af83f2b7a1ccd7c13dff9aa4b059f91f254d527a27de2e47a3dc4"

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
