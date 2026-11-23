cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "721e62edb0e0297bf24afd8d3b65660d5e3f7c409fb0a2eb10c1bb119daf48fc",
         intel: "613ca98be5813c3820267ff7bca7e599edf3b29d2d997d2b72f2a7b6b96b2a5e"

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
