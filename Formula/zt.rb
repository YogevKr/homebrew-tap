class Zt < Formula
  desc "Remote Zellij session manager for humans and automation"
  homepage "https://github.com/YogevKr/zt"
  url "https://github.com/YogevKr/zt/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "9aa7642f9578aa096910081f6fab3b74a73eb4e1d3178eb3349f1517bfde6eeb"
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
