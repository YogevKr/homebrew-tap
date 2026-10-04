class SkillRouter < Formula
  include Language::Python::Virtualenv

  desc "Scoped, cached routing for agent skills"
  homepage "https://github.com/YogevKr/skill-router"
  url "https://github.com/YogevKr/skill-router/archive/refs/tags/v0.4.6.tar.gz"
  sha256 "7a39964e3a1984212389d907255b68b62b6ed99b2c50fb645a9139e501e34388"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Search and load skills", shell_output("#{bin}/skill-router --help")
  end
end
