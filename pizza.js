// Variable qui nous servira à savoir si nous voulons insérer ou mettre à jour une pizza
let pizza_id = null;

/**
 * @desc Ajoute une pizza sur la page HTML avec un bouton de modification
 * @param object pizza - Contient les informations des pizzas
 * @return void - Ne retourne rien
 */
function addPizza(pizza) {
    const ctn = $("<article></article>");
    ctn.addClass("art_box");
    ctn.attr("id", "pizza_" + pizza.NROPIZZ);

    const title = $("<h2></h2>").text(pizza.DESIGNPIZZ);

    const desc_ctn = $("<div></div>");
    const desc = $("<p></p>").text("Description : " + pizza.TARIFPIZZ);
    desc.addClass("desc");

    // Ajoutez le prix à la balise span.price-value
    const price = $("<span class='price-value'></span>").text("Prix : " + pizza.TARIFPIZZ);
    desc_ctn.append(price);

    const bottom_ctn = $("<div></div>");

    const updateBtn = $("<button>Modifier</button>");
    updateBtn.on("click", () => {
        fillUpdateForm(pizza.NROPIZZ);
    });

    const deleteBtn = $("<button>Supprimer</button>");
    deleteBtn.on("click", () => {
        deletePizza(pizza.NROPIZZ);
    });

    ctn.append(title, desc_ctn, bottom_ctn, updateBtn, deleteBtn);

    if (pizza.created_at) $("#art_ctn").append(ctn);
    else $("#art_ctn").prepend(ctn);
}

/**
 * @desc Affiche le formulaire de modification avec les informations actuelles
 * @return void - Ne retourne rien
 */
function showUpdateForm() {
    // Crée dynamiquement un formulaire de modification
    const form = $("<form></form>").attr("id", "updateForm");

    const nameLabel = $("<label>Nom :</label>");
    const nameInput = $("<input type='text' id='updateName' required>");

    const descLabel = $("<label>Description :</label>");
    const descInput = $("<input type='text' id='updateDesc' required>");

    const pictureLabel = $("<label>Image :</label>");
    const pictureInput = $("<input type='file' id='updatePicture'>");

    const submitBtn = $("<button type='submit'>Mettre à jour</button>");

    form.append(nameLabel, nameInput, descLabel, descInput, pictureLabel, pictureInput, submitBtn);

    // Remplace le contenu de la boîte avec le formulaire de modification
    $(".box").html(form);

    // Ajoute un gestionnaire d'événements pour le formulaire de modification
    form.submit(event => {
        event.preventDefault();

        const name = $("#updateName").val();
        const desc = $("#updateDesc").val();
        const picture = $("#updatePicture")[0].files[0];

        if (pizza_id) {
            updatePizza(name, desc, picture);
        }

        $(".box").removeClass("open");
        $("#overlay").removeClass("open pizza-overlay");
    });

    $(".box h1").text("Modifier la pizza");
    $(".box").addClass("open");
    $("#overlay").addClass("open pizza-overlay");
}

/**
 * @desc Pré-remplit le formulaire de modification avec les informations de la pizza sélectionnée
 * @param string pizzaId - Contient l'ID de la pizza
 * @return void - Ne retourne rien
 */
function fillUpdateForm(pizzaId) {
    $.ajax({
        url: "./php/pizza.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getPizzaDetails",
            NROPIZZ: pizzaId
        },
        success: (res) => {
            if (res.success && res.pizza) {
                const pizzaDetails = res.pizza;
                pizza_id = pizzaDetails.NROPIZZ;
                showUpdateForm();
                // Pré-remplit le formulaire de modification avec les informations actuelles
                $("#updateName").val(pizzaDetails.DESIGNPIZZ);
                $("#updateDesc").val(pizzaDetails.TARIFPIZZ);
            } else {
                console.error("Erreur lors de la récupération des détails de la pizza :", res.error);
                alert("Erreur lors de la récupération des détails de la pizza.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails de la pizza :", status, error);
            alert("Erreur lors de la récupération des détails de la pizza.");
        }
    });
}

/**
 * @desc Fait appel au php pour supprimer une pizza
 * @param string id - Contient l'id de la pizza
 * @return void - Ne retourne rien
 */
