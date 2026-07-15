class Codexspin < Formula
  desc "Spin and manage parallel Codex sessions via the codex app-server"
  homepage "https://github.com/YogevKr/codexspin"
  url "https://github.com/YogevKr/codexspin/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "8778ea5b9aeba581f8ab618102330e9ad905a5c2b540f6d3e6795cd0bea0ce17"
  license "MIT"

  depends_on "python@3.13"

  def install
    libexec.install "src/codexspin"
    # Stdlib-only package: a PYTHONPATH shim beats a virtualenv. The exported
    # PYTHONPATH is inherited by the detached runner processes codexspin
    # spawns via `python -m codexspin.runner`.
    (bin/"codexspin").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{libexec}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" -m codexspin.cli "$@"
    SH
  end

  test do
    assert_match "spawn", shell_output("#{bin}/codexspin --help")
    assert_match "no jobs", shell_output("CODEXSPIN_HOME=#{testpath} #{bin}/codexspin status")
  end
end
