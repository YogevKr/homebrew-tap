class Zt < Formula
  desc "Remote Zellij session manager for humans and automation"
  homepage "https://github.com/YogevKr/zt"
  url "https://github.com/YogevKr/zt/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "afed1b38226d421aba3d893c74ee2cfae73d9cf66fc4a3d32d9accbce1ff5f01"
  license "MIT"

  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    inreplace "zt", "#!/usr/bin/env python3", "#!#{python}"

    bin.install "zt"
    prefix.install "README.md", "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zt --version")
    assert_match "Remote Zellij session manager", shell_output("#{bin}/zt --help")
  end
end
