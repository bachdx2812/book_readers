import { Layout } from 'antd';
const { Content } = Layout;

export default function UnauthedLayout({children}: any) {
  return (
    <Layout className="layout">
      <Content
        className="site-layout-background"
          style={{
          margin: '24px 16px',
          padding: 24,
        }}
      >
        { children }
      </Content>
    </Layout>
  )
}