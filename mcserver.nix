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
        "mods/Lithium.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/WXHRsMRl/lithium-fabric-0.26.1%2Bmc26.3.jar";
          sha256 = "05c0s42k4laaw24gjl1dq53r2g8rn9mlkv80fpv758qdqjby3r9l";
        };
        "mods/FerriteCore.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
          sha256 = "08mzwryxphh1g0p6r5xravzh38zvcsl2isrb773sqryr5v3ncf91";
        };
        # "mods/Krypton.jar" = pkgs.fetchurl {
        #   url = "asdsfjsdkljhflsdhiofhgoiedrshgoihsuihgjsdhifhdoishfoiahsoifhasoihfoiashfoihasoifhoasihfioahsfoih";
        #   sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        # };
        "mods/VMP.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/wnEe9KBa/versions/2TFDVjDf/vmp-fabric-mc26.3-0.2.0%2Bbeta.7.238-all.jar";
          sha256 = "02lsd0jr4ki98nyr3a1wf4da0x921kjh9b6iw5xjw12q6jad4dnd";
        };
        "mods/C2ME.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/VSNURh3q/versions/sSoXjAqP/c2me-fabric-mc26.3-0.4.2-alpha.0.88.jar";
          sha256 = "1739pr98wmqv3bgyrrhfzjnv5zxw43bixkrr7s3hqdqxy01xlsbs";
        };
        "mods/PacketFixer.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/c7m1mi73/versions/dTKbGYbb/PacketFixer-fabric-3.3.6.jar";
          sha256 = "1ghp3ysahmz186ql9wa45wqpl4c5vjck02lwc6i1w5c1x2fyz7ki";
        };
        "mods/ZConfig.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/4qmvXRB9/versions/tsgt79sG/zconfig-1.0.0%2B26.x.jar";
          sha256 = "1s7bcnkk9kfag9075q022fnv9rfw1ivh1i532avbr5f4bjim30dl";
        };
        "mods/ZFastNoise.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/OnlVIpq5/versions/bjeF0iDC/zfastnoise-1.1.0-beta.5%2B26.3.jar";
          sha256 = "0zahi3y5913d74vihf0zbrfblvws2n9h5v2j43757lisdh5agb44";
        };
        # "mods/DisablePortalChecks.jar" = pkgs.fetchurl {
        #   url = "wsxeredctfvyghbujnkmasdfghjklkjhgfdfghmvfhafoijeoifjhoisheuifhidshfiuvhsoihgfoiehsoighoisehgoisheoighseio";
        #   sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        # };
        "mods/RailOptimization.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/QSvN5pBU/versions/QQzYehRo/railoptimization-2.0%2Bmc26.1.2-fabric.jar";
          sha256 = "067vg8d8i9z2vd7l5kmr9dn7s98bk40sy0ibbpcb8mb12kafmbmk";
        };
        "mods/Spark.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/l6YH9Als/versions/e3hsPc1o/spark-1.10.187-fabric.jar";
          sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        };
        "mods/QuickPack.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/pSISfJ4O/versions/KS7gwK5P/quick-pack-fabric-1.5.0%2B26.3.jar";
          sha256 = "0qrpgj93wapycszxnb6y30187miv6wam6mip6zg19813zlgk2vi2";
        };
        "mods/Geyser.jar" = pkgs.fetchurl {
          url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/fabric";
          sha256 = "11rcbf1zakk16ci29s83j6nlxqiadx90ixsyg6dz0va876liaf1v";
        };
        "mods/Floodgate.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/bWrNNfkb/versions/m9eO07Zi/Floodgate-Fabric-2.2.7-b69.jar";
          sha256 = "1g90izick45cx8v15qa3d2vw4zam9ch4m11r453f0k3k0ccbfiz6";
        };
        "mods/LuckPerms.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/Vebnzrzj/versions/DzQPkkXY/LuckPerms-Fabric-5.5.85.jar";
          sha256 = "0jfzwbmws2alybhrr479janfrm8fa02sjs5wv0infgx8jp5qyn8q";
        };
        "mods/BlossomLib.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/Xw7lTsbM/versions/BEMYFwoI/blossom-lib-2.6.1%2B26.3.jar";
          sha256 = "0knkmvh3mf1d3xswksqqhw134al4lbhrgz88iwzgn93x1cyxg375";
        };
        "mods/BlossomTpa.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/Y25EUH1s/versions/iOzIRqSt/blossom-tpa-2.2.15%2B26.3.jar";
          sha256 = "1nmvcfqsb20lqgdjfg801fl3kmmhslynw2f38r1cpcnm0hb1jbph";
        };
        "mods/BlossomBack.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/tHwJbPJm/versions/Dj7Bfr7c/blossom-back-2.1.15%2B26.3.jar";
          sha256 = "1q2m41pjvxdjjfb1455akh1isicnmlg2fs0hfvmfafqxh9lbh6cq";
        };
        "mods/BlossomPVP.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/IpAUX4Rv/versions/vqwfbOZg/blossom-pvp-2.0.14%2B26.3.jar";
          sha256 = "07mf1mb773pz8n5h3figrdvsxqkl6wpzj211yvm7h7ks7wlzkczh";
        };
        # "mods/SimplePlayerTrades.jar" = pkgs.fetchurl {
        #   url = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
        #   sha256 = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
        # };
      };
    };
  };
}
