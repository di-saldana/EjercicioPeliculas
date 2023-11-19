//
//  DetailViewController.swift
//  ejercicio_peliculas
//
//  Created by Dianelys Saldaña on 11/17/23.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet weak var etiqueta: UILabel!
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var descripcion: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didChangePelicula(with p: Pelicula) {
//        etiqueta.text = p.titulo
        self.imagen.image = UIImage(named: p.caratula)
        self.titulo.text = p.titulo
        self.fecha.text = p.fecha
        self.descripcion.text = p.descripcion
    }
    
    override func viewWillLayoutSubviews() {
        if view.bounds.size.width >= view.bounds.size.height {
            self.stackView.axis = .horizontal
        }
        else {
            self.stackView.axis = .vertical
        }
    }


}
