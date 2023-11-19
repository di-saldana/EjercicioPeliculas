//
//  TableViewController.swift
//  ejercicio_peliculas
//
//  Created by Dianelys Saldaña on 11/17/23.
//

import UIKit

class TableViewController: UITableViewController {
    
//    let contenido = ["Uno","dos","tres"]
    
    var peliculas = [Pelicula]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        crearPeliculas()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel!.text = peliculas[indexPath.row].titulo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let pelicula = self.peliculas[indexPath.row]

            // Conexión con el controlador detalle
            let detailViewController = splitViewController!.viewController(for: .secondary) as? DetailViewController
            
            //  detailViewController?.etiqueta.text = pelicula
            detailViewController?.didChangePelicula(with: pelicula)

            
            // Si el controlador detalle no está presentado lo mostramos
            if !detailViewController!.isBeingPresented {
                splitViewController!.showDetailViewController(detailViewController!, sender: self)
            }
        }
    }

    func crearPeliculas() {
        let sentidoDeLaVida = Pelicula(titulo: "El sentido de la vida", caratula: "sentido.jpg", fecha: "1983", descripcion: "Conjunto de episodios que muestran de forma disparatada los momentos más importantes del ciclo de la vida. Desde el nacimiento a la muerte, pasando por asuntos como la filosofía, la historia o la medicina, todo tratado con el inconfundible humor de los populares cómicos ingleses. El prólogo es un cortometraje independiente rodado por Terry Gilliam: Seguros permanentes Crimson.")

        self.peliculas.append(sentidoDeLaVida)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
