class Dnote < Formula
  desc "Simple command line notebook for programmers"
  homepage "https://www.getdnote.com"
  url "https://github.com/dnote/dnote/archive/refs/tags/cli-v0.15.2.tar.gz"
  sha256 "d68fd975a91b1872d15c2bfea12a1b43d8878c9811d1df4876c07f3d10f05e4e"
  license "GPL-3.0"
  head "https://github.com/dnote/dnote.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.apiEndpoint=https://api.getdnote.com -X main.versionTag=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "-tags", "fts5", "./pkg/cli"
  end

  test do
    system "#{bin}/dnote", "version"
  end
end
