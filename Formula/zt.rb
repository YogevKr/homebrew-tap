class Zt < Formula
  desc "Remote Zellij session manager for humans and automation"
  homepage "https://github.com/YogevKr/zt"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/zt/releases/download/v0.2.6/zt-v0.2.6-aarch64-apple-darwin.tar.gz"
    sha256 "66643906201cbfe6a80b0f7ce313a1ec284f5730df5efba41253a011680e391b"
  else
    url "https://github.com/YogevKr/zt/archive/refs/tags/v0.2.6.tar.gz"
    sha256 "cc684f5a81950702b5010e64759a3d64e67baa6e1a93272ce3f327ab4cafce7e"
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
