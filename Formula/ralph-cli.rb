class RalphCli < Formula
  desc "Iterative AI-assisted feature development CLI"
  homepage "https://github.com/n1ch0la5/ralph-cli"
  url "https://github.com/n1ch0la5/ralph-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4d9ca1f041f50ba864e0d7b41dc4be9cc184ea764a4c6bc87bdad7b403f5ace4"
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
