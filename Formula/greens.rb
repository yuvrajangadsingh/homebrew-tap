class Greens < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/greens"
  url "https://github.com/yuvrajangadsingh/greens/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "ee5bbf31f6df1206dcd5f5471e764d36792225985ac27c9f34819a824e782626"
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
