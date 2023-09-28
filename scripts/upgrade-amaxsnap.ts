import { ethers, upgrades } from "hardhat"

async function main() {
    const proxyAddress = "0xFaDd993D019aBeF320D69269eE447F2bF9966d3E"

    const AmaxSnapContract = await ethers.getContractFactory("AmaxSnapContract")
    console.log("AmaxSnapContract upgrade...")
    const amaxSnapContract = await upgrades.upgradeProxy(
        proxyAddress,
        AmaxSnapContract
    )
    console.log("AmaxSnapContract at:", amaxSnapContract.getAddress())
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
