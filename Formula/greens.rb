class Greens < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/greens"
  url "https://github.com/yuvrajangadsingh/greens/archive/refs/tags/v1.9.1.tar.gz"
  sha256 "30d645db30df904c8e1c997385e10d061f3a0bc1b30cda9544309564dae3be9c"
  license "MIT"

  depends_on "git"

  depends_on "jq"

  depends_on "gh"

  def install
    libexec.install "sync.sh", "setup.sh", "lib"
    (bin/"greens").write_env_script libexec/"sync.sh", {}
  end

  def caveats
    <<~EOS
      Get started:
        greens

      Setup runs automatically on first use.
      To reconfigure later: greens --setup
    EOS
  end

  test do
    assert_match "greens", shell_output("#{bin}/greens --version")
  end
end
