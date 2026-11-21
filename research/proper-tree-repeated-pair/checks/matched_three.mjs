const isolatedFixture=process.argv.includes("--isolated-fixture");
const W=[2,2,2,2,5,5,13,24,46,87,167,isolatedFixture?313:310], U=[6,7,8,9,10,11], R={2:[0,1,2,3],5:[4,5]}, common=[[0,6],[1,6],[0,7],[2,7],[1,8],[3,9],[4,10],[5,11],[1,3]], variants=[common.concat([[0,4],[3,5]]),common.concat([[0,5],[3,4]])];
function pick(n,k,fn,s=[],i=0){if(k===0)return fn(s);for(let j=i;j<=n-k;j++)pick(n,k-1,fn,[...s,j],j+1)}
const freq={};let collisions=0;for(let k=1;k<=4;k++)pick(W.length,k,S=>{const a=S.map(i=>W[i]).join();const s=S.reduce((a,i)=>a+W[i],0);if(freq[s]&&freq[s]!==a)collisions++;freq[s]=a});
if ((collisions>0)!==isolatedFixture) throw Error('unexpected short-sum separation');
const key=A=>A.slice().sort((a,b)=>a-b).join();
function layers(E){return Array.from({length:4},(_,k)=>{const map={};pick(E.length,k,S=>{const p=W.map((_,i)=>i);const root=i=>p[i]===i?i:root(p[i]);for(const e of S){const [a,b]=E[e].map(root);if(a===b)throw Error('cycle');p[a]=b}const h={};for(let i=0;i<W.length;i++)h[root(i)]=(h[root(i)]??0)+W[i];const t=key(Object.values(h));map[t]=(map[t]??0)+1});return map});}
function coeff(L,parts){const w=W.slice();for(const a of parts.flat()){const i=w.indexOf(a);if(i<0)return 0;w.splice(i,1)}return L[parts.flat().length-parts.length][key(w.concat(parts.map(S=>S.reduce((a,b)=>a+b,0))))]??0}
function invRows(N){const n=N[0].length;let L;pick(N.length,n,S=>{if(L)return;let m=S.map((s,i)=>[...N[s],...S.map((_,j)=>i===j?1:0)]);for(let j=0;j<n;j++){const k=m.findIndex((r,i)=>i>=j&&r[j]!==0);if(k<0)return;[m[k],m[j]]=[m[j],m[k]];const v=m[j][j];m[j]=m[j].map(x=>x/v);for(let i=0;i<n;i++)if(i!==j){let a=m[i][j];m[i]=m[i].map((x,k)=>x-a*m[j][k])}}L=m.map(r=>N.map((_,j)=>S.includes(j)?r[n+S.indexOf(j)]:0));if(L.flat().some(x=>!Number.isInteger(x)))throw Error('not unimodular')});if(!L)throw Error('no minor');return L}
const tr=A=>A[0].map((_,i)=>A.map(r=>r[i]));const mul=(A,B)=>A.map(r=>tr(B).map(c=>r.reduce((s,v,i)=>s+v*c[i],0))); 
let all=[];
for(const E of variants){const L=layers(E), N={}, order={}, G={}, check=(x,msg)=>{if(!x)throw Error(msg)};const edge=(i,j)=>+E.some(e=>e.includes(i)&&e.includes(j));
 for(const a of [2,5]){const h=(u,v)=>coeff(L,[[W[u],W[v]]])===0&&coeff(L,[[W[u],W[v],a]])!==0;const cs=[];for(let k=2;k<=U.length;k++)pick(U.length,k,S=>{const C=S.map(i=>U[i]);if(C.every(u=>C.every(v=>u===v||h(u,v)))&&!U.some(v=>!C.includes(v)&&C.every(u=>h(u,v))))cs.push(C)});for(const u of U){const t=coeff(L,[[W[u],a]])-cs.filter(C=>C.includes(u)).length;for(let j=0;j<t;j++)cs.push([u])}while(cs.length<R[a].length)cs.push([]);
 const used=new Set();order[a]=cs.map(C=>{const i=R[a].find(i=>!used.has(i)&&key(C)===key(U.filter(u=>edge(u,i))));used.add(i);check(i!==undefined,'not same columns');return i});N[a]=U.map(u=>cs.map(C=>+C.includes(u)));G[a]=invRows(N[a]);}
 for(const a of [2,5])for(const b of [2,5]){
 const e=coeff(L,[[a,b]]); if (!e) { check(!R[a].some(i=>R[b].some(j=>i!==j&&edge(i,j))),'unexpected empty block'); continue; } const D=(a,b)=>mul(G[a],U.map(u=>[e*coeff(L,[[W[u],a]])-coeff(L,[[W[u],a],[a,b]])])).flat(); const d=D(a,b),f=D(b,a);
 const Z=U.map((u,k)=>U.map((v,l)=>{if(k===l)return 0;let c=0,P=0;for(let i=0;i<d.length;i++)for(let j=0;j<f.length;j++)if(N[a][k][i]&&N[b][l][j]&&(a!==b||i!==j)){P++;c+=d[i]+f[j]}return coeff(L,[[W[u],a],[W[v],b],[a,b]])-e*P+c}));
 const F=mul(mul(G[a],Z),tr(G[b]));check(F.every((r,i)=>r.every((x,j)=>x===(order[a][i]===order[b][j]?0:edge(order[a][i],order[b][j])))),'adjacency');}
 all.push(L);}
for(let i=0;i<=2;i++)if(Object.keys(all[0][i]).some(k=>all[0][i][k]!==all[1][i][k])||Object.keys(all[0][i]).length!==Object.keys(all[1][i]).length)throw Error('unequal earlier layer');const target=key([2,2,7,15,24,46,87,172,W[11]]);console.log(JSON.stringify({uniqueShortSums:Object.keys(freq).length,collisions,weight:W.reduce((a,b)=>a+b),counts:all.map(L=>L[3][target]),profilesByLayer:all.map(L=>L.map(t=>Object.keys(t).length)),orderedClassPairsVerified:8}));
