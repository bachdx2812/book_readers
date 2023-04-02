import "@/styles/globals.css"

import type { ReactElement, ReactNode } from 'react'
import type { NextPage } from 'next'
import type { AppProps } from 'next/app'
import AuthedLayout from '@/layouts/AuthedLayout'

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

const getDefaultLayout = function(page: ReactElement) {
  return (
    <AuthedLayout>
      { page }
    </AuthedLayout>
  )
}

export default function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  const getLayout = Component.getLayout ?? getDefaultLayout;

  return getLayout(<Component {...pageProps} />) 
}