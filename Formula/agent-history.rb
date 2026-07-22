class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.10/agent-history-v0.1.10-darwin-arm64.tar.gz"
    sha256 "1ffd160cc08fe66d4e7756b592b4d9eb5fc258337afbd677636da97cfdf9713f"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.10.tar.gz"
    sha256 "bb5723f952000f2738a6656a860aee1825aef7ed9438e5102a44b9d597f43127"
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
