import { resolve } from 'path'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  root: resolve(__dirname, 'src'),
  build: {
    outDir: resolve(__dirname, '../htdocs'),
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'src/index.html'),
        react: resolve(__dirname, 'src/react/index.html'),
        json: resolve(__dirname, 'src/react/json.html'),
        about: resolve(__dirname, 'src/about/index.html'),
        healthcheck: resolve(__dirname, 'src/up/index.html'),
      },
    },
  },
})
