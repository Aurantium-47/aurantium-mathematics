"""Run both fixed p=31 algorithms in a temporary directory and compare all layers."""
from pathlib import Path
import hashlib, json, shutil, subprocess, tempfile, time
ROOT = Path(__file__).resolve().parent
EXPECTED = {
 2: (2746, 'c7466e1e8a904063d590604992374a68b8167e9bd190f142d4a86add1ae98b9c'),
 4: (1276122, '3da2d1b7801cd033e78478955d067a6d6c673f20ac641deecce6b0d3f03b82ba'),
 8: (1672732, '65a55a3e792bdf20b9a01a633ec75f9dfcdb1964825d5af076d396e806d9aead'),
 16: (0, 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'),
}
def digest(path):
 h=hashlib.sha256()
 with path.open('rb') as f:
  for block in iter(lambda:f.read(1024*1024),b''):h.update(block)
 return h.hexdigest()
def main():
 with tempfile.TemporaryDirectory(prefix='lrc15-p31-') as temp:
  work=Path(temp)
  for folder,source in [('runner16_math','bnb_full.cpp'),('runner_dpll','check.cpp')]:
   (work/folder).mkdir()
   exe=work/folder/'check'
   subprocess.run(['g++','-O3','-std=c++17',str(ROOT/folder/source),'-o',str(exe)],check=True)
   started=time.monotonic()
   result=subprocess.run([str(exe)],cwd=work,text=True,capture_output=True,timeout=300)
   print(result.stdout,flush=True)
   if result.returncode or 'INCOMPLETE' in result.stdout:
    raise RuntimeError(f'{folder} incomplete or failed: {result.returncode} {result.stderr}')
   print(f'{folder}: {time.monotonic()-started:.3f} seconds',flush=True)
  for level,(count,expected) in EXPECTED.items():
   a=work/'runner16_math'/f'full_level{level}.bin'
   b=work/'runner_dpll'/f'level{level}.bin'
   assert a.stat().st_size==b.stat().st_size==count*60
   assert digest(a)==digest(b)==expected,(level,digest(a),digest(b))
   print(f'PASS level {level}: {count} vectors, SHA256 {expected}',flush=True)
  print('PASS: two algorithms agree on every stored layer. This is one conditional gate, not LRC(15).')
if __name__=='__main__':main()
