const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendOrderUpdateNotification = functions.region("europe-west3").firestore
    .document("orderUpdates/{docId}")
    .onWrite(async (change, context) => {
      const data = change.after.exists ? change.after.data() : null;
      let title = "";
      let body = "";

      if (data) {
        if (data.pedidoRealizado) {
          title = "Pedido Realizado";
          body = "Tu pedido ha sido realizado con éxito.";
        } else if (data.correoConfirmacionEnviado) {
          title = "Correo de Confirmación Enviado";
          body = "Se ha enviado un correo de confirmación.";
        } else if (data.pedidoEnCamino) {
          title = "Pedido en Camino";
          body = "Tu pedido está en camino.";
        } else if (data.pedidoEntregado) {
          title = "Pedido Entregado";
          body = "Tu pedido ha sido entregado.";
        }

        if (title && body) {
          const message = {
            notification: {title, body},
            topic: "orderUpdates",
          };

          try {
            const response = await admin.messaging().send(message);
            console.log("Successfully sent message:", response);
          } catch (error) {
            console.error("Error sending message:", error);
          }
        }
      }
    });
