const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendOrderUpdateNotification = functions.region("europe-west3").firestore
    .document("orderUpdates/{docId}")
    .onWrite(async (change, context) => {
      const beforeData = change.before.exists ? change.before.data() : {};
      const afterData = change.after.exists ? change.after.data() : {};
      let title = "";
      let body = "";

      if (afterData.pedidoRealizado && !beforeData.pedidoRealizado) {
        title = "Pedido Realizado";
        body = "Tu pedido ha sido realizado con éxito.";
      } else if (afterData.correoConfirmacionEnviado && !beforeData
          .correoConfirmacionEnviado) {
        title = "Correo de Confirmación Enviado";
        body = "Se ha enviado un correo de confirmación.";
      } else if (afterData.pedidoEnCamino && !beforeData.pedidoEnCamino) {
        title = "Pedido en Camino";
        body = "Tu pedido está en camino.";
      } else if (afterData.pedidoEntregado && !beforeData.pedidoEntregado) {
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
    });
