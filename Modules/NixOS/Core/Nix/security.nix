{ pkgs, lib, config, userSettings, ... }:
{

 # // Enable doas & Disable sudo //
 security.doas.enable = true;
# security.sudo.enable = true;
# security.sudo.execWheelOnly = true;
  
   # // Configure doas //
    security.doas.extraRules = [{
     users = [ userSettings.username ]; # // Replace username with your username //
      groups = [ "wheel" ];
       keepEnv = true;
        persist = true;
}];

#security.tpm2.enable = true;
#security.tpm2.pkcs11.enable = true;  # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
#security.tpm2.tctiEnvironment.enable = true;  # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
}
