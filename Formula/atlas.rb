# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Atlas < Formula
  desc "improved local development"
  homepage "https://github.com/BrunoScheufler/atlas"
  url "https://github.com/BrunoScheufler/atlas/archive/v0.0.1-alpha.12.tar.gz"
  version "0.0.1-alpha.12"
  sha256 "2ab2d31984c1414e5bca7b07392fd4f4097c2565128e138eefa336d112456715"
  license "MIT"

  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cli"
    # would also work:
    # system "go", "build", "-o", "bin/cli", "./cli"
    # bin.install "bin/cli" => "atlas"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test atlas`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
