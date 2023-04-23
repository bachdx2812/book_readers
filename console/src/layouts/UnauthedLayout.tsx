import React from 'react';
import { Layout, Space } from 'antd';

const { Header, Footer, Content } = Layout;

export default ({children}: any) => {
  return (
    <Space direction="vertical" style={{ width: '100%' }} size={[0, 48]}>
    <Layout>
      <Header >Header</Header>
      <Content >
        { children }
      </Content>
      <Footer>Footer</Footer>
    </Layout>
  </Space>
  );
};