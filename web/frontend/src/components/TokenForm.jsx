import { Button, Card, TextField } from "@shopify/polaris"; // Polaris est déjà inclus dans le template Shopify
import { useState } from "react";

export default function TokenForm() {
  const [token, setToken] = useState("");

  const handleSave = async () => {
    // Envoie le token au backend pour le stocker
    const res = await fetch("/api/save-token", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ token }),
    });

    if (res.ok) alert("Token enregistré !");
    else alert("Erreur !");
  };

  return (
    <Card sectioned>
      <div style={{ textAlign: "center", marginBottom: "20px" }}>
        <img src="/logo.jpg" alt="Logo" style={{ maxWidth: "150px" }} />
      </div>
      <TextField
        label="Entrez votre token"
        value={token}
        onChange={(value) => setToken(value)}
        autoComplete="off"
      />
      <Button primary onClick={handleSave} style={{ marginTop: "10px" }}>
        Enregistrer
      </Button>
    </Card>
  );
}
