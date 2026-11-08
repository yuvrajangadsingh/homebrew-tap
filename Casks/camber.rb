cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "f1428d9aec2275b7ff50cf4d258dec6e32b113e0486c9c26d1edcbd8cd26362e",
         intel: "14a2a32d0192e7e4bff0bc9bdfb657fc25b4b3e6570262e043e0cfb1f608a879"

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
