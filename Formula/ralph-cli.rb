class RalphCli < Formula
  desc "Iterative AI-assisted feature development CLI"
  homepage "https://github.com/n1ch0la5/ralph-cli"
  url "https://github.com/n1ch0la5/ralph-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "ad2dbbea17e245178b69e85040762ba90060b331bc7578dfe059535cbb70d92d"
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
