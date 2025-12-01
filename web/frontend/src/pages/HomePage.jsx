import { AppProvider, Page } from "@shopify/polaris";
import TokenForm from "../components/TokenForm";

export default function App() {
  return (
    <AppProvider>
      <Page title="Paramètres de l’app">
        <TokenForm />
      </Page>
    </AppProvider>
  );
}
