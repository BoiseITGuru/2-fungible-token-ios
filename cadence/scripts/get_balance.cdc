// This script reads the balance field of an account's FlowToken Balance
import ExampleToken from "../contracts/ExampleToken.cdc"
import FungibleToken from "../contracts/utility/FungibleToken.cdc"

pub fun main(account: Address): UFix64 {
    let vaultRef = getAccount(account).getCapability(ExampleToken.VaultBalancePath)
                    .borrow<&ExampleToken.Vault{FungibleToken.Balance}>()
                    ?? panic("Could not borrow Balance reference to the Vault")

    return vaultRef.balance
}