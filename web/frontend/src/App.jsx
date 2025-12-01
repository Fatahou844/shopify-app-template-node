import React from "react";
import { AppProvider, Frame, Page } from "@shopify/polaris";
import HomePage from "./pages/HomePage";

function App() {
  return (
    <AppProvider>
      <Frame>
        <Page title="Mon App Shopify">
          <HomePage />
        </Page>
      </Frame>
    </AppProvider>
  );
}

export default App;
