import "@/styles/globals.css"

import type { ReactElement, ReactNode } from 'react'
import type { NextPage } from 'next'
import type { AppProps } from 'next/app'
import AuthedLayout from '@/layouts/AuthedLayout'
import UnauthedLayout from "@/layouts/UnauthedLayout";

import { RootState, store, persistor } from "../store";
import { useSelector, Provider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";

import { ApolloProvider } from '@apollo/client';
import { client } from "@/libs/apis"

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

const AppWrapper = ({ children}: {children: ReactElement}) => {
  const signedIn = useSelector((state: RootState) => state.auth.signedIn);

  return (
    <>
      {
        signedIn ? (
          <AuthedLayout>
            { children }
          </AuthedLayout>
        ) : (
          <UnauthedLayout>
            { children }
          </UnauthedLayout>
        )
      }
    </>
  )
}

export default function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  return (
    <ApolloProvider client={client}>
      <Provider store={store}>
        <PersistGate loading={null} persistor={persistor}>
          { 
            Component.getLayout ? (
              <Component {...pageProps} /> 
            ) : (
              <AppWrapper children={<Component {...pageProps} /> }/> 
            )
          }
        </PersistGate>
      </Provider>
    </ApolloProvider>
  )
}