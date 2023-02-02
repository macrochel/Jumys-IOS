import UIKit

class ribbon: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    var list = [CompanyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
    }
    
    func initList(){
        let company1 = CompanyData(" от 100 000KZT", "Промоутер", "„ТОО АянКафе“", "Громко и четко здороваться с людьми, рассказывать о кофейне.")
        let company2 = CompanyData("5 000KZT", "Смена вечернего грузчика", "„ИП АЯН“", "Иметь физически развитое телосложение, быть ответственным и пунктуальным")
        let company3 = CompanyData(" от 25KZT", "Сборщик заказов", "ТОО „Magnum E-commerce“", "Оплата труда ежедневно на карту - 25тг с каждой собранной позиции. Обязанности: Необходимо будет собирать товары по списку на складе")
        let company4 = CompanyData(" от 64 000KZT", "Кухарка", "ТОО „АянКафе“", "Работать в заведении с 9:00 по 21:00, мыть посуду и кухонные пренадлежности")
        let company5 = CompanyData("от 280 000KZT", "Начинающий тайный покупатель", "„ТОО ДоДо“", "Сотрудничество с проверенной компанией. Ходить по городу и фотографировать улицы и заведения. Собирать данные о магазинах, кафе, супермаркетах, ателье. Приветствуется на позициях: тайный покупатель, специалист по сбору геоданных, подработка, еженедельная оплата")
        let company6 = CompanyData("300 000 - 600 000KZT", "Курьер", "„ТОО GARCOM“", "Доставка небольших посылок. (документы, цветы, и т.д.) График доставок вы выбираете самостоятельно. Выполнение заказов через приложение.")
        
        list.append(company1)
        list.append(company2)
        list.append(company3)
        list.append(company4)
        list.append(company5)
        list.append(company6)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellID") as! TableViewCell
        let thisShape = list[indexPath.row]
        tableViewCell.place.text = thisShape.place
        tableViewCell.cost.text = thisShape.cost
        tableViewCell.company.text = thisShape.name
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "detailSegue")
        {
            let indexPath = self.table.indexPathForSelectedRow!
            
            let tableViewDetail = segue.destination as? RibonDetail
            
            let selectedShape = list[indexPath.row]
            
            tableViewDetail!.ex = selectedShape
            
            self.table.deselectRow(at: indexPath, animated: true)
        }
    }
    

    
}
