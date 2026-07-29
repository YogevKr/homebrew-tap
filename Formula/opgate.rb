class Opgate < Formula
  desc "Scoped, cached 1Password secrets for shells and AI agents"
  homepage "https://github.com/YogevKr/opgate"
  url "https://github.com/YogevKr/opgate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "71594f78271cdff3519fa11058e44b492e7ff05d83e5a05dc51a36c3c9ab6d87"
  license "MIT"

  uses_from_macos "zsh"

  def install
    (share/"opgate").install "opgate.zsh"
    bin.install "bin/opgate"
  end

  def caveats
    <<~EOS
      The `opgate` command works standalone from any shell. For the in-memory
      cache tier and the op<profile> convenience functions, also add to .zshrc:

        source "#{HOMEBREW_PREFIX}/share/opgate/opgate.zsh"
    EOS
  end

  test do
    assert_match "opgate", shell_output("#{bin}/opgate version")
  end
end
