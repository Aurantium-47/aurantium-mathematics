"""Verify every file listed in SHA256SUMS, without network access or file writes."""
from pathlib import Path
from hashlib import sha256

root=Path(__file__).resolve().parent
manifest=root/'SHA256SUMS'
count=0
for line in manifest.read_text(encoding='utf-8').splitlines():
    if not line.strip():
        continue
    expected,relative=line.split('  ',1)
    path=(root/relative).resolve()
    if not path.is_relative_to(root):
        raise SystemExit('Unsafe path in manifest: '+relative)
    actual=sha256(path.read_bytes()).hexdigest()
    if actual != expected:
        raise SystemExit('CHECKSUM FAILURE: '+relative)
    count+=1
print('PASS:',count,'file checksums match SHA256SUMS')
