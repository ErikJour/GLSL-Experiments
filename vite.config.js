// vite.config.js
import { defineConfig } from 'vite';
import { resolve } from 'path';
import glsl from 'vite-plugin-glsl'

export default defineConfig({
    plugins: [
        {
            name: 'full-reload',
            handleHotUpdate({ server }) {
                server.ws.send({ type: 'full-reload' });
                return [];
            },
        },
        glsl()
    ],
    build: {
        outDir: 'dist',
        rollupOptions: {
            input: resolve(__dirname, 'index.html'),
            output: {
                format: 'iife',
                name: 'App',
            },
        },
    },
});