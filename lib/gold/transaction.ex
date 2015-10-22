defmodule Gold.Transaction do

  defstruct [:account, 
             :address, 
             :category,
             :amount, 
             :vout, 
             :fee, 
             :confirmations,
             :blockhash,
             :blockindex,
             :txid,
             :time,
             :timereceived,
             :comment,
             :otheraccount]

  def from_json(tx) do    
    %Gold.Transaction{
      account:       Map.fetch!(tx, "account"), 
      address:       Map.fetch!(tx, "address"),
      category:      String.to_atom(Map.fetch!(tx, "category")),                       
      amount:        Gold.btc_to_decimal(Map.fetch!(tx, "amount")),
      vout:          Map.fetch!(tx, "vout"),
      fee:           Gold.btc_to_decimal(Map.get(tx, "fee", nil)),
      confirmations: Map.fetch!(tx, "confirmations"),

      blockhash:     Map.fetch!(tx, "blockhash"),
      blockindex:    Map.fetch!(tx, "blockindex"),
      txid:          Map.fetch!(tx, "txid"),

      time:          Map.fetch!(tx, "time"),
      timereceived:  Map.fetch!(tx, "timereceived"),
      comment:       Map.get(tx, "comment", nil),
      otheraccount:  Map.get(tx, "otheraccount", nil)

    }
  end
end
