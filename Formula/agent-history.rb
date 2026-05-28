class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.5/agent-history-v0.1.5-darwin-arm64.tar.gz"
    sha256 "99fe625cc7dc5716b418e3ce4ad68632449e42c4d970b48b33268131a8c449c0"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.5.tar.gz"
    sha256 "5530b02966e23cbc5eb2f283d1e4c86edf6a9aaf8215902a7fb9c83cd079b94e"
  end

  depends_on "rust" => :build if OS.linux? || Hardware::CPU.intel?

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "agent-history", "ah"
    else
      system "cargo", "install", *std_cargo_args
    end

    prefix.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-history --version")
    assert_match version.to_s, shell_output("#{bin}/ah --version")
  end
end
