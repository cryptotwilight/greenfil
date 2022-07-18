// SPDX-License-Identifier: GPL-3.0
// Cryptotwilight Poroductions 
pragma solidity ^0.8.15;



interface IGreenFil { 

    function getHeadlineStat() view external returns (uint256 _totalGreenNodes, 
                                                        uint256 _totalIdentifiedNodes, 
                                                        uint256 _totalUnknownNodes, 
                                                        uint256 _totalUniqueSellers,                                                         
                                                        uint256 _totalCountries, 
                                                        string memory _sourceData, 
                                                        uint256 _postTime);

    function getContractPurchasesByCountry() view external returns (string [] memory _countries, 
                                                                    uint256 [] memory _totalPurchases, 
                                                                    uint256 _totalAllPurchases, 
                                                                    string memory _sourceData,  
                                                                    uint256 _postTime );

    function getRenewableSourceEnergyUsage() view external returns (string [] memory _energySources, 
                                                                    uint256 [] memory _nodeCount, 
                                                                    uint256 _totalNodes, 
                                                                    string memory _sourceData,  
                                                                    uint256 _postTime);

    function getRenewableEnergySourceContribution() view external returns (string [] memory _energySources, 
                                                                           uint256 [] memory _mwH, 
                                                                           uint256 _totalMwh, 
                                                                           string memory _sourceData, 
                                                                           uint256 _postTime);

    function findGreenSPs(string memory geography, string memory greenEnergyType, bool _purchasesOnly) view external returns (string [] memory _nodes, 
                                                                                                                              string [] memory _geographies, 
                                                                                                                              uint256 [] memory _purchaseCounts, 
                                                                                                                              string [] memory _energySources, 
                                                                                                                              uint256 [] memory _mwhFullAmounts, 
                                                                                                                              uint256 [] memory _mwhDeliveredAmounts, 
                                                                                                                              string memory _sourceData, 
                                                                                                                              uint256 _postTime);

    function getGreenNodeConcentrationByLocation() view external returns (string [] memory _locations, 
                                                                          uint256 [] memory _nodeCounts, 
                                                                          uint256 _totalNodes, 
                                                                          string memory _sourceData, 
                                                                          uint256 _postTime );                                                                                                            

    function getSourceData(uint256 _postTime, string memory _function) view external returns (string memory _ipfsHash);

}