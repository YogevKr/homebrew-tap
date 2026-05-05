class Zt < Formula
  desc "Remote Zellij session manager for humans and agents"
  homepage "https://github.com/YogevKr/zt"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/zt/releases/download/v0.3.1/zt-v0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "ec43de4a2ef85ba31a4b7fb75c13fa9ad03ef88f15570808ab56fabdd5a7a31a"
  else
    url "https://github.com/YogevKr/zt/archive/refs/tags/v0.3.1.tar.gz"
    sha256 "8f4575973d5855efb43f63391a707bf579c90a655b81f49bf657b07aa475400c"
  end

  license "MIT"

  depends_on "rust" => :build if OS.linux? || Hardware::CPU.intel?

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "zt"
    else
      system "cargo", "install", *std_cargo_args
    end
    prefix.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zt --version")
    assert_match "Remote Zellij session manager", shell_output("#{bin}/zt --help")
  end
end
