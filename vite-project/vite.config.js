import { resolve } from 'path'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  root: resolve(__dirname, 'src/pages'),
  build: {
    outDir: resolve(__dirname, 'dist'),
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'src/pages/index.html'),
        about: resolve(__dirname, 'src/pages/about/index.html'),
        healthcheck: resolve(__dirname, 'src/pages/up/index.html'),
      },
    },
  },
})
