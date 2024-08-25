{
  config,
  pkgs,
  lib
}:{
  imports = [
    
  ];
  options = {
    EnableOldKernel = lib.mkOption{
      type = lib.types.enable;
      default = true;
      description = "Whether you want to use 5.10 kernel";
    }
  }
  config = lib.mkIf config.EnableOldKernel {
    boot.kernelPackages = pkgs.linuxKernel.kernels.linux_5_10;
  }
}
