class Typx < Formula
  desc "Terminal editor for Typst with live math concealment, outline, tinymist LSP, and Kitty/Sixel preview"
  homepage "https://github.com/monicafaye/TypX"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-arm64.tar.gz"
      sha256 "a46e9dcbf081aa5b7f09c214d771db9e3068670538f2c93531c166f57a4a56f3"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-amd64.tar.gz"
      sha256 "578307cf6b71ed41d61d82ff4256c33f4e694e524881658852e33931ea6c60e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-arm64.tar.gz"
      sha256 "b0f709e5179130c41dbc78d890ef586bf8c9fe8ecc0a082e00abe1249d513eac"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-amd64.tar.gz"
      sha256 "1b4d54e13ad6f75b84814c2dee6ae82d380f9f7745db892dd0a4ff0a9d882b69"
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
