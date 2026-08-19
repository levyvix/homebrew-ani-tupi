class AniTupi < Formula
  desc "Assista anime e leia mangá direto do terminal sem anúncios"
  homepage "https://github.com/levyvix/ani-tupi"
  url "https://github.com/levyvix/ani-tupi/archive/refs/tags/v2.14.4.tar.gz"
  sha256 "f448de9741b9526970e5f177ef5cf3b2d3464ab78855b1909447f1e6e0eac869"
  license "GPL-3.0-only"
  head "https://github.com/levyvix/ani-tupi.git", branch: "master"

  depends_on "python@3.12"
  depends_on "mpv"

  def install
    venv = libexec/"venv"
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "."
    bin.install_symlink venv/"bin/ani-tupi"
    bin.install_symlink venv/"bin/manga-tupi"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ani-tupi --help")
  end
end
