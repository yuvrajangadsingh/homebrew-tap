cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.6.4"
  sha256 arm:   "a101afea7d62d0c4b07be9c1c900b705d4a610c9e346fe4d3fca55d8da8a8aa8",
         intel: "19bc0f92a1e3b7f38f7c696150288f7cec2a2a9ff16db8cc9a9db5fcec327a81"

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
