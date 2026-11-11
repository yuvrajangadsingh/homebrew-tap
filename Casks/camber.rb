cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "46a104df77139f7a644f4a1ee8f785f108d158c1e279c4f07b77f57feb7e0a2e",
         intel: "4d3dd3ebc50717c8ae9a5c7b67d232ef537e16bf39a50e9b68af49e67854f987"

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
