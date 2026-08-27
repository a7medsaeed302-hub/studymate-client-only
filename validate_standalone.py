from pathlib import Path
import re
import subprocess
import tempfile

root = Path(__file__).parent
html = (root / "index.html").read_text(encoding="utf-8")
config = (root / "api.config.js").read_text(encoding="utf-8")

assert html.lstrip().lower().startswith("<!doctype html>"), "index.html must be a complete document"
assert html.strip().lower().endswith("</html>"), "index.html must end with </html>"
assert '<script src="./api.config.js"></script>' in html, "missing local config loader"
assert "/api/ai/generate" not in html, "standalone build must not call a backend route"
assert "STUDYMATE_API_CONFIG" in config, "missing configuration object"
assert re.search(r'apiKeys:\s*\[\s*""', config), "default package must not include a key"
for asset in ("studymate-atlas-hero.png", "studymate-mark.png", "studymate-english-learning.png", "studymate-print-ready.png"):
    assert (root / "assets" / asset).is_file(), f"missing local asset: {asset}"

scripts = re.findall(r"<script>([\s\S]*?)</script>", html)
assert scripts, "missing inline application script"
for index, script in enumerate(scripts):
    with tempfile.NamedTemporaryFile("w", suffix=".js", encoding="utf-8", delete=False) as handle:
        handle.write(script)
        js_path = handle.name
    result = subprocess.run(["node", "--check", js_path], capture_output=True, text=True)
    if result.returncode:
        raise SystemExit(f"inline script {index} failed:\n{result.stderr}")

print("Standalone HTML, JavaScript, local configuration, and assets validated")
