"use client"

import React from 'react'
import {signIn, signOut, useSession} from 'next-auth/react'

const Login = () => {

    const session = useSession()

  return (
    <div className="flex justify-center items-center min-h-screen bg-gray-100">
  <div className="max-w-sm w-full bg-white shadow-lg rounded-lg p-6">
    <h1 className="text-2xl font-semibold text-gray-800 mb-4">
      Hello {session.data?.user?.name || "Guest"}
    </h1>
    {session.data ? (
      <div>
        <p className="text-gray-700">
          <strong>Status:</strong> {session.status}
        </p>
        <p className="text-gray-700">
          <strong>Name:</strong> {session.data.user?.name}
        </p>
        <p className="text-gray-700">
          <strong>Email:</strong> {session.data.user?.email}
        </p>
        <p className="text-gray-700">
          <strong>Expires:</strong> {new Date(session.data.expires).toLocaleString()}
        </p>
        <button
          onClick={() => signOut()}
          className="w-full bg-red-500 text-white py-2 px-4 rounded-lg mt-4 hover:bg-red-600 transition"
        >
          Logout
        </button>
      </div>
    ) : (
      <button
        onClick={() => signIn()}
        className="w-full bg-blue-500 text-white py-2 px-4 rounded-lg mt-4 hover:bg-blue-600 transition"
      >
        Login
      </button>
    )}
  </div>
</div>

  )
}

export default Login