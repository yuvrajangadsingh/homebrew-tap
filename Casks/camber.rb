cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "55c282ce50c8d2773981d394d9bd18a094e446dbc681a616ad789bd621e23445",
         intel: "f1dcf5f896dcc188162aa72db75ffb54e34dba3bfa93554f124fefee2d07e77b"

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
