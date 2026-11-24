cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.5"
  sha256 arm:   "558b67100d6b733f42b381be11d53c44cb4eb6afaea9978e1b353f3fd9904d0c",
         intel: "c461d65e97dbb39616af1f025da72166d6c4aa209be4b92d7b8fca3c24e535fe"

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
