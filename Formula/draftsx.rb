class Draftsx < Formula
  include Language::Python::Virtualenv

  desc "CLI and rebuildable local index for Drafts.app"
  homepage "https://github.com/YogevKr/draftsx"
  url "https://github.com/YogevKr/draftsx/releases/download/v0.1.2/draftsx-0.1.2.tar.gz"
  sha256 "55321d93580fad98f7dc25a101c7ea68b11b9fd32b8594a08c307b9728ec3592"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/draftsx --version")
  end
end
