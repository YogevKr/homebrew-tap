class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and indexing"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "5e427b9769f3f57f65ef06337ecc13ffb9b1a7c29da1d1da5f96e54edaab0efe"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "X Bookmarks pipeline", shell_output("#{bin}/x-bookmarks --help")
  end
end
