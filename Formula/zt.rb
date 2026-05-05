class Zt < Formula
  desc "Remote Zellij session manager for humans and automation"
  homepage "https://github.com/YogevKr/zt"
  url "https://github.com/YogevKr/zt/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "66e8fe2f15e1bc27b0417bc793aec5eab60c74ac2ad98368d75ce64f7bb23ff7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    prefix.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zt --version")
    assert_match "Remote Zellij session manager", shell_output("#{bin}/zt --help")
  end
end
