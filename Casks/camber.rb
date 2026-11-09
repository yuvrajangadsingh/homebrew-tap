cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "bbcd27f96c98d5b17ccadba4417a64828eea888bc72ce50e346187d426e131cd",
         intel: "4db42caace2a1eda4135ddacd8bb9a06cfb25655a5d5f66dda34aaa7ec1f5e80"

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
