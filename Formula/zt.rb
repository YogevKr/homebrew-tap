class Zt < Formula
  desc "Remote Zellij session manager for humans and agents"
  homepage "https://github.com/YogevKr/zt"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/zt/releases/download/v0.3.2/zt-v0.3.2-aarch64-apple-darwin.tar.gz"
    sha256 "4c23ec006d92b951d9549efdececd3e9d9fbdc4aee86ee44a99f435876030684"
  else
    url "https://github.com/YogevKr/zt/archive/refs/tags/v0.3.2.tar.gz"
    sha256 "e5569798a43115ade0fe6fde57d89c20bc9841711d7435f3245bf26c82d5bd78"
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
