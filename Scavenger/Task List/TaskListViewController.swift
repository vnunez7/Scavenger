//
//  ViewController.swift
//  Scavenger
//
//  Created by Victoria Nunez on 3/25/23.
//

import UIKit

class TaskListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyStateLabel: UIImageView!
    
    var tasks = [Task]() {
        didSet {
            emptyStateLabel.isHidden = !tasks.isEmpty
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = UIView()

        tableView.dataSource = self

        tasks = Task.mockedTasks
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                let task = tasks[selectedIndexPath.row]

                detailViewController.task = task
            }
        }
    }
}

extension TaskListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
}


