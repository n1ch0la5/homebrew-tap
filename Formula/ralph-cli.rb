class RalphCli < Formula
  desc "Iterative AI-assisted feature development CLI"
  homepage "https://github.com/n1ch0la5/ralph-cli"
  url "https://github.com/n1ch0la5/ralph-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "284b8b4452c0e86b18e8065cd174b7cb6316f24fbefbab65d3e36d61076e4c38"
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
