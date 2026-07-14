# TweakDefs

A repository for BAR's tweakdefs scripts.

## Tweakdefs description

**Tweakdef** is a Base64 encoded snippet of code that modifies game definitions. The code is written in Lua and must be serialized to Base64 encoding before setting as a modoption. A good website for Base64 encoding is https://www.base64encode.org/. Make sure to use URL-safe encoding.

There are 10 tweakdef scripts (from `tweakdefs` to `tweakdefs9`) that get loaded and executed one after another.
The order of tweakdefs loading is as follows:

```
Loading tweakdefs modoption
Loading tweakdefs1 modoption
Loading tweakdefs2 modoption
Loading tweakdefs3 modoption
Loading tweakdefs4 modoption
Loading tweakdefs5 modoption
Loading tweakdefs6 modoption
Loading tweakdefs7 modoption
Loading tweakdefs8 modoption
Loading tweakdefs9 modoption
```

To set a specific tweakdef modoption, use `!bset <tweakdef> <base64_string>`.

Each tweakdef script shares the same global environment table `_G`. This means that changes to the global environment persist across scripts. The global environemnt table `_G` comes with these key-value pairs:

```
DEFS: <table>
string: <table>
xpcall: <function>
VFS: <table>
tostring: <function>
print: <function>
unpack: <function>
VFS_MODES: mMb
getfenv: <function>
setmetatable: <function>
next: <function>
assert: <function>
tonumber: <function>
rawequal: <function>
getmetatable: <function>
Encoding: <table>
Spring: <table>
UnitDefs: <table>
SaveDefsToCustomParams: false
rawset: <function>
Engine: <table>
Shared: <table>
Json: <table>
load: <function>
pairsByKeys: <function>
Script: <table>
math: <table>
DontMessWithMyCase: <function>
pcall: <function>
table: <table>
coroutine: <table>
type: <function>
_G: <table>
select: <function>
pairs: <function>
rawget: <function>
loadstring: <function>
ipairs: <function>
_VERSION: Lua 5.1 with Recoil-specific changes
setfenv: <function>
Game: <table>
error: <function>
LOG: <table>
```