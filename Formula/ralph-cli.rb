class RalphCli < Formula
  desc "Iterative AI-assisted feature development CLI"
  homepage "https://github.com/n1ch0la5/ralph-cli"
  url "https://github.com/n1ch0la5/ralph-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a1a5435e7374f2c952f670f08dcb5ab00fbb2cc0667e61d958112a279fe48c40"
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
