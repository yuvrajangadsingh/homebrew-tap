class Greens < Formula
  desc "Mirror private work contributions to your GitHub profile"
  homepage "https://github.com/yuvrajangadsingh/greens"
  url "https://github.com/yuvrajangadsingh/greens/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "a58c01bc0acc2c70d00b6e0c551f4b608a905727d77671d5803ffe5d657b0424"
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
