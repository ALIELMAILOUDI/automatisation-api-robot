import json
from jsonschema import validate

class MaBibliothequePerso:

    def valider_le_schema_de_l_article(self, reponse_api):
        """
        Valide que la réponse de l'API pour un article correspond au schéma attendu.
        """
        schema_article = {
            "type": "object",
            "properties": {
                "id": {"type": "number"},
                "userId": {"type": "number"},
                "title": {"type": "string"},
                "body": {"type": "string"},
            },
            "required": ["id", "userId", "title", "body"]
        }

        # La réponse peut être une chaîne de caractères JSON, il faut la convertir
        if isinstance(reponse_api, str):
            reponse_api = json.loads(reponse_api)

        try:
            validate(instance=reponse_api, schema=schema_article)
            print("La validation du schéma a réussi.")
        except Exception as e:
            raise AssertionError(f"La validation du schéma a échoué: {e}")