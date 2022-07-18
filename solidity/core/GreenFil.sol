// SPDX-License-Identifier: GPL-3.0
// Cryptotwilight Productions
pragma solidity ^0.8.15;

import "../interfaces/IGreenFil.sol";

contract GreenFil is IGreenFil { 

    address administrator; 

    string headlineStats = "HEADLINE_STATS"; 
    string contractPurchasesByCountry = "CONTRACT_PURCHASE_BY_COUNTRY"; 
    string renewableSoureceEnergyUsage = "RENEWABLE_SOURCE_ENERGY_USAGE"; 
    string renewableEnergySourceContribution = "RENEWABLE_ENERGY_SOURCE_CONTRIBUTION"; 
    string greenNodeConcentrationByLocation = "GREEN_NODE_CONCENTRATION_BY_LOCATION";


    mapping(uint256=>mapping(string=>string)) sourceDataByFunctionByPostTime; 

    mapping(string=>uint256[]) latestPostTimeByFunction; 

    struct HeadlineStats{ 
        uint256 totalGreenNodes;
        uint256 totalIdentifiedNodes;
        uint256 totalUnknownNodes; 
        uint256 totalUniqueSellers; 
        uint256 totalCountries; 
        string sourceData; 
        uint256 postTime;
    }
    mapping(uint256=>HeadlineStats) headlineStatByPostTime; 

    struct ContractPurchasesByCountry { 
        string [] countries;
        uint256 [] totalPurchases;
        uint256 totalAllPurchases; 
        string sourceData;
        uint256 postTime;
    }

    mapping(uint256=>ContractPurchasesByCountry) contractPurchasesByCountryByPostTime; 

    struct RenewableSourceEnergyUsage {
            string [] energySources; 
            uint256 [] nodeCount;
            uint256 totalNodes; 
            string sourceData;
            uint256 postTime;
    }
    mapping(uint256=>RenewableSourceEnergyUsage) renewableSourceEnergyUsageByPostTime;

    struct RenewableEnergySourceContribution{
        string [] energySources;
        uint256 [] mwH; 
        uint256 totalMwh;
        string sourceData; 
        uint256 postTime;
    }
    mapping(uint256=>RenewableEnergySourceContribution) renewableEnergySourceContributionByPostTime; 

    struct GreenNodeConcentrationByLocation {
        string [] locations; 
        uint256 [] nodeCounts; 
        uint256 totalNodes; 
        string sourceData; 
        uint256 postTime;
    }
    mapping(uint256=>GreenNodeConcentrationByLocation) greenNodeConcentrationByLocationByPostTime; 

    constructor(address _administrator) {
        administrator = _administrator; 
    } 
     

    function getHeadlineStat() view external returns (uint256 _totalGreenNodes, 
                                                        uint256 _totalIdentifiedNodes, 
                                                        uint256 _totalUnknownNodes, 
                                                        uint256 _totalUniqueSellers, 
                                                        uint256 _totalCountries, 
                                                        string memory _sourceData, 
                                                        uint256 _postTime){
        uint256 latestIndex_ = latestPostTimeByFunction[headlineStats].length-1;
        _postTime = latestPostTimeByFunction[headlineStats][latestIndex_];
        HeadlineStats memory h_ = headlineStatByPostTime[_postTime];
        return (h_.totalGreenNodes, h_.totalIdentifiedNodes, h_.totalUnknownNodes, h_.totalUniqueSellers, h_.totalCountries, h_.sourceData,  _postTime);
    }

    function getContractPurchasesByCountry() view external returns (string [] memory _countries, 
                                                                    uint256 [] memory _totalPurchases, 
                                                                    uint256 _totalAllPurchases, 
                                                                    string memory _sourceData, 
                                                                    uint256 _postTime ){
        uint256 latestIndex_ = latestPostTimeByFunction[contractPurchasesByCountry].length-1;
        _postTime = latestPostTimeByFunction[contractPurchasesByCountry][latestIndex_];
        ContractPurchasesByCountry memory c_ = contractPurchasesByCountryByPostTime[_postTime];
        return (c_.countries, c_.totalPurchases, c_.totalAllPurchases, c_.sourceData, _postTime);
    }

    function getRenewableSourceEnergyUsage() view external returns (string [] memory _energySources, 
                                                                    uint256 [] memory _nodeCount, 
                                                                    uint256 _totalNodes, 
                                                                    string memory _sourceData, 
                                                                    uint256 _postTime){

        uint256 latestIndex_ = latestPostTimeByFunction[renewableSoureceEnergyUsage].length-1;
        _postTime = latestPostTimeByFunction[renewableSoureceEnergyUsage][latestIndex_];
        RenewableSourceEnergyUsage memory r_ = renewableSourceEnergyUsageByPostTime[_postTime];
        return (r_.energySources, r_.nodeCount, r_.totalNodes, r_.sourceData, _postTime);
    }

    function getRenewableEnergySourceContribution() view external returns (string [] memory _energySources, 
                                                                            uint256 [] memory _mwH, 
                                                                            uint256 _totalMwh,
                                                                            string memory _sourceData, 
                                                                            uint256 _postTime){
        uint256 latestIndex_ = latestPostTimeByFunction[renewableEnergySourceContribution].length-1;
        _postTime = latestPostTimeByFunction[renewableEnergySourceContribution][latestIndex_];
        RenewableEnergySourceContribution memory r_ = renewableEnergySourceContributionByPostTime[_postTime];
        return (r_.energySources, r_.mwH, r_.totalMwh, r_.sourceData, _postTime);
    }


    function getGreenNodeConcentrationByLocation() view external returns (string [] memory _locations, 
                                                                            uint256 [] memory _nodeCounts, 
                                                                                uint256 _totalNodes, 
                                                                                    string memory _sourceData, 
                                                                                    uint256 _postTime ){
        uint256 latestIndex_ = latestPostTimeByFunction[greenNodeConcentrationByLocation].length-1;
        _postTime = latestPostTimeByFunction[greenNodeConcentrationByLocation][latestIndex_];
        GreenNodeConcentrationByLocation memory g_ = greenNodeConcentrationByLocationByPostTime[_postTime];
        return (g_.locations, g_.nodeCounts, g_.totalNodes, g_.sourceData, _postTime);

    }   


    mapping(string=>uint256[]) postTimesByGeography; 
    mapping(string=>mapping(uint256=>string[])) energySourcesByPostTimeByGeography; 


    function findGreenSPs(string memory geography, string memory greenEnergyType, bool _purchasesOnly) view external returns (string [] memory _nodes, 
                                                                                                                              string [] memory _geographies, 
                                                                                                                              uint256 [] memory _purchaseCounts, 
                                                                                                                              string [] memory _energySources, 
                                                                                                                              uint256 [] memory _mwhFullAmounts, 
                                                                                                                              uint256 [] memory _mwhDeliveredAmounts, 
                                                                                                                              string memory _sourceData, 
                                                                                                                              uint256 _postTime){

    }
                                                                                                      

    function getSourceData(uint256 _postTime, string memory _function) view external returns (string memory _ipfsHash){
        return sourceDataByFunctionByPostTime[_postTime][_function];
    }



    function postHeadlineStat(uint256 _totalGreenNodes, 
                                uint256 _totalIdentifiedNodes, 
                                uint256 _totalUnknownNodes, 
                                uint256 _totalUniqueSellers, 
                                uint256 _totalCountries, 
                                string memory _ipfsHash, 
                                uint256 _postTime) external returns (bool){
        HeadlineStats memory h = HeadlineStats({
                                            totalGreenNodes : _totalGreenNodes,
                                            totalIdentifiedNodes :  _totalIdentifiedNodes,
                                            totalUnknownNodes : _totalUnknownNodes,
                                            totalUniqueSellers : _totalUniqueSellers, 
                                            totalCountries : _totalCountries,
                                            sourceData : _ipfsHash, 
                                            postTime : _postTime
                                        });
        headlineStatByPostTime[_postTime] = h; 
        latestPostTimeByFunction[headlineStats].push(_postTime);
        sourceDataByFunctionByPostTime[_postTime][headlineStats];
        return true; 
    }

    function postContractPurchasesByCountry(string [] memory _countries, uint256 [] memory _totalPurchases, uint256 _totalAllPurchases, string memory _ipfsHash,  uint256 _postTime ) external returns (bool){
        ContractPurchasesByCountry memory c = ContractPurchasesByCountry ({ 
                                                            countries : _countries, 
                                                            totalPurchases : _totalPurchases,
                                                            totalAllPurchases :  _totalAllPurchases, 
                                                            sourceData : _ipfsHash, 
                                                            postTime : _postTime
                                                        });
        contractPurchasesByCountryByPostTime[_postTime] = c; 
        latestPostTimeByFunction[contractPurchasesByCountry].push(_postTime);
        sourceDataByFunctionByPostTime[_postTime][contractPurchasesByCountry];
        return true; 
    }

    function postRenewableSourceEnergyUsage(string [] memory _energySources, uint256 [] memory _nodeCount, uint256 _totalNodes, string memory _ipfsHash, uint256 _postTime) external returns (bool){
        RenewableSourceEnergyUsage memory r = RenewableSourceEnergyUsage({
                                                                    energySources :_energySources, 
                                                                    nodeCount : _nodeCount, 
                                                                    totalNodes : _totalNodes, 
                                                                    sourceData : _ipfsHash, 
                                                                    postTime : _postTime
                                                            });
        renewableSourceEnergyUsageByPostTime[_postTime]  = r;                                                         
        latestPostTimeByFunction[renewableSoureceEnergyUsage].push(_postTime);
        sourceDataByFunctionByPostTime[_postTime][renewableSoureceEnergyUsage];
        return true; 
    }

    function postRenewableEnergySourceContribution(string [] memory _energySources, uint256 [] memory _mwH, uint256 _totalMwh, string memory _ipfsHash, uint256 _postTime) external returns (bool){
        RenewableEnergySourceContribution memory rc_ = RenewableEnergySourceContribution({
                                                                            energySources : _energySources,
                                                                            mwH : _mwH, 
                                                                            totalMwh : _totalMwh,
                                                                            sourceData : _ipfsHash, 
                                                                            postTime : 
                                                                            _postTime
                                                                        });
        renewableEnergySourceContributionByPostTime[_postTime] = rc_; 
        latestPostTimeByFunction[renewableEnergySourceContribution].push(_postTime);
        sourceDataByFunctionByPostTime[_postTime][renewableEnergySourceContribution];
        return true; 
    }

    function posttGreenNodeConcentrationByLocation( string [] memory _locations, 
                                                    uint256 [] memory _nodeCounts, 
                                                    uint256 _totalNodes, 
                                                    string memory _sourceData, 
                                                    uint256 _postTime) external returns (bool) {
        GreenNodeConcentrationByLocation memory g_ = GreenNodeConcentrationByLocation ({
                                                                                locations : _locations,
                                                                                nodeCounts : _nodeCounts,
                                                                                totalNodes : _totalNodes, 
                                                                                sourceData : _sourceData,
                                                                                postTime : _postTime
                                                                            });
        greenNodeConcentrationByLocationByPostTime[_postTime] = g_; 
        latestPostTimeByFunction[greenNodeConcentrationByLocation].push(_postTime);
        sourceDataByFunctionByPostTime[_postTime][greenNodeConcentrationByLocation];
        return true; 
    }


}
