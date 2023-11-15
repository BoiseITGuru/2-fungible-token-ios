import ExampleToken from "../contracts/ExampleToken.cdc"
import FungibleToken from "../contracts/utility/FungibleToken.cdc"

transaction(recipient: Address, amount: UFix64) {
    let SenderVault: &ExampleToken.Vault
    let ReceiverVault: &ExampleToken.Vault{FungibleToken.Receiver}

    prepare(signer: AuthAccount) {
        // Get a reference to the signer's stored vault
        self.SenderVault = signer.borrow<&ExampleToken.Vault>(from: ExampleToken.VaultStoragePath)
			?? panic("Could not borrow reference to the owner's Vault!")

        self.ReceiverVault = getAccount(recipient).getCapability(ExampleToken.VaultReceiverPath)
                                .borrow<&ExampleToken.Vault{FungibleToken.Receiver}>()
                                ?? panic("The recipient does not have an ExampleToken Vault set up.")
    }

    execute {
        let vault: @FungibleToken.Vault <- self.SenderVault.withdraw(amount: amount)
        // Deposit the withdrawn tokens in the recipient's receiver
        self.ReceiverVault.deposit(from: <- vault)
    }
}