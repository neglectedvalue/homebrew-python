require "formula"

class Pygments < Formula
  homepage "http://pygments.org/"
  url "https://pypi.python.org/packages/source/P/Pygments/Pygments-1.6.tar.gz"
  sha1 "53d831b83b1e4d4f16fec604057e70519f9f02fb"
  head "https://bitbucket.org/birkenfeld/pygments-main", :using => :git

  depends_on "python"

  def install
    version = Language::Python.major_minor_version "python"
    ENV.prepend_create_path "PYTHONPATH", lib+"python#{version}/site-packages"
    system "python", 'setup.py', 'install', "--prefix=#{prefix}",
           "--single-version-externally-managed",
           "--record=installed.txt"
  end

  test do
    system "pygmentize -V"
  end
end
