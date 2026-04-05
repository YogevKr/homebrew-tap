class XBookmarks < Formula
  include Language::Python::Virtualenv

  desc "Shell-first X bookmarks archive with local search and indexing"
  homepage "https://github.com/YogevKr/x-bookmarks"
  url "https://github.com/YogevKr/x-bookmarks/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "218cb000bebde07ece883ddf7c9f7b24e9a47e61a7f79c9b2eebd171fbcd0f0c"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "X Bookmarks pipeline", shell_output("#{bin}/x-bookmarks --help")
  end
end
