cask "camber" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "ca26a7b12ef46db15020f66162887e94ef1a5f24b5ec07e84e538c4a045b388c",
         intel: "6b8a23ca3f976edf43ba075aa8242120d009ebb7b367b9bb5ca59b59b4de6bc8"

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
