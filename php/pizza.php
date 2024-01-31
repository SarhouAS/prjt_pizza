<?php
// Permet l'affichage des erreurs - À ne pas commit
error_reporting(-1);

// J'intègre obligatoirement (une fois) le contenu de mon fichier de connexion à ma bdd
require_once("./db_connect.php");

// Spécifie que le contenu est au format JSON
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Remplacez * par le domaine réel de votre application si possible.

// En fonction du paramètre "choice" de ma requête, j'exécute les instructions de la case correspondante
switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        // je récupère tous les pizza
        if (isset($_GET["choice"]) && $_GET["choice"] === "getPizzaDetails") {
            if (!isset($_GET["NROPIZZ"]) || empty(trim($_GET["NROPIZZ"]))) {
                echo json_encode(["success" => false, "error" => "Id manquant"]);
                die;
            }

            $pizzaId = $_GET["NROPIZZ"];
            $req = $db->prepare("SELECT * FROM pizza WHERE NROPIZZ = ?");
            $req->execute([$pizzaId]);
            $pizzaDetails = $req->fetch(PDO::FETCH_ASSOC);

            if ($pizzaDetails) {
                echo json_encode(["success" => true, "pizza" => $pizzaDetails]);
            } else {
                echo json_encode(["success" => false, "error" => "Aucun détail trouvé pour la pizza avec l'ID $pizzaId"]);
            }
            break;
        } else {
            $req = $db->query("SELECT * FROM pizza;");
            // J'affecte la totalité de mes résultats à la variable $pizzas
            $pizzas = $req->fetchAll(PDO::FETCH_ASSOC);
            // j'envoie une réponse avec un success
            echo json_encode(["success" => true, "pizzas" => $pizzas]);
        }
        break;

    case "POST": // Utilisez "POST" pour les opérations d'insertion, de mise à jour et de suppression
        if (!isset($_POST["choice"])) {
            echo json_encode(["success" => false, "error" => "Choix non spécifié"]);
            die;
        }

        switch ($_POST["choice"]) {
            case "insert":
                if (!isset($_POST["DESIGNPIZZ"], $_POST["TARIFPIZZ"]) || empty(trim($_POST["DESIGNPIZZ"])) || empty(trim($_POST["TARIFPIZZ"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("INSERT INTO pizza (DESIGNPIZZ, TARIFPIZZ) VALUES (:DESIGNPIZZ, :TARIFPIZZ)");
                $req->bindValue(":DESIGNPIZZ", $_POST["DESIGNPIZZ"]);
                $req->bindValue(":TARIFPIZZ", $_POST["TARIFPIZZ"]);
                $req->execute();

                echo json_encode(["success" => true, "NROPIZZ" => $db->lastInsertId(), "created_at" => date("Y-m-d H:i:s")]);
                break;

            case "update":
                parse_str(file_get_contents("php://input"), $put_vars);

                if (!isset($put_vars["DESIGNPIZZ"], $put_vars["TARIFPIZZ"], $put_vars["NROPIZZ"]) || empty(trim($put_vars["DESIGNPIZZ"])) || empty(trim($put_vars["TARIFPIZZ"])) || empty(trim($put_vars["NROPIZZ"]))) {
                    echo json_encode(["success" => false, "error" => "Données manquantes"]);
                    die;
                }

                $req = $db->prepare("UPDATE pizza SET DESIGNPIZZ = :DESIGNPIZZ, TARIFPIZZ = :TARIFPIZZ WHERE NROPIZZ = :NROPIZZ;");
                $req->bindValue(":DESIGNPIZZ", $put_vars["DESIGNPIZZ"]);
                $req->bindValue(":TARIFPIZZ", $put_vars["TARIFPIZZ"]);
                $req->bindValue(":NROPIZZ", $put_vars["NROPIZZ"]);
                $req->execute();

                if ($req->rowCount()) echo json_encode(["success" => true]);
                else echo json_encode(["success" => false, "error" => "Vous n'êtes pas propriétaire"]);
                break;

            case "DELETE":
                if (!isset($_POST["NROPIZZ"]) || empty(trim($_POST["NROPIZZ"]))) {
                    echo json_encode(["success" => false, "error" => "Id manquant"]);
                    die;
                }

                $req = $db->prepare("DELETE FROM pizza WHERE NROPIZZ = ?");
                $req->execute([$_POST["NROPIZZ"]]);

                if ($req->rowCount()) echo json_encode(["success" => true]);
                else echo json_encode(["success" => false, "error" => "Vous n'êtes pas propriétaire"]);
                break;

            default:
                echo json_encode(["success" => false, "error" => "Choix non valide"]);
                break;
        }
        break;

    default:
        echo json_encode(["success" => false, "error" => "Ce choix n'existe pas"]);
        break;
}
?>
