class Teamcodex < Formula
  desc "Local account pool and streaming proxy for Codex"
  homepage "https://github.com/YogevKr/teamcodex"
  url "https://github.com/YogevKr/teamcodex/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "bc8e69df926c4d70ad67a07d998e132114d8d699504b68b51ed0a07b66159815"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"examples").install "examples/config.json", "examples/opgate-credential.py"
  end

  def caveats
    <<~EOS
      The installed command is tcx. Install Codex CLI separately to use tcx run.
      Add each ChatGPT account through browser login:
        tcx login --name personal
      Start the account pool:
        tcx server
      In another terminal, launch Codex:
        tcx run -- --yolo
      Without a running pool, tcx run launches Codex directly.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tcx --version")
    assert_match "--no-browser", shell_output("#{bin}/tcx login --help")
    (testpath/"config.json").write shell_output("#{bin}/tcx example")
    assert_match "Configuration valid", shell_output("#{bin}/tcx --config config.json check")
    assert_match "127.0.0.1:4269", shell_output("#{bin}/tcx --config config.json codex-config")
  end
end
