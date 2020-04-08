//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Abdalfattah Altaeb on 4/8/20.
//  Copyright © 2020 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

        // MARK: Properties

        var history: [RPSMatch]!

        // MARK: Outlet

        @IBOutlet weak var tableView: UITableView!

        // MARK: Table View Delegate

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return history.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let CellID = "HistoryCell"

            let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)

            let match = self.history[(indexPath as NSIndexPath).row]

            cell.textLabel!.text = victoryStatusDescription(match)
            cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"

            return cell
        }

        func victoryStatusDescription(_ match: RPSMatch) -> String {

            if (match.p1 == match.p2) {
                return "Tie."
            } else if (match.p1.defeats(match.p2)) {
                return "Win!"
            } else {
                return "Loss."
            }
        }

        // MARK: Actions

        @IBAction func dismissHistory(_ sender: AnyObject) {
            self.dismiss(animated: true, completion: nil)
        }
    }


