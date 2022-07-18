iGreenFilAbi = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "geography",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "greenEnergyType",
				"type": "string"
			},
			{
				"internalType": "bool",
				"name": "_purchasesOnly",
				"type": "bool"
			}
		],
		"name": "findGreenSPs",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_nodes",
				"type": "string[]"
			},
			{
				"internalType": "string[]",
				"name": "_geographies",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_purchaseCounts",
				"type": "uint256[]"
			},
			{
				"internalType": "string[]",
				"name": "_energySources",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_mwhFullAmounts",
				"type": "uint256[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_mwhDeliveredAmounts",
				"type": "uint256[]"
			},
			{
				"internalType": "string",
				"name": "_sourceData",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getContractPurchasesByCountry",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_countries",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_totalPurchases",
				"type": "uint256[]"
			},
			{
				"internalType": "uint256",
				"name": "_totalAllPurchases",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_sourceData",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getGreenNodeConcentrationByLocation",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_locations",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_nodeCounts",
				"type": "uint256[]"
			},
			{
				"internalType": "uint256",
				"name": "_totalNodes",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getHeadlineStat",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "_totalGreenNodes",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_totalIdentifiedNodes",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_totalUnknownNodes",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_totalUniqueSellers",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_sourceData",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_totalCountries",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getRenewableEnergySourceContribution",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "energySources",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_mwH",
				"type": "uint256[]"
			},
			{
				"internalType": "uint256",
				"name": "_totalMwh",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_sourceData",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getRenewableSourceEnergyUsage",
		"outputs": [
			{
				"internalType": "string[]",
				"name": "_energySources",
				"type": "string[]"
			},
			{
				"internalType": "uint256[]",
				"name": "_nodeCount",
				"type": "uint256[]"
			},
			{
				"internalType": "uint256",
				"name": "_totalNodes",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_sourceData",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_postTime",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_function",
				"type": "string"
			}
		],
		"name": "getSourceData",
		"outputs": [
			{
				"internalType": "string",
				"name": "_ipfsHash",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]