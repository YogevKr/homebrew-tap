class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and sync"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/releases/download/v0.1.5/x_bookmarks-0.1.5.tar.gz"
  sha256 "dc2b62cc5794530de8ab7fc05bf442a044c2e9a7f5439fd6d96527352136b6da"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/x-bookmarks version")
  end
end
