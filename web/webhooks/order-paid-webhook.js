// /web/order-paid-webhook.js
export default async function orderPaidHandler(topic, shop, body) {
  try {
    const orderData = JSON.parse(body);

    // Appel API vers ton serveur distant
    await fetch("https://tonserveur.com/api/order", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(orderData),
    });

    console.log("Webhook ORDERS_PAID envoyé avec succès !");
  } catch (err) {
    console.error("Erreur webhook ORDERS_PAID:", err.message);
  }
}
