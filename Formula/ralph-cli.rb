class RalphCli < Formula
  desc "Iterative AI-assisted feature development CLI"
  homepage "https://github.com/n1ch0la5/ralph-cli"
  url "https://github.com/n1ch0la5/ralph-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7debca198ebd4960966910916fa57524a7e97076fee6004ee11f5ddd8f047aae"
  license "MIT"

  def install
    prefix.install "lib", "templates"
    bin.install "bin/ralph"

    # Point the installed binary at the correct lib/templates location
    inreplace bin/"ralph", 'RALPH_ROOT="$(cd "$(dirname "$0")/.." && pwd)"',
                           "RALPH_ROOT=\"#{prefix}\""
  end

  test do
    assert_match "ralph #{version}", shell_output("#{bin}/ralph version")
  end
end
