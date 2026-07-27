class Codexspin < Formula
  desc "Spin and manage parallel Codex sessions via the codex app-server"
  homepage "https://github.com/YogevKr/codexspin"
  url "https://github.com/YogevKr/codexspin/archive/refs/tags/v0.5.4.tar.gz"
  sha256 "f2ea1b52af1d17090100b68c901151388442783b561314ea3196625e1547fda0"
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
