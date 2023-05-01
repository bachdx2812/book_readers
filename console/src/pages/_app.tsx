import "@/styles/globals.css"

import type { ReactElement, ReactNode } from 'react'
import { useEffect } from 'react'
import type { NextPage } from 'next'
import type { AppProps } from 'next/app'
import AuthedLayout from '@/layouts/AuthedLayout'
import UnauthedLayout from "@/layouts/UnauthedLayout";

import { RootState, store, persistor } from "@/store";
import { useSelector, Provider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";

import { ApolloProvider } from '@apollo/client';
import { client } from "@/libs/apis"

import {useRouter} from 'next/router';

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

const AppWrapper = ({ children}: {children: ReactElement}) => {
  const token = useSelector((state: RootState) => state.auth.token);
  const router = useRouter();

  const currentPath = router.pathname;

  useEffect(() => {
    if (token && currentPath.includes('/auth/login')) {
      router.push("/");
    } else if (!token && !currentPath.includes('/auth/login')) {
      router.push("/auth/login");
    }
  }, [token, currentPath]);

  return (
    <>
      {
        token ? (
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