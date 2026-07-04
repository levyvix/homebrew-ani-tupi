class AniTupi < Formula
  desc "Assista anime e leia mangá direto do terminal sem anúncios"
  homepage "https://github.com/levyvix/ani-tupi"
  url "https://github.com/levyvix/ani-tupi/archive/refs/tags/v2.3.9.tar.gz"
  sha256 "29cdf74501e4bb55df7e43e28051ecdfbfdbaff78c0834bc87e622a4a2a1164d"
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
