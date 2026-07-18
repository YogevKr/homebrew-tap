class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.8/agent-history-v0.1.8-darwin-arm64.tar.gz"
    sha256 "a0fda61a58dac71ce2613aec17c6e4fb72e078a3c8d2c0c29e6b9284416b4b66"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.8.tar.gz"
    sha256 "6515eda0e1035e388dad5083daf113fe5a6703722cbe476df93c6d27c4df5fb0"
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
