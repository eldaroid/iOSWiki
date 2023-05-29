## VIPER

![viper](https://github.com/eldaroid/pictures/blob/master/iOSWiki/DesignPatterns/viper.png?raw=true)

* "V", View: displays what it is told to by the Presenter and relays user input back to the Presenter.

* "I", Interactor: contains the business logic as specified by a use case.

* "P", Presenter: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).

* "E", Entity: contains basic model objects used by the Interactor.

* "R", Routing: contains navigation logic for describing which screens are shown in which order.


#### [VIP](./VIP.md) vs VIPER

Разница между VIP и VIPER - полярность. VIP - однополярный роутер. VIPER - двух полярный роутер.

![Viper vs VIP](https://github.com/eldaroid/pictures/blob/master/iOSWiki/DesignPatterns/vip_vs_viper.png?raw=true)
