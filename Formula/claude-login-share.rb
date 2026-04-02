class ClaudeLoginShare < Formula
  desc "Share your Claude Code login to another Mac"
  homepage "https://github.com/yuvrajangadsingh/claude-login-share"
  url "https://github.com/yuvrajangadsingh/claude-login-share/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e24ad0c4a56fbd515d39d9b7a4e1dd25e78b827c099443e742f2265577b15475"
  license "MIT"

  def install
    bin.install "share-login.sh" => "claude-login-share"
  end

  test do
    output = shell_output("#{bin}/claude-login-share 2>&1", 1)
    assert_match "Could not find Claude Code credentials", output
  end
end
