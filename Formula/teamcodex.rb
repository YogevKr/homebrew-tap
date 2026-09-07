class Teamcodex < Formula
  desc "Local account pool and streaming proxy for Codex"
  homepage "https://github.com/YogevKr/teamcodex"
  url "https://github.com/YogevKr/teamcodex/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "09eb23b4c2154440946af96b935b22639be36a2b8a0e52c8e37e3d50db89ad9e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"examples").install "examples/config.json", "examples/opgate-credential.py"
  end

  def caveats
    <<~EOS
      The installed command is tcx. Install Codex CLI separately to use tcx run.
      Create a configuration with:
        tcx example > config.json
      Edit the account and credential settings before starting the proxy.
      The credential adapter is at:
        #{opt_pkgshare}/examples/opgate-credential.py
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tcx --version")
    (testpath/"config.json").write shell_output("#{bin}/tcx example")
    assert_match "Configuration valid", shell_output("#{bin}/tcx --config config.json check")
    assert_match "127.0.0.1:4269", shell_output("#{bin}/tcx --config config.json codex-config")
  end
end
