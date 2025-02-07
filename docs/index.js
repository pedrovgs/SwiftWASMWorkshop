import { WebAssembly, instantiate as internalInstantiate, testBrowser as internalTestBrowser, testNode as internalTestNode } from './intrinsics.js';
import { SwiftRuntime } from './JavaScriptKit_JavaScriptKit.resources/Runtime/index.mjs';
export const wasmFileName = 'SwiftWASMWorkshopApp.4bfc60fcc38a3c5b.wasm';

export async function instantiate(options, imports) {
  if (!options) {
    options = {};
  }
  const isNodeJs = (typeof process !== 'undefined') && (process.release.name === 'node');
  const isWebBrowser = (typeof window !== 'undefined');

  if (!options.module) {
    if (isNodeJs) {
      const module = await import(/* webpackIgnore: true */'node:module');
      const importMeta = import.meta;
      const fs = await import('fs/promises');
      const url = await import('url');
      const filePath = import.meta.resolve('./' + wasmFileName);
      options.module = await WebAssembly.compile(await fs.readFile(url.fileURLToPath(filePath)));
    } else if (isWebBrowser) {
      options.module = await WebAssembly.compileStreaming(fetch(wasmFileName));
    } else {
      throw new Error('Unsupported environment to automatically load the WebAssembly module. Please provide the "module" option with the compiled WebAssembly module manually.');
    }
  }
  options.SwiftRuntime = SwiftRuntime;
  return internalInstantiate(options, imports);
}

export async function testBrowser(args, options, inPage = false) {
  await internalTestBrowser(instantiate, wasmFileName, args, import.meta.url, options, inPage);
}

export async function testNode(args) {
  await internalTestNode(instantiate, wasmFileName, args);
}
