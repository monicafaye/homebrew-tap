class Typx < Formula
  desc "Terminal editor for Typst with live math concealment, outline, tinymist LSP, and Sixel preview"
  homepage "https://github.com/monicafaye/TypX"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-arm64.tar.gz"
      sha256 "fe9d8a304537b8e0e650b2a45173b5298e946feafca5e69491c1469029464e3d"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-amd64.tar.gz"
      sha256 "2977ba0cdb5fc6907397042ce4068f5434f1be33efa3996b050a825873d458fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-arm64.tar.gz"
      sha256 "e27efc40b543264b55eee85bfc71864d34b43e6c83fd03de0cf27b301ce72005"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-amd64.tar.gz"
      sha256 "0d492da12b42a796de1b810631ebf60b06136f544103806bdf56a8a461ba0cbb"
    end
  end

  def install
    bin.install "typx"
    doc.install "README.md", "LICENSE", "LICENSE-MICRO", "LICENSE-THIRD-PARTY"
  end

  def caveats
    <<~EOS
      TypX works offline out of the box for editing, math concealment, shortcuts, and the Document Outline.
      For live diagnostics, completion, hover docs, formatting, and live preview, install tinymist:
        brew install tinymist
      Then verify your environment with:
        typx --check
    EOS
  end

  test do
    assert_match "TypX #{version}", shell_output("#{bin}/typx --version")
  end
end
