// Variable qui nous servira à savoir si nous voulons insérer ou mettre à jour un livreur
let livreur_id = null;

/**
 * @desc Ajoute un livreur sur la page HTML avec des boutons de modification et suppression
 * @param object livreur - Contient les informations des livreurs
 * @return void - Ne retourne rien
 */
function addLivreur(livreur) {
    const ctn = $("<div></div>");
    ctn.addClass("livreur_box");
    ctn.attr("id", "livreur_" + livreur.NROLIVR);

    const nom = $("<h2></h2>").text("Nom : " + livreur.NOMLIVR);
    const prenom = $("<p></p>").text("Prénom : " + livreur.PRENOMLIVR);
    const dateEmbauche = $("<p></p>").text("Date d'embauche : " + livreur.DATEEMBAUCHLIVR);

    const bottomCtn = $("<div></div>");

    const updateBtn = $("<button>Modifier</button>");
    updateBtn.on("click", () => {
        fillUpdateLivreurForm(livreur.NROLIVR);
    });

    const deleteBtn = $("<button>Supprimer</button>");
    deleteBtn.on("click", () => {
        deleteLivreur(livreur.NROLIVR);
    });

    ctn.append(nom, prenom, dateEmbauche, bottomCtn, updateBtn, deleteBtn);

    if (livreur.DATEEMBAUCHLIVR) {
        $("#livreur_ctn").append(ctn);
    } else {
        $("#livreur_ctn").prepend(ctn);
    }
}

/**
 * @desc Affiche le formulaire de modification avec les informations actuelles du livreur
 * @return void - Ne retourne rien
 */
function showUpdateLivreurForm() {
    // Crée dynamiquement un formulaire de modification
    const form = $("<form></form>").attr("id", "updateLivreurForm");

    const nomLabel = $("<label>Nom :</label>");
    const nomInput = $("<input type='text' id='updateNom' required>");

    const prenomLabel = $("<label>Prénom :</label>");
    const prenomInput = $("<input type='text' id='updatePrenom' required>");

    const dateEmbaucheLabel = $("<label>Date d'embauche :</label>");
    const dateEmbaucheInput = $("<input type='date' id='updateDateEmbauche' required>");

    const submitBtn = $("<button type='submit'>Mettre à jour</button>");

    form.append(nomLabel, nomInput, prenomLabel, prenomInput, dateEmbaucheLabel, dateEmbaucheInput, submitBtn);

    // Remplace le contenu de la boîte avec le formulaire de modification
    $(".box_livreur").html(form);

    // Ajoute un gestionnaire d'événements pour le formulaire de modification
    form.submit(event => {
        event.preventDefault();

        const nom = $("#updateNom").val();
        const prenom = $("#updatePrenom").val();
        const dateEmbauche = $("#updateDateEmbauche").val();

        if (livreur_id) {
            updateLivreur(nom, prenom, dateEmbauche);
        }

        $(".box_livreur").removeClass("open");
        $("#overlay_livreur").removeClass("open livreur-overlay");
    });

    $(".box_livreur h1").text("Modifier le livreur");
    $(".box_livreur").addClass("open");
    $("#overlay_livreur").addClass("open livreur-overlay");
}

/**
 * @desc Pré-remplit le formulaire de modification avec les informations du livreur sélectionné
 * @param string livreurId - Contient l'ID du livreur
 * @return void - Ne retourne rien
 */
function fillUpdateLivreurForm(livreurId) {
    $.ajax({
        url: "./php/livreur.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getLivreurDetails",
            NROLIVR: livreurId
        },
        success: (res) => {
            if (res.success && res.livreur) {
                const livreurDetails = res.livreur;
                livreur_id = livreurDetails.NROLIVR;
                showUpdateLivreurForm();
                // Pré-remplit le formulaire de modification avec les informations actuelles
                $("#updateNom").val(livreurDetails.NOMLIVR);
                $("#updatePrenom").val(livreurDetails.PRENOMLIVR);
                $("#updateDateEmbauche").val(livreurDetails.DATEEMBAUCHLIVR);
            } else {
                console.error("Erreur lors de la récupération des détails du livreur :", res.error);
                alert("Erreur lors de la récupération des détails du livreur.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails du livreur :", status, error);
            alert("Erreur lors de la récupération des détails du livreur.");
        }
    });
}

/**
 * @desc Fait appel au PHP pour supprimer un livreur
 * @param string id - Contient l'ID du livreur
 * @return void - Ne retourne rien
 */
