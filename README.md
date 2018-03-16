# blockchain-scorestore
blockchain-scorestore: game scores

#powershell 01:
    testrpc

#powershell 02:
    truffle compile
    truffle migrate
    truffle console
        var ss
        ScoreStore.deployed().then(function(deployed){ ss=deployed; });
        ss.AddPersonScore("David Beckham", 7)
        ss.GetScore.call("David Beckham")
