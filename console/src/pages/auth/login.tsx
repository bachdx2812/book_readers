import React, { useState } from "react";

import { useMutation } from "@apollo/client";
import { ConsolesSignIn } from "@/graphql/auth";

interface FormTarget {
  name: string;
  value: string;
}

export default function Login() {
  const [form, setForm] = useState({
    email: "",
    password: "",
    rememberMe: false
  })

  const handleCheckRememberMe = (event: React.ChangeEvent<HTMLInputElement>) => {
    setForm({
      ...form,
      rememberMe: event.target.checked
    })
  }

  const handleChange = ({
    target: { name, value },
  }: {
    target: FormTarget;
  }) => {
    setForm((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  const [signIn, { data, loading, error }] = useMutation(ConsolesSignIn);

  return (
    <div className="mx-auto w-full max-w-sm lg:w-96">
      <div>
        <img
          className="h-10 w-auto"
          src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
          alt="Your Company"
        />
        <h2 className="mt-8 text-2xl font-bold leading-9 tracking-tight text-gray-900">
          Sign in to your account
        </h2>
      </div>

      <div className="mt-10">
        <div>
          <form className="space-y-6" onSubmit={e => {
            e.preventDefault();
            signIn({ variables: { ...form } });
          }}>
            <div>
              <label htmlFor="email" className="block text-sm font-medium leading-6 text-gray-900">
                Email address
              </label>
              <div className="mt-2">
                <input
                  name="email"
                  type="email"
                  value={form.email}
                  required
                  onChange={handleChange}
                  className="block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>
            <div>
              <label htmlFor="password" className="block text-sm font-medium leading-6 text-gray-900">
                Password
              </label>
              <div className="mt-2">
                <input
                  name="password"
                  type="password"
                  value={form.password}
                  required
                  onChange={handleChange}
                  className="block w-full rounded-md border-0 py-1.5 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>

            <div className="flex items-center justify-between">
              <div className="flex items-center">
                <input
                  name="remember-me"
                  type="checkbox"
                  checked={form.rememberMe}
                  onChange={(event) => {handleCheckRememberMe(event)}}
                  className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600"
                />
                <label htmlFor="remember-me" className="ml-3 block text-sm leading-6 text-gray-700">
                  Remember me
                </label>
              </div>

              <div className="text-sm leading-6">
                <a href="#" className="font-semibold text-indigo-600 hover:text-indigo-500">
                  Forgot password?
                </a>
              </div>
            </div>

            <div>
              <button
                type="submit"
                className="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                Sign in
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}