{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.swayidle = moduleWithSystem ({ self', ... }: {
		environment.systemPackages = [
			self'.packages.swayidle
		];
		services.logind.settings.Login = {
			HandleLidSwitch = "suspend";
			HandleLidSwitchExternalPower = "suspend";
		};
	});
	perSystem = { pkgs, self', ... }:
	let
		lock = pkgs.writeShellScript "lock-screen" ''
			${pkgs.procps}/bin/pgrep -x hyprlock >/dev/null || ${pkgs.lib.getExe self'.packages.hyprlock} &
		'';
	in {
		packages.swayidle = inputs.wrappers.wrappers.swayidle.wrap {
			inherit pkgs;
			events = {
				before-sleep = "${pkgs.systemd}/bin/loginctl lock-session";
				lock = "${lock}";
			};
		};
	};
}
