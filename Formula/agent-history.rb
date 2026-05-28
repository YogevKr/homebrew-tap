class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.3/agent-history-v0.1.3-darwin-arm64.tar.gz"
    sha256 "d02424bae04098cf7bff2342775bef63a5d28072c22544107059626e069fbfb6"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.3.tar.gz"
    sha256 "78e926b96f2623b2156fb9701efb789e18f1d3494d19669ddbad8e919672cf29"
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
