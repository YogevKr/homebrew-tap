class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.11/agent-history-v0.1.11-darwin-arm64.tar.gz"
    sha256 "2f6752464644ecff4a72d982d98a0a4494e18da01bc0aee299bdeef9bc7359e3"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.11.tar.gz"
    sha256 "a1d182de4cfc1d23473908fe420ac99d1b8c55c7ae633a42538038f27ef7820a"
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
