import UIKit

class ViewController: UIViewController {
    let client = PokeDexClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.requestPokeDex(
            success: { [self] pokeDex in
                let _ = pokeDex.results.map {
                    client.requestPokemon(
                        pokemonURL: $0.url) {
                        print($0.id)
                    } failure: { (_, _, error) in
                        print(error.localizedDescription)
                    }
                }
            }, failure: { (_, _, error) in
                print(error.localizedDescription)
            }
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
