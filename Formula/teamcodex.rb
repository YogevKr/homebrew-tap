class Teamcodex < Formula
  desc "Local account pool and streaming proxy for Codex"
  homepage "https://github.com/YogevKr/teamcodex"
  url "https://github.com/YogevKr/teamcodex/archive/refs/tags/v0.3.16.tar.gz"
  sha256 "02dea142d2daa12dda82053b661bf76e4448e85451ac7b05f0dff6325d0c3b09"
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
      On macOS, run the pool at login:
        tcx launch-agent > ~/Library/LaunchAgents/com.yogevkr.teamcodex.plist
        launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.yogevkr.teamcodex.plist
      When upgrading from 0.2.0, restart the proxy between active Codex sessions.
      New routing bindings then survive later proxy restarts.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tcx --version")
    assert_match "--no-browser", shell_output("#{bin}/tcx login --help")
    (testpath/"config.json").write shell_output("#{bin}/tcx example")
    assert_match "Configuration valid", shell_output("#{bin}/tcx --config config.json check")
    assert_match "127.0.0.1:4269", shell_output("#{bin}/tcx --config config.json codex-config")
    assert_match "com.yogevkr.teamcodex", shell_output("#{bin}/tcx --config config.json launch-agent")
  end
end
