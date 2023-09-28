import { ethers, upgrades } from "hardhat"

async function main() {
    // Deploying
    const AmaxSnapContract = await ethers.getContractFactory("AmaxSnapContract")
    console.log("Deploying AmaxSnapContract...")

    const instance = await upgrades.deployProxy(
        AmaxSnapContract, [],
        {
            initializer: "initialize",
            kind: "uups",
        }
    )
    await instance.waitForDeployment();
    console.log("Deploying Proxy deployed address", await instance.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exitCode = 1
    })
