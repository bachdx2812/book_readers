import "@/styles/globals.css"

import type { ReactElement, ReactNode } from 'react'
import type { NextPage } from 'next'
import type { AppProps } from 'next/app'
import AuthedLayout from '@/layouts/AuthedLayout'
import UnauthedLayout from "@/layouts/UnauthedLayout";

import { RootState, store, persistor } from "../store";
import { useSelector, Provider } from "react-redux";
import { PersistGate } from "redux-persist/integration/react";

export type NextPageWithLayout<P = {}, IP = P> = NextPage<P, IP> & {
  getLayout?: (page: ReactElement) => ReactNode
}

type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout
}

const getDefaultLayout = function(page: ReactElement) {
  const token = useSelector((state: RootState) => state.auth.token);
  console.log(token);

  return (
    <UnauthedLayout>
      { page }
    </UnauthedLayout>
  )
}

export default function MyApp({ Component, pageProps }: AppPropsWithLayout) {
  const getLayout = Component.getLayout ?? getDefaultLayout;

  return (
    <Provider store={store}>
      <PersistGate loading={null} persistor={persistor}>
        { getLayout(<Component {...pageProps} />)  }
      </PersistGate>
    </Provider>
  )
}