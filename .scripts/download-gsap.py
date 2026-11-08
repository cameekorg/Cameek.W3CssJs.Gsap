#!/usr/bin/env python3
"""Refresh the pinned GSAP browser distribution using only Python's standard library."""

import base64
import hashlib
from html.parser import HTMLParser
import io
from pathlib import Path
import re
import tarfile
from urllib.request import urlopen


VERSION = "3.15.1"
INTEGRITY = "63yjWRFWj3QRP1UOuD8kcidCcy3nxb1mMRpwHr/xJRvPfm9GtWOXFAYUiL0ro1fgPq2nY53LR+98pAgy9BumBg=="
LICENSE_URL = "https://gsap.com/community/standard-license/"
ASSETS = (
    "gsap", "Draggable", "DrawSVGPlugin", "EaselPlugin", "Flip", "GSDevTools",
    "InertiaPlugin", "MotionPathHelper", "MotionPathPlugin", "MorphSVGPlugin",
    "Observer", "Physics2DPlugin", "PhysicsPropsPlugin", "PixiPlugin",
    "ScrambleTextPlugin", "ScrollTrigger", "ScrollSmoother", "ScrollToPlugin",
    "SplitText", "TextPlugin", "EasePack", "CustomEase", "CustomBounce", "CustomWiggle",
)


class LicenseText(HTMLParser):
    def __init__(self):
        super().__init__()
        self.parts = []
        self.ignored = 0

    def handle_starttag(self, tag, attrs):
        if tag in ("script", "style"):
            self.ignored += 1
        if tag in ("p", "li", "div", "h1", "h2", "h3", "br"):
            self.parts.append("\n")

    def handle_endtag(self, tag):
        if tag in ("script", "style"):
            self.ignored -= 1
        if tag in ("p", "li", "div", "h1", "h2", "h3"):
            self.parts.append("\n")

    def handle_data(self, data):
        if not self.ignored:
            self.parts.append(data)


def download(url):
    with urlopen(url, timeout=60) as response:
        return response.read()


def main():
    archive = download(f"https://registry.npmjs.org/gsap/-/gsap-{VERSION}.tgz")
    actual = base64.b64encode(hashlib.sha512(archive).digest()).decode("ascii")
    if actual != INTEGRITY:
        raise ValueError("The GSAP npm archive failed its pinned SHA-512 integrity check.")

    # Download and validate every file before replacing any checked-in asset.
    files = {}
    with tarfile.open(fileobj=io.BytesIO(archive), mode="r:gz") as package:
        for asset in ASSETS:
            for extension in (".min.js", ".min.js.map"):
                name = asset + extension
                member = package.extractfile("package/dist/" + name)
                if member is None:
                    raise ValueError("Missing upstream asset: " + name)
                files["js/" + name] = member.read()

    parser = LicenseText()
    parser.feed(download(LICENSE_URL).decode("utf-8"))
    text = "\n".join(" ".join(line.split()) for line in "".join(parser.parts).splitlines())
    start = text.index("I. DEFINITIONS")
    end = re.search(r"Copyright \(©\) \d{4}, Webflow", text[start:])
    if end is None or "III. RESTRICTIONS" not in text or "VI. MISCELLANEOUS" not in text:
        raise ValueError("The upstream license page no longer has its expected structure.")
    license_text = 'Standard "No Charge" GSAP License\n\n' + text[start:start + end.end()]
    license_text = re.sub(r"\n{3,}", "\n\n", license_text).strip() + "\n"
    files["LICENSE-gsap.txt"] = license_text.encode("utf-8")

    root = Path(__file__).resolve().parent.parent / "Cameek.W3CssJs.Gsap" / "wwwroot"
    for name, data in files.items():
        target = root / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
    print(f"Downloaded GSAP {VERSION}: {len(ASSETS)} scripts, their source maps, and the upstream license.")


if __name__ == "__main__":
    main()
