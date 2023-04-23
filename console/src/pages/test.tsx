import type { ReactElement } from 'react'
import type { NextPageWithLayout } from './_app'

const Page: NextPageWithLayout = () => {
  return <p>own layout</p>
}

Page.getLayout = function getLayout(page: ReactElement) {
  return (
    <main>
      <h1> own layout </h1>
      {page}
    </main>
  )
}

export default Page
