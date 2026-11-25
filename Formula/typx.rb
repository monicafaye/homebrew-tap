class Typx < Formula
  desc "Terminal editor for Typst with live math concealment, outline, tinymist LSP, and Sixel preview"
  homepage "https://github.com/monicafaye/TypX"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-arm64.tar.gz"
      sha256 "4ba97f6f069da4a83c0f4ffca1b6cf94648076f0fa9c6121f76f7f62c2b34e1f"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-darwin-amd64.tar.gz"
      sha256 "edf4d8c86cab0a73e96199b14fdab582a0f3418ed784a9bcf8e38c550e180c55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-arm64.tar.gz"
      sha256 "1c226fe6ffe30383fcde265bf14842a1787818015cfdd71d31b0c88ef39d4bd0"
    end

    on_intel do
      url "https://github.com/monicafaye/TypX/releases/download/v#{version}/typx-#{version}-linux-amd64.tar.gz"
      sha256 "5b7acee5b1c046eb30053ffaa8794c89ec0c2759244376a1f5d4d62d9302148f"
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
