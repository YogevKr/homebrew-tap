class SkillRouter < Formula
  include Language::Python::Virtualenv

  desc "Scoped, cached routing for agent skills"
  homepage "https://github.com/YogevKr/skill-router"
  url "https://github.com/YogevKr/skill-router/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "adb038b683b53e1f26d1f30459025c3d4216c64b623616217c4385dd367018e7"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Search and load skills", shell_output("#{bin}/skill-router --help")
  end
end
