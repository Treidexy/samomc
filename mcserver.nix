{ pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 19132 25565 ];
    allowedUDPPorts = [ 19132 25565 ];
  };

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
      restart = "always";
      # Gemini suggestion, didnt work
      # package = pkgs.symlinkJoin {
      #   name = "fabric-server-wrapped";
      #   paths = [ 
      #     (pkgs.fabricServers.fabric-26_3.override {
      #       loaderVersion = "0.19.5";
      #       jre_headless = pkgs.openjdk25_headless;
      #     })
      #   ];
      #   buildInputs = [ pkgs.makeWrapper ];
      #   meta.mainProgram = "fabric-server";
      #   postBuild = ''
      #     # Wrap the server startup binary/script to include OpenSSL libraries
      #     for bin in $out/bin/*; do
      #       if [ -f "$bin" ]; then
      #         wrapProgram "$bin" \
      #           --set LD_LIBRARY_PATH "${pkgs.lib.makeLibraryPath [ pkgs.openssl pkgs.stdenv.cc.cc.lib ]}"
      #       fi
      #     done
      #   '';
      # };

      serverProperties = {
        server-port = 25565;
        motd = "Samohi SMP!";
        difficulty = 3;
        max-players = 67;
        enforce-secure-profile = false;
        sync-chunk-writes = false;
        max-chained-neighbor-updates = 10000;
        simulation-distance = 8;
        white-list = true;
	      allow-flight = true;
      };

      symlinks = {
        "mods/Fabric-API.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/nJlcvFfj/fabric-api-0.165.2%2B26.3.jar";
          sha256 = "14n3g128knfm8vrwvs1fna66pqvdwq7x9fna2jd6v86slmwa04i6";
        };
        "mods/Carpet.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/yt9oDFOj/fabric-carpet-26.3%2Bv260915.jar";
          sha256 = "1yarfrzvzj2nm206lvn7din495vh24vq12bn84319nbyh0zbjh3w";
        };
        "mods/Lithium.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/fWv5bnZk/lithium-fabric-0.26.3%2Bmc26.3.jar";
          sha256 = "0y7w8hhm8la8qbpabxwvdfi0vgmi6czll9b5alaikw9j76mnlfqh";
        };
        "mods/FerriteCore.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/uXXizFIs/versions/d5ddUdiB/ferritecore-9.0.0-fabric.jar";
          sha256 = "08mzwryxphh1g0p6r5xravzh38zvcsl2isrb773sqryr5v3ncf91";
        };
        "mods/Krypton.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/UugdIYJw/krypton-0.3.2.jar";
          sha256 = "1vwznzc3ljdznqmhgh30gfrcbfmjb3zjlwa9z13q411gkj5n8jhb";
        };
        "mods/VMP.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/wnEe9KBa/versions/2TFDVjDf/vmp-fabric-mc26.3-0.2.0%2Bbeta.7.238-all.jar";
          sha256 = "02lsd0jr4ki98nyr3a1wf4da0x921kjh9b6iw5xjw12q6jad4dnd";
        };
        "mods/C2ME.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/VSNURh3q/versions/aOP6eqZA/c2me-fabric-mc26.3-0.4.2-alpha.0.116.jar";
          sha256 = "143r0wimhcwbl698vm5f3chr2j6qcyrswkrwsadamqabmf1g5kw8";
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
          url = "https://cdn.modrinth.com/data/OnlVIpq5/versions/71NgK90F/zfastnoise-1.1.2%2B26.3.jar";
          sha256 = "1y6ccvrbyjjy6glkb96z32dwjfiy7v8ipla94q80lyrxmhxxybfg";
        };
        "mods/DisablePortalChecks.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/uOzKOGGt/versions/zW17oIr0/disableportalchecks-1.0.0.jar?mr_download_reason=standalone&mr_game_version=26.3&mr_loader=fabric";
          sha256 = "1zq535nb6zv22plvz3p6ykh02skng6wjjzsalm1qmlidj22r8j40";
        };
        "mods/RailOptimization.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/QSvN5pBU/versions/QQzYehRo/railoptimization-2.0%2Bmc26.1.2-fabric.jar";
          sha256 = "067vg8d8i9z2vd7l5kmr9dn7s98bk40sy0ibbpcb8mb12kafmbmk";
        };
        "mods/Spark.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/l6YH9Als/versions/e3hsPc1o/spark-1.10.187-fabric.jar";
          sha256 = "1imcr75mib9q75m6dqr8cqr6h9gbnh4hcwrkhgkv2hm5r9ihdh1z";
        };
        "mods/QuickPack.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/pSISfJ4O/versions/6LPWDWD1/quick-pack-fabric-1.5.1%2B26.3.jar";
          sha256 = "1cvx5z227f343by2sjqay2k1rkfkii7s1ynha1a8qwj6jifxs2ds";
        };
        "mods/Geyser.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/wKkoqHrH/versions/FJEiET7L/Geyser-Fabric-2.12.1-b1295.jar";
          sha256 = "1whqd53062qsy4wdsw6jndqf8mnrwnn9rrqklvhqi46nbj1i1l5v";
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
        "mods/ArmoredElytra.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/AuFCCYMx/versions/Oe6DS1BQ/armored-elytra-1.16.0.jar";
          sha256 = "1p1hnmbkbhvsxq2zix525km8b5n72af1yncsn2q5mszbmvky2ff1";
        };
        "mods/NoChatReports.jar" = pkgs.fetchurl {
          url = "https://cdn.modrinth.com/data/qQyHxfxd/versions/6g96avt2/NoChatReports-FABRIC-26.3-v2.21.0.jar";
          sha256 = "1gxm6k46csg7hk7bw86jsqs6gz2b86531j5kbrfvm4brx8dkjink";
        };
      };
    };
  };
}
