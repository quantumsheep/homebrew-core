class Sshs < Formula
  desc "Graphical command line client for SSH"
  homepage "https://github.com/quantumsheep/sshs"
  url "https://github.com/quantumsheep/sshs/archive/refs/tags/1.2.1.tar.gz"
  sha256 "1844b06d563f1c4f442c21b92cc6ae97bbf9f7d7d7a367e89eddca6bc9d107b6"
  license "MIT"

  depends_on "make" => :build
  depends_on "git" => :build
  depends_on "go" => :build

  def install
    system "make", "build", "OUTPUT=#{bin}/sshs"
  end

  test do
    pid = fork do
      exec "#{bin}/sshs"
    end
    sleep 1

    Process.kill("SIGINT", pid)
    Process.wait(pid)
  end
end
