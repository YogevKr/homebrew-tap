class SkillRouter < Formula
  include Language::Python::Virtualenv

  desc "Scoped, cached routing for agent skills"
  homepage "https://github.com/YogevKr/skill-router"
  url "https://github.com/YogevKr/skill-router/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc139c4e848b824fc0783a08263e31120e7cdb1f96afe4cb86cfd786f7dbd09c"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Search and load skills", shell_output("#{bin}/skill-router --help")
  end
end
