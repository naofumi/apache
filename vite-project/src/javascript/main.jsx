import { useState } from 'react'

export default function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="container max-w-2xl mx-auto mt-16">
      <a href="/about/" className="underline text-blue-600">About Page</a>
      <h1 className="text-4xl text-center">Vite Deployed on Kamal/Apache</h1>

      <h2 className="text-2xl text-center my-16">Counter</h2>
      <div className="max-w-lg mx-auto text-center text-xl">
        <div className="mb-4">{count}</div>
        <div>
          <button className="mr-2 p-2 rounded-md bg-orange-600 text-white" onClick={() => setCount(count + 1)}>Increment</button>
          <button className="p-2 rounded-md bg-orange-600 text-white" onClick={() => setCount(count - 1)}>Decrement</button>
        </div>
      </div>
    </div>
  )
}
