import type { ReactElement } from 'react'
import type { NextPageWithLayout } from './_app'

const Page: NextPageWithLayout = () => {
  return <p>hello world</p>
}

// If you want to customize your layout of this poage
// Page.getLayout = function getLayout(page: ReactElement) {
//   return (
//     <main>
//       {page}
//     </main>
//   )
// }

export default Page
