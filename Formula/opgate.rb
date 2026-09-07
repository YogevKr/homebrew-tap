class Opgate < Formula
  desc "Scoped, cached 1Password secrets for shells and AI agents"
  homepage "https://github.com/YogevKr/opgate"
  url "https://github.com/YogevKr/opgate/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "9536f9b07e1a93db1d61480dfc30d289640a9767e4a857cd737910eb472cd013"
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
