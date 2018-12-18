# CodeStyle





* 需要 interface 的地方
  * 原则上外层逻辑不写（RpcHandler/Controller/Consumer）
  * 可能被别人调用的内层逻辑都写（Logic/Service/Storage）