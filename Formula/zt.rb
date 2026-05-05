class Zt < Formula
  desc "Remote Zellij session manager for humans and automation"
  homepage "https://github.com/YogevKr/zt"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/zt/releases/download/v0.3.0/zt-v0.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "27c72bfd9b2574a020a25174bf5692c84d1a68be137ffedcd6900b0e4041526e"
  else
    url "https://github.com/YogevKr/zt/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "9c540b0928f77c266596e3192e5833bb6d2f3ec11b634e6ba9e9ec28c60fa67a"
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
