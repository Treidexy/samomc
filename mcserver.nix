{ pkgs, ... }:

{
  networking.firewall.allowedUDPPorts = [ 19132 ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers.main = {
      enable = true;
      jvmOpts = "-Xms8888M -Xmx8888M --add-modules=jdk.incubator.vector -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=50 -XX:G1HeapRegionSize=16M -XX:G1ReservePercent=15";
      package = pkgs.fabricServers.fabric-26_3.override {
        loaderVersion = "0.19.5";
        jre_headless = pkgs.openjdk25_headless;
      };

      serverProperties = {
        server-port = 25565;
        motd = "Welcome to the Samohi SMP";
        difficulty = 3;
        max-players = 67;
        enforce-secure-profile = false;
        sync-chunk-writes = false;
        max-chained-neighbor-updates = 10000;
        simulation-distance = 8;
      };

    symlinks = {
        "mods/Fabric-API.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/bNnaTiuM/fabric-api-0.161.0%2B26.3.jar";
          sha256 = "19jpnq581bfnli8mk6zkv10p7yljknkykkx4hmx8ik6fldw63wc6";
        };
      };
    };
  };
}
