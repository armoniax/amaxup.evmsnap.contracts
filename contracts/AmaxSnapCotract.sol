// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

/// @title AMAX Snap Connect metamask
contract AmaxSnapContract is
    Initializable,
    PausableUpgradeable,
    OwnableUpgradeable,
    UUPSUpgradeable
{
    // evm from account => amax public key => amax account name
    mapping(address => mapping(string => string)) private _bindAmaxs;

    // amax public key => bool
    mapping(string => bool) private _amaxPublicKeys;

    /// @notice bind amax data
    /// @param from - evm from account / 0xabc
    /// @param amax_pubkey - amax public key / AM prefix 52 length
    /// @param amax_acct - amax account name / 12 length
    event BindAmax(address indexed from, string amax_pubkey, string amax_acct);

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Pausable_init();
        __Ownable_init();
        __UUPSUpgradeable_init();
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}

    /// @notice Bind amax account data use metamask
    /// @param amax_pubkey - amax public key / AM prefix 52 length
    /// @param amax_acct - amax account name / 12 length
    /// @return bool - true is success
    function bind_amax(
        string calldata amax_pubkey,
        string calldata amax_acct
    ) public whenNotPaused returns (bool) {
        require(bytes(amax_pubkey).length == 52, "Invalid AMAX publick key");
        require(bytes(amax_acct).length == 12, "Invalid AMAX account");

        require(
            !_amaxPublicKeys[amax_pubkey],
            "AMAX publick key already binded"
        );

        bytes memory _amax_acct = bytes(_bindAmaxs[msg.sender][amax_pubkey]);
        require(_amax_acct.length == 0, "AMAX account already exists");

        _amaxPublicKeys[amax_pubkey] = true;
        _bindAmaxs[msg.sender][amax_pubkey] = amax_acct;
        emit BindAmax(msg.sender, amax_pubkey, amax_acct);

        return true;
    }

    /// @notice Bound amax account
    /// @param from - evm from account
    /// @param amax_pubkey - amax public key / AM prefix 52 length
    /// @return string - amax account name / 12 length
    function bound_amax(
        address from,
        string calldata amax_pubkey
    ) public view returns (string memory) {
        return _bindAmaxs[from][amax_pubkey];
    }
}
