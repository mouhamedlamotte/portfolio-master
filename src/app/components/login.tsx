"use client"

import React from 'react'
import {signIn, signOut, useSession} from 'next-auth/react'

const Login = () => {

    const session = useSession()

  return (
    <div>
        <pre>
            {JSON.stringify(session, null, 2)}
        </pre>
        <h1>hello {session.data?.user?.name}</h1>
        {
            session.data?.user ? (
                <button onClick={() => signOut()}>Logout</button>
            ) : (
                <button onClick={() => signIn()}>Login</button>
            )
        }
    </div>
  )
}

export default Login