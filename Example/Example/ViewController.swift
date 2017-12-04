//
//  ViewController.swift
//  Example
//
//  Created by Sanchew on 2017/12/4.
//  Copyright © 2017年 sanchew. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
// EventRectivable receive event in inside by cell
class ViewController: BaseViewController<RepoViewModel>, UITableViewDelegate, EventReceivable {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<String,Repo>>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func setupBindings() {
        super.setupBindings()
        dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Repo>>(configureCell: { (ds, tv, ip, repo) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: RepoCell.identifier, for: ip)
            cell.fill(by: repo)
            return cell
        })
        
        viewModel.datas.validMap {
            return [SectionModel<String,Repo>(model: "", items: $0)]
        }.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Repo.self).map{ RepoEvent.repo($0) }.bind(to: viewModel.eventReceiver).disposed(by: disposeBag)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RepoCell.height()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