function deletePizza(id) {
    $.ajax({
        url: "./php/pizza.php",
        type: "POST",
        dataType: "json",
        data: {
            choice: "DELETE",
            NROPIZZ: id
        },
        success: (res) => {
            if (res.success) $("#pizza_" + id).remove();
            else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au php pour insérer une pizza
 * @param string name - Contient le nom de la pizza
 * @param string desc - Contient la description de la pizza
 * @param File picture - Contient l'image de la pizza
 * @return void - Ne retourne rien
 */
function insertPizzaForm(name, desc, picture) {
    const fd = new FormData();
    fd.append("choice", "insert");
    fd.append("DESIGNPIZZ", name);
    fd.append("TARIFPIZZ", desc);
    fd.append("picture", picture);

    $.ajax({
        url: "./php/pizza.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addPizza({
                    NROPIZZ: res.NROPIZZ,
                    DESIGNPIZZ: name,
                    TARIFPIZZ: desc,
                    created_at: res.created_at,
                });

                $(".box").removeClass("open");
                $("#overlay").removeClass("open pizza-overlay");
            } else alert(res.error);
        }
    });
}

/**
 * @desc Fait appel au php pour mettre à jour une pizza
 * @param string name - Contient le nom de la pizza
 * @param string desc - Contient la description de la pizza
 * @param File picture - Contient l'image de la pizza
 * @return void - Ne retourne rien
 */
function updatePizza(name, desc, picture) {
    const fd = new FormData();
    fd.append("choice", "update");
    fd.append("DESIGNPIZZ", name);
    fd.append("TARIFPIZZ", desc);
    fd.append("picture", picture);
    fd.append("NROPIZZ", pizza_id);

    $.ajax({
        url: "./php/pizza.php",
        type: "POST",
        dataType: "json",
        contentType: false,
        processData: false,
        cache: false,
        data: fd,
        success: (res) => {
            if (res.success) {
                addPizza({
                    NROPIZZ: pizza_id,
                    DESIGNPIZZ: name,
                    TARIFPIZZ: desc,
                    created_at: res.created_at,
                });
            } else alert(res.error);

            pizza_id = null;

            $(".box").removeClass("open");
            $("#overlay").removeClass("open pizza-overlay");
        }
    });
}

// Appel initial pour charger les pizzas
$.ajax({
    url: "./php/pizza.php",
    type: "GET",
    dataType: "json",
    data: {
        choice: "GET"
    },
    success: (res) => {
        if (res.success) {
            if (res.pizzas && Array.isArray(res.pizzas)) {
                res.pizzas.forEach(p => {
                    addPizza(p);
                });
            } else {
                console.error("La propriété 'pizzas' est absente ou n'est pas un tableau dans la réponse.");
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
$("#pizzaForm").submit(event => {
    event.preventDefault();

    const name = $("#name").val();
    const desc = $("#desc").val();
    const picture = $("#picture")[0].files[0];

    if (pizza_id) updatePizza(name, desc, picture);
    else insertPizzaForm(name, desc, picture);
});

// Gestionnaire d'événements pour le bouton d'ajout
$("#addPizzaBtn").click(() => {
    insertPizzaForm("Nouvelle Pizza", "Description de la nouvelle pizza", null);
});

// Gestionnaire d'événements pour le bouton d'annulation
$("#cancelBtn").click(() => {
    $(".box").removeClass("open");
    $("#overlay").removeClass("open pizza-overlay");
});

// Modifie le gestionnaire d'événements pour le bouton "Modifier"
$("#art_ctn").on("click", "button:contains('Modifier')", function () {
    const pizzaId = $(this).closest("article").attr("id").split("_")[1];

    $.ajax({
        url: "./php/pizza.php",
        type: "GET",
        dataType: "json",
        data: {
            choice: "getPizzaDetails",
            NROPIZZ: pizzaId
        },
        success: (res) => {
            if (res.success && res.pizza) {
                const pizzaDetails = res.pizza;
                pizza_id = pizzaDetails.NROPIZZ;
                showUpdateForm();
                // Pré-remplit le formulaire de modification avec les informations actuelles
                $("#updateName").val(pizzaDetails.DESIGNPIZZ);
                $("#updateDesc").val(pizzaDetails.TARIFPIZZ);
            } else {
                alert("Erreur lors de la récupération des détails de la pizza.");
            }
        },
        error: (xhr, status, error) => {
            console.error("Erreur lors de la requête AJAX pour la récupération des détails de la pizza :", status, error);
        }
    });
});

// Gestionnaire d'événements pour le bouton de fermeture
$("#closeBtn").click(() => {
    $(".box").removeClass("open");
    $("#overlay").removeClass("open pizza-overlay");
});

// Gestionnaire d'événements pour l'overlay
$("#overlay").click(() => {
    // Modifiez cette partie pour vérifier la classe spéciale
    if ($("#overlay").hasClass("pizza-overlay")) {
        $(".box").removeClass("open");
        $("#overlay").removeClass("open pizza-overlay");
    }
});
