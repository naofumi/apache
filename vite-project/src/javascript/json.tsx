import {useEffect, useState} from 'react'

export default function Json() {
  const [data, setData] = useState(null)

  useEffect(() => {
    fetch("/cgi-bin/json.cgi")
      .then(res => res.json())
      .then(data => setData(data))
  }, [])

  return (
    <div className="container max-w-2xl mx-auto mt-16">
      <a href="/about/" className="underline text-blue-600">About Page</a>
      <h1 className="text-4xl text-center">Data from Perl CGI</h1>

      <div className="max-w-lg mx-auto text-center text-xl">
          {data && <div>
            message: {data.message}
          </div>}
      </div>
    </div>
  )
}
