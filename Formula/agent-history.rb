class AgentHistory < Formula
  desc "Unified Claude Code and Codex CLI session search"
  homepage "https://github.com/YogevKr/agent-history"
  version "0.1.7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/YogevKr/agent-history/releases/download/v0.1.7/agent-history-v0.1.7-darwin-arm64.tar.gz"
    sha256 "45b9c6bf7dbbd18039052b744bc832e0702a0a3c61cbeae63d1d2313591167c8"
  else
    url "https://github.com/YogevKr/agent-history/archive/refs/tags/v0.1.7.tar.gz"
    sha256 "ada4f15862c11b485b2606d82d4c072b6987792c9d67375d727453b11853e8ca"
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
