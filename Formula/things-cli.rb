class ThingsCli < Formula
  desc "things-cli: public CLI for agents working with the real Things 3 app"
  homepage "https://github.com/yogevkr/things-cli"
  version "0.2.0"
  license "MIT"

  on_arm do
    url "https://github.com/yogevkr/things-cli/releases/download/v0.2.0/things-cli-v0.2.0-macos-arm64.tar.gz"
    sha256 "1d7a0b96b76d458f5ddd6490a75fb72d62eab56cb5d917985c38c4e8af539f78"
  end

  on_intel do
    url "https://github.com/yogevkr/things-cli/releases/download/v0.2.0/things-cli-v0.2.0-macos-x86_64.tar.gz"
    sha256 "c86f5e1226f464ac20da8f0e483ba5bb23cec8bd3df1a2170c3bf965d753765f"
  end

  def install
    odie "things-cli requires macOS" unless OS.mac?
    bin.install "things-cli"
    prefix.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/things-cli --version")
  end
end
