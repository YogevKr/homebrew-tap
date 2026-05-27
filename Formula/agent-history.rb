class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.1/agent-history-v0.1.1-darwin-arm64.tar.gz"
    sha256 "066c1ad7c3617badefb23b5c6e3a6f4f88f936d530c1729fd73cc5d174e11788"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "7acfee8f772387c542da1060731a875b3d33b60feeff01815642f1bbdd009495"
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
