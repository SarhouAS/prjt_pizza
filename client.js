// Variable qui nous servira à savoir si nous voulons insérer ou mettre à jour un client
let client_id = null;

/**
 * @desc Ajoute un client sur la page HTML avec un bouton de modification
 * @param object client - Contient les informations des clients
 * @return void - Ne retourne rien
 */
function addClient(client) {
    const ctn = $("<article></article>");
    ctn.addClass("art_box");
    ctn.attr("id", "client_" + client.NROCLIE);

    const title = $("<h2></h2>").text(client.NOMCLIE + " " + client.PRENOMCLIE);

    const desc_ctn = $("<div></div>");
    const desc = $("<p></p>").text("Adresse : " + client.ADRESSECLIE + ", " + client.VILLECLIE);
    desc.addClass("desc");

    // Ajoutez d'autres informations du client si nécessaire

    const bottom_ctn = $("<div></div>");

    const updateBtn = $("<button>Modifier</button>");
    updateBtn.on("click", () => {
        fillUpdateForm(client.NROCLIE);
    });

    const deleteBtn = $("<button>Supprimer</button>");
    deleteBtn.on("click", () => {
        deleteClient(client.NROCLIE);
    });

    ctn.append(title, desc_ctn, bottom_ctn, updateBtn, deleteBtn);

    $("#art_ctn").append(ctn); // Ajout à la fin de la section art_ctn
}

/**
 * @desc Affiche le formulaire de modification avec les informations actuelles
 * @return void - Ne retourne rien
 */
function showUpdateForm() {
    const form = $("<form></form>").attr("id", "updateForm");

    // Ajoutez ici les champs du formulaire en fonction de la structure de la table client
    // Exemple : nom, prénom, adresse, etc.

    const submitBtn = $("<button type='submit'>Mettre à jour</button>");

    form.append(/* Ajoutez ici les champs du formulaire */ submitBtn);

    $(".box").html(form); // Remplacement du contenu de la boîte avec le formulaire de modification

    form.submit(event => {
        event.preventDefault();

        // Ajoutez ici le code pour récupérer les valeurs du formulaire et appeler la fonction updateClient
    });

    $(".box h1").text("Modifier le client");
    $(".box").addClass("open");
    $("#overlay").addClass("open client-overlay");
}

/**
 * @desc Pré-remplit le formulaire de modification avec les informations du client sélectionné
 * @param string clientId - Contient l'ID du client
 * @return void - Ne retourne rien
 */
function fillUpdateForm(clientId) {
    $.ajax({
        url: "./php/client.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getClientDetails",
            NROCLIE: clientId
        },
        success: (res) => {
            if (res.success && res.client) {
                const clientDetails = res.client;
                client_id = clientDetails.NROCLIE;
                showUpdateForm();

                // Ajoutez ici le code pour pré-remplir le formulaire avec les informations actuelles du client
                // Exemple : $("#updateName").val(clientDetails.NOMCLIE);
            } else {
                console.error("Erreur lors de la récupération des détails du client :", res.error);
                alert("Erreur lors de la récupération des détails du client.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails du client :", status, error);
            alert("Erreur lors de la récupération des détails du client.");
        }
    });
}

/**
 * @desc Fait appel au php pour supprimer un client
 * @param string id - Contient l'id du client
 * @return void - Ne retourne rien
 */
function deleteClient(id) {
    $.ajax({
        url: "./php/client.php",
        type: "POST",
        dataType: "json",
        data: {
            choice: "DELETE",
            NROCLIE: id
        },
        success: (res) => {
            if (res.success) $("#client_" + id).remove();
            else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au php pour insérer un client
 * @param string name - Contient le nom du client
 * @param string desc - Contient la description du client
 * @return void - Ne retourne rien
 */
function insertClientForm(name, desc) {
    const fd = new FormData();
    fd.append("choice", "insert");

    // Ajoutez ici les champs du formulaire pour l'insertion du client
    // Exemple : fd.append("NOMCLIE", name);

    $.ajax({
        url: "./php/client.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addClient({
                    NROCLIE: res.NROCLIE,
                    NOMCLIE: name,
                    // Ajoutez ici d'autres informations du client si nécessaire
                    created_at: res.created_at,
                });

                $(".box").removeClass("open");
                $("#overlay").removeClass("open client-overlay");
            } else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au php pour mettre à jour un client
 * @param string name - Contient le nom du client
 * @param string desc - Contient la description du client
 * @return void - Ne retourne rien
 */
function updateClient(name, desc) {
    const fd = new FormData();
    fd.append("choice", "update");

    // Ajoutez ici les champs du formulaire pour la mise à jour du client
    // Exemple : fd.append("NOMCLIE", name);

    fd.append("NROCLIE", client_id);

    $.ajax({
        url: "./php/client.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addClient({
                    NROCLIE: client_id,
                    NOMCLIE: name,
                    // Ajoutez ici d'autres informations du client si nécessaire
                    created_at: res.created_at,
                });
            } else alert(res.error);

            client_id = null;

            $(".box").removeClass("open");
            $("#overlay").removeClass("open client-overlay");
        }
    });
}

// Appel initial pour charger les clients
$.ajax({
    url: "./php/client.php",
    type: "GET",
    dataType: "json",
    data: {
        choice: "GET"
    },
    success: (res) => {
        if (res.success) {
            if (res.clients && Array.isArray(res.clients)) {
                res.clients.forEach(c => {
                    addClient(c);
                });
            } else {
                console.error("La propriété 'clients' est absente ou n'est pas un tableau dans la réponse.");
            }
        } else {
            alert(res.error);
        }
    },
    error: (xhr, status, error) => {
        console.error("Erreur lors de la requête AJAX :", status, error);
    }
});

// Gestionnaire d'événements pour le formulaire
$("#clientForm").submit(event => {
    event.preventDefault();

    // Ajoutez ici le code pour récupérer les valeurs du formulaire et appeler la fonction insertClientForm ou updateClient
});

// Gestionnaire d'événements pour le bouton d'ajout
$("#addClientBtn").click(() => {
    insertClientForm("Nouveau Client", "Description du nouveau client");
});

// Gestionnaire d'événements pour le bouton d'annulation
$("#cancelBtn").click(() => {
    $(".box").removeClass("open");
    $("#overlay").removeClass("open client-overlay");
});

// Modifie le gestionnaire d'événements pour le bouton "Modifier"
$("#art_ctn").on("click", "button:contains('Modifier')", function () {
    const clientId = $(this).closest("article").attr("id").split("_")[1];

    $.ajax({
        url: "./php/client.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getClientDetails",
            NROCLIE: clientId
        },
        success: (res) => {
            if (res.success && res.client) {
                const clientDetails = res.client;
                client_id = clientDetails.NROCLIE;
                showUpdateForm();
                // Ajoutez ici le code pour pré-remplir le formulaire avec les informations actuelles du client
                // Exemple : $("#updateName").val(clientDetails.NOMCLIE);
            } else {
                alert("Erreur lors de la récupération des détails du client.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails du client :", status, error);
        }
    });
});

// Gestionnaire d'événements pour le bouton de fermeture
$("#closeBtn").click(() => {
    $(".box").removeClass("open");
    $("#overlay").removeClass("open client-overlay");
});

// Gestionnaire d'événements pour l'overlay
$("#overlay").click(() => {
    // Ajoutez ici le code pour vérifier la classe spéciale
    if ($("#overlay").hasClass("client-overlay")) {
        $(".box").removeClass("open");
        $("#overlay").removeClass("open client-overlay");
    }
});