function deleteLivreur(id) {
    $.ajax({
        url: "./php/livreur.php",
        type: "POST",
        dataType: "json",
        data: {
            choice: "DELETE",
            NROLIVR: id
        },
        success: (res) => {
            if (res.success) $("#livreur_" + id).remove();
            else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au PHP pour insérer un livreur
 * @param string nom - Contient le nom du livreur
 * @param string prenom - Contient le prénom du livreur
 * @param string dateEmbauche - Contient la date d'embauche du livreur
 * @return void - Ne retourne rien
 */
function insertLivreurForm(nom, prenom, dateEmbauche) {
    const fd = new FormData();
    fd.append("choice", "insert");
    fd.append("NOMLIVR", nom);
    fd.append("PRENOMLIVR", prenom);
    fd.append("DATEEMBAUCHLIVR", dateEmbauche);

    $.ajax({
        url: "./php/livreur.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addLivreur({
                    NROLIVR: res.NROLIVR,
                    NOMLIVR: nom,
                    PRENOMLIVR: prenom,
                    DATEEMBAUCHLIVR: dateEmbauche,
                });

                $(".box_livreur").removeClass("open");
                $("#overlay_livreur").removeClass("open livreur-overlay");
            } else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au PHP pour mettre à jour un livreur
 * @param string nom - Contient le nom du livreur
 * @param string prenom - Contient le prénom du livreur
 * @param string dateEmbauche - Contient la date d'embauche du livreur
 * @return void - Ne retourne rien
 */
function updateLivreur(nom, prenom, dateEmbauche) {
    const fd = new FormData();
    fd.append("choice", "update");
    fd.append("NOMLIVR", nom);
    fd.append("PRENOMLIVR", prenom);
    fd.append("DATEEMBAUCHLIVR", dateEmbauche);
    fd.append("NROLIVR", livreur_id);

    $.ajax({
        url: "./php/livreur.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addLivreur({
                    NROLIVR: livreur_id,
                    NOMLIVR: nom,
                    PRENOMLIVR: prenom,
                    DATEEMBAUCHLIVR: dateEmbauche,
                });
            } else alert(res.error);

            livreur_id = null;

            $(".box_livreur").removeClass("open");
            $("#overlay_livreur").removeClass("open livreur-overlay");
        }
    });
}

// Appel initial pour charger les livreurs
$.ajax({
    url: "./php/livreur.php",
    type: "GET",
    dataType: "json",
    data: {
        choice: "GET"
    },
    success: (res) => {
        if (res.success) {
            if (res.livreurs && Array.isArray(res.livreurs)) {
                res.livreurs.forEach(l => {
                    addLivreur(l);
                });
            } else {
                console.error("La propriété 'livreurs' est absente ou n'est pas un tableau dans la réponse.");
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
$("#livreurForm").submit(event => {
    event.preventDefault();

    const nom = $("#insertNom").val();
    const prenom = $("#insertPrenom").val();
    const dateEmbauche = $("#insertDateEmbauche").val();

    if (livreur_id) updateLivreur(nom, prenom, dateEmbauche);
    else insertLivreurForm(nom, prenom, dateEmbauche);
});

// Gestionnaire d'événements pour le bouton d'ajout
$("#addLivreurBtn").click(() => {
    insertLivreurForm("Nouveau Livreur", "Prénom du nouveau livreur", null);
});

// Gestionnaire d'événements pour le bouton d'annulation
$("#cancelLivreurBtn").click(() => {
    $(".box_livreur").removeClass("open");
    $("#overlay_livreur").removeClass("open livreur-overlay");
});

// Modifie le gestionnaire d'événements pour le bouton "Modifier"
$("#livreur_ctn").on("click", "button:contains('Modifier')", function () {
    const livreurId = $(this).closest("div").attr("id").split("_")[1];

    $.ajax({
        url: "./php/livreur.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getLivreurDetails",
            NROLIVR: livreurId
        },
        success: (res) => {
            if (res.success && res.livreur) {
                const livreurDetails = res.livreur;
                livreur_id = livreurDetails.NROLIVR;
                showUpdateLivreurForm();
                // Pré-remplit le formulaire de modification avec les informations actuelles
                $("#updateNom").val(livreurDetails.NOMLIVR);
                $("#updatePrenom").val(livreurDetails.PRENOMLIVR);
                $("#updateDateEmbauche").val(livreurDetails.DATEEMBAUCHLIVR);
            } else {
                alert("Erreur lors de la récupération des détails du livreur.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails du livreur :", status, error);
        }
    });
});

// Gestionnaire d'événements pour le bouton de fermeture
$("#closeLivreurBtn").click(() => {
    $(".box_livreur").removeClass("open");
    $("#overlay_livreur").removeClass("open livreur-overlay");
});

// Gestionnaire d'événements pour l'overlay
$("#overlay_livreur").click(() => {
    // Modifiez cette partie pour vérifier la classe spéciale
    if ($("#overlay_livreur").hasClass("livreur-overlay")) {
        $(".box_livreur").removeClass("open");
        $("#overlay_livreur").removeClass("open livreur-overlay");
    }
});
