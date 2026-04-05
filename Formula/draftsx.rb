class Draftsx < Formula
  include Language::Python::Virtualenv

  desc "CLI and rebuildable local index for Drafts.app"
  homepage "https://github.com/YogevKr/draftsx"
  url "https://github.com/YogevKr/draftsx/releases/download/v0.1.3/draftsx-0.1.3.tar.gz"
  sha256 "25a7d43649eb733ce9fcc7cbab00c7748d3d0c4e74ebf6895c5edf5086b285f3"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/draftsx --version")
  end
end
