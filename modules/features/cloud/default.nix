{ ... }:
{
	flake.nixosModules.cloud = { pkgs, ... }: {
		environment.systemPackages = [ pkgs.rclone ];

		systemd.user.services.seafile-mount = {
			description = "Mount Seafile libraries with rclone";
			wantedBy = [ "default.target" ];
			unitConfig = {
				ConditionUser = "thomas";
				ConditionPathExists = "%h/.config/rclone/rclone.conf";
			};
			environment.PATH = "/run/wrappers/bin:/run/current-system/sw/bin";
			serviceConfig = {
				Type = "notify";
				ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/cloud";
				ExecStart = "${pkgs.rclone}/bin/rclone mount seafile: %h/cloud --vfs-cache-mode writes";
				Restart = "on-failure";
				RestartSec = "15s";
			};
		};
	};
}
