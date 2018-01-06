### l'Idée de l'application
HiddenChallengeCodeIOS consiste à implémenter une petite application répertoriant les dépôts(repository) Github les plus favoris créés au cours des 30 derniers jours.On récupérons  les données JSON triées directement à partir de l'API Github ( `https://api.github.com/search/repositories?q=created:>2017-10-22&sort=stars&order=desc`)

Pour savoir plus sur l'API Github cliquez  [here](https://developer.github.com/v3/search/#search-repositories
)..

### Les fonctionnalités
*	En tant qu'utilisateur, je devrais être en mesure de répertorier les dépôts Github les plus favoris créés au cours des 30 derniers jours.
*	En tant qu'utilisateur, je devrais voir les résultats sous forme de liste. Un référentiel par rangée.
*	En tant qu'utilisateur, je devrais être capable de voir pour chaque repo / ligne les détails suivants:
    *	Nom du référentiel
    *	Description du référentiel
    *	Nombre d'étoiles pour le repo.
    *	Nom d'utilisateur et avatar du propriétaire

### les outils 
*	Swift 3
*	Xcode 8.3.3

## ViewController 
![capture d ecran 2018-01-05 a 23 08 14](https://user-images.githubusercontent.com/34864394/34632486-9f94b180-f26d-11e7-843c-86be82a59916.png) 

![capture d ecran 2018-01-05 a 23 08 34](https://user-images.githubusercontent.com/34864394/34632489-9fcb4cf4-f26d-11e7-87a7-03ecb17da36d.png)

  
