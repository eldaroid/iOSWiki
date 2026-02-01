## VIP

#### VIP vs [VIPER](./VIPER.md)

VIP and VIPER have the same basic components, but the data flow is different. Although VIP follows a unidirectional approach (однополярный роутер), VIPER has a bidirectional (двуполярный презентер) flow that starts with the presenter.

In VIPER, the presenter directs data between the view and the interactor. The view and interactor don’t talk with each other.

![Viper vs VIP](https://github.com/eldaroid/pictures/blob/master/iOSWiki/DesignPatterns/vip_vs_viper.png?raw=true)

---

[MVVM UIPattern Theme](./MVVM.mdd) | [Back To iOSWiki Contents](https://github.com/eldaroid/iOSWiki) | [VIPER Theme](./VIPER.md)
