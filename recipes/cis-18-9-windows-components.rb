# Cookbook:: cb_cis_windows_2016
# Recipe:: cis-18-9-windows-components
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# 18.9.4.1 (L2) Ensure Allow a Windows app to share application data between users is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\AppModel\StateManager' do
  values [{ name: 'AllowSharedLocalAppData', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.5.1 (L2) Ensure Let Windows apps * is set to Enabled: Force Deny
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy' do
  values [{ name: 'LetAppsAccessAccountInfo', type: :dword, data: 2 },
          { name: 'LetAppsAccessCalendar', type: :dword, data: 2 },
          { name: 'LetAppsAccessCallHistory', type: :dword, data: 2 },
          { name: 'LetAppsAccessCamera', type: :dword, data: 2 },
          { name: 'LetAppsAccessContacts', type: :dword, data: 2 },
          { name: 'LetAppsAccessEmail', type: :dword, data: 2 },
          { name: 'LetAppsAccessLocation', type: :dword, data: 2 },
          { name: 'LetAppsAccessMessaging', type: :dword, data: 2 },
          { name: 'LetAppsAccessMicrophone', type: :dword, data: 2 },
          { name: 'LetAppsAccessMotion', type: :dword, data: 2 },
          { name: 'LetAppsAccessRadios', type: :dword, data: 2 },
          { name: 'LetAppsAccessTrustedDevices', type: :dword, data: 2 },
          { name: 'LetAppsSyncWithDevices', type: :dword, data: 2 },
          { name: 'LetAppsAccessPhone', type: :dword, data: 2 },
          { name: 'LetAppsAccessNotifications', type: :dword, data: 2 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.6.1 (L1) Ensure 'Allow Microsoft accounts to be optional' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{ name: 'MSAOptional', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.6.2 (L2) Ensure Block launching Windows Store apps with Windows Runtime API access from hosted content. is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{ name: 'BlockHostedAppAccessWinRT', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.8.1 (L1) Ensure 'Disallow Autoplay for non-volume devices' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
  values [{ name: 'NoAutoplayfornonVolume', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.8.2 (L1) Ensure 'Set the default behavior for AutoRun' is set to 'Enabled: Do not execute any autorun commands'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
  values [{ name: 'NoAutorun', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.8.3 (L1) Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
  values [{ name: 'NoDriveTypeAutoRun', type: :dword, data: 255 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.10.1.1 (L1) Ensure 'Use enhanced anti-spoofing when available' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures' do
  values [{ name: 'EnhancedAntiSpoofing', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.12.1 (L2) Ensure Allow Use of Camera is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Camera' do
  values [{ name: 'AllowCamera', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.13.1 (L1) Ensure 'Turn off Microsoft consumer experiences' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent' do
  values [{ name: 'DisableWindowsConsumerFeatures', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.14.1 (L1) Ensure 'Require pin for pairing' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Connect' do
  values [{ name: 'RequirePinForPairing', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.15.1 (L1) Ensure 'Do not display the password reveal button' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI' do
  values [{ name: 'DisablePasswordReveal', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.15.2 (L1) Ensure 'Enumerate administrator accounts on elevation' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI' do
  values [{ name: 'EnumerateAdministrators', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.16.1 (L1) Ensure 'Allow Telemetry' is set to 'Enabled: 0 - Security [Enterprise Only]'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' do
  values [{ name: 'AllowTelemetry', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.16.2 (L1) Ensure 'Disable pre-release features or settings' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' do
  values [{ name: 'EnableConfigFlighting', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.16.3 (L1) Ensure 'Do not show feedback notifications' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' do
  values [{ name: 'DoNotShowFeedbackNotifications', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.16.4 (L1) Ensure 'Toggle user control over Insider builds' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds' do
  values [{ name: 'AllowBuildPreview', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.1.1 (L1) Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' do
  values [{ name: 'Retention', type: :string, data: '0' }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.1.2 (L1)  Ensure 'Application: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application' do
  values [{ name: 'MaxSize', type: :dword, data: 33000 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.2.1 (L1) Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' do
  values [{ name: 'Retention', type: :string, data: '0' }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.2.2 (L1)  Ensure 'Security: Specify the maximum log file size (KB)' is set to 'Enabled: 196,608 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security' do
  values [{ name: 'MaxSize', type: :dword, data: 33000 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.3.1 (L1) Ensure 'Setup: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' do
  values [{ name: 'Retention', type: :string, data: '0' }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.3.2 (L1)  Ensure 'Setup: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup' do
  values [{ name: 'MaxSize', type: :dword, data: 33000 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.4.1 (L1) Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' do
  values [{ name: 'Retention', type: :string, data: '0' }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.26.4.2 (L1)  Ensure 'System: Specify the maximum log file size (KB)' is set to 'Enabled: 32,768 or greater'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System' do
  values [{ name: 'MaxSize', type: :dword, data: 33000 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.30.2 (L1) Ensure 'Configure Windows SmartScreen' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System' do
  values [{ name: 'EnableSmartScreen', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.30.3 (L1) Ensure 'Turn off Data Execution Prevention for Explorer' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
  values [{ name: 'NoDataExecutionPrevention', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.30.4 (L1) Ensure 'Turn off heap termination on corruption' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer' do
  values [{ name: 'NoHeapTerminationOnCorruption', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.30.5 (L1) Ensure 'Turn off shell protocol protected mode' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' do
  values [{ name: 'PreXPSP2ShellProtocolBehavior', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.37.2 (L2) Ensure Turn off location is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' do
  values [{ name: 'DisableLocation', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.1 (L2) Ensure Allow Extensions is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Extensions' do
  values [{ name: 'ExtensionsEnabled', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.2 (L2) Ensure Allow InPrivate Browsing is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'AllowInPrivate', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# Windows 2016 doesn't have Microsoft Edge apparently? (LTSB editions)
# 18.9.41.3 (L1) Ensure 'Configure cookies' is set to 'Enabled: Block only 3rd-party cookies' or higher
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'Cookies', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.41.4 (L1) Ensure 'Configure Password Manager' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'FormSuggest Passwords', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.41.5 (L2) Ensure Configure Pop-up Blocker is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'AllowPopups', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.6 (L1) Ensure 'Configure search suggestions in Address bar' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes' do
  values [{ name: 'ShowSearchSuggestionsGlobal', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.41.7 (L1) Ensure 'Configure SmartScreen Filter' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
  values [{ name: 'EnabledV9', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.41.8 (L2) Ensure Prevent access to the about:flags page in Microsoft Edge is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'PreventAccessToAboutFlagsInMicrosoftEdge', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.9 (L2) Ensure Prevent bypassing SmartScreen prompts for files is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
  values [{ name: 'PreventOverrideAppRepUnknown', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.10 (L2) Ensure Prevent bypassing SmartScreen prompts for sites is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter' do
  values [{ name: 'PreventOverride', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.41.11 (L2) Ensure Prevent using Localhost IP address for WebRTC is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' do
  values [{ name: 'HideLocalHostIP', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.47.1 (L1) Ensure 'Prevent the usage of OneDrive for file storage' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive' do
  values [{ name: 'DisableFileSyncNGSC', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.2.2 (L1) Ensure 'Do not allow passwords to be saved' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'DisablePasswordSaving', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.2.1 (L2) Ensure Restrict Remote Desktop Services users to a single Remote Desktop Services session is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fSingleSessionPerUser', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.3.1 (L2) Ensure Do not allow COM port redirection is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fDisableCcm', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.3.2 (L1) Ensure 'Do not allow drive redirection' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fDisableCdm', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.3.3 (L2) Ensure Do not allow LPT port redirection is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fDisableLPT', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.3.4 (L2) Ensure Do not allow supported Plug and Play device redirection is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fDisablePNPRedir', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.9.1 (L1) Ensure 'Always prompt for password upon connection' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fPromptForPassword', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.9.2 (L1) Ensure 'Require secure RPC communication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'fEncryptRPCTraffic', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.9.3 (L1) Ensure 'Set client connection encryption level' is set to 'Enabled: High Level'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'MinEncryptionLevel', type: :dword, data: 3 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.10.1 (L2) Ensure Set time limit for active but idle Remote Desktop Services sessions is set to Enabled: 15 minutes or less
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'MaxIdleTime', type: :dword, data: 900000 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.10.2 (L2) Ensure Set time limit for disconnected sessions is set to Enabled: 1 minute
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'MaxDisconnectionTime', type: :dword, data: 60000 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.52.3.11.1 (L1) Ensure 'Do not delete temp folders upon exit' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'DeleteTempDirsOnExit', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.52.3.11.2 (L1) Ensure 'Do not use temporary folders per session' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' do
  values [{ name: 'PerSessionTempDir', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.53.1 (L1) Ensure 'Prevent downloading of enclosures' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds' do
  values [{ name: 'DisableEnclosureDownload', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.54.2 (L1) Ensure 'Allow Cortana' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
  values [{ name: 'AllowCortana', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.54.3 (L1) Ensure 'Allow Cortana above lock screen' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
  values [{ name: 'AllowCortanaAboveLock', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.54.4 (L1) Ensure 'Allow indexing of encrypted files' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
  values [{ name: 'AllowIndexingEncryptedStoresOrItems', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.54.5 (L1) Ensure 'Allow search and Cortana to use location' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search' do
  values [{ name: 'AllowSearchToUseLocation', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.59.1 (L2) Ensure Turn off KMS Client Online AVS Validation is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' do
  values [{ name: 'NoGenTicket', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.61.1 (L2) Ensure Disable all apps from Windows Store is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
  values [{ name: 'DisableStoreApps', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.61.2 (L1) Ensure 'Turn off Automatic Download and Install of updates' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
  values [{ name: 'AutoDownload', type: :dword, data: 4 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.61.3 (L1) Ensure 'Turn off the offer to update to the latest version of Windows' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
  values [{ name: 'DisableOSUpgrade', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.61.4 (L2) Ensure Turn off the Store application is set to Enabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore' do
  values [{ name: 'RemoveWindowsStore', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.69.3.1 (L2) Ensure Join Microsoft MAPS is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet' do
  values [{ name: 'SpynetReporting', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.69.8.1 (L2) Ensure Configure Watson events is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting' do
  values [{ name: 'DisableGenericRePorts', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.73.1 (L2) Ensure Allow suggested apps in Windows Ink Workspace is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' do
  values [{ name: 'AllowSuggestedAppsInWindowsInkWorkspace', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.73.2 (L1)  Ensure 'Allow Windows Ink Workspace' is set to 'Enabled: On, but disallow access above lock' OR 'Disabled' but not 'Enabled: On'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace' do
  values [{ name: 'AllowWindowsInkWorkspace', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.74.1 (L1) Ensure 'Allow user control over installs' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
  values [{ name: 'EnableUserControl', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.74.2 (L1) Ensure 'Always install with elevated privileges' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
  values [{ name: 'AlwaysInstallElevated', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.74.3 (L2) Ensure Prevent Internet Explorer security prompt for Windows Installer scripts is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' do
  values [{ name: 'SafeForScripting', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
end

# 18.9.75.1 (L1) Ensure 'Sign-in last interactive user automatically after a system-initiated restart' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' do
  values [{ name: 'DisableAutomaticRestartSignOn', type: :dword, data: 1 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.84.1 (L1) Ensure 'Turn on PowerShell Script Block Logging' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' do
  values [{ name: 'EnableScriptBlockLogging', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end
=begin
# 18.9.84.2 (L1) Ensure 'Turn on PowerShell Transcription' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription' do
  values [{ name: 'EnableTranscripting', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end
=end
# 18.9.86.1.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
  values [{ name: 'AllowBasic', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.86.1.2 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
  values [{ name: 'AllowUnencryptedTraffic', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.86.1.3 (L1) Ensure 'Disallow Digest authentication' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client' do
  values [{ name: 'AllowDigest', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.86.2.1 (L1) Ensure 'Allow Basic authentication' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
  values [{ name: 'AllowBasic', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.86.2.2 (L2) Ensure Allow remote server management through WinRM is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
  values [{ name: 'AllowAutoConfig', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
  not_if { ENV['TEST_KITCHEN'].to_i == 1 }
end

# 18.9.86.2.3 (L1) Ensure 'Allow unencrypted traffic' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
  values [{ name: 'AllowUnencryptedTraffic', type: :dword, data: 0 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.86.2.4 (L1) Ensure 'Disallow WinRM from storing RunAs credentials' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service' do
  values [{ name: 'DisableRunAs', type: :dword, data: 1 }]
  recursive true
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.87.1 (L2) Ensure Allow Remote Shell Access is set to Disabled
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS' do
  values [{ name: 'AllowRemoteShellAccess', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_2'] }
  not_if { ENV['TEST_KITCHEN'].to_i == 1 }
end

# 18.9.90.1.1 (L1)  Ensure 'Select when Feature Updates are received' is set to 'Enabled: Current Branch for Business, 180 days'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
  values [{ name: 'DeferFeatureUpdates', type: :dword, data: 1 },
          { name: 'DeferFeatureUpdatesPeriodInDays', type: :dword, data: 180 },
          { name: 'BranchReadinessLevel', type: :dword, data: 32 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.90.1.2 (L1) Ensure 'Select when Quality Updates are received' is set to 'Enabled: 0 days'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' do
  values [{ name: 'DeferQualityUpdates', type: :dword, data: 1 },
          { name: 'DeferQualityUpdatesPeriodInDays', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.90.2 (L1) Ensure 'Configure Automatic Updates' is set to 'Enabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
  values [{ name: 'NoAutoUpdate', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.90.3 (L1) Ensure 'Configure Automatic Updates: Scheduled install day' is set to '0 - Every day'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
  values [{ name: 'ScheduledInstallDay', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end

# 18.9.90.4 (L1) Ensure 'No auto-restart with logged on users for scheduled automatic updates installations' is set to 'Disabled'
registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do
  values [{ name: 'NoAutoRebootWithLoggedOnUsers', type: :dword, data: 0 }]
  action :create
  only_if { node['cb_cis_windows_2016']['cis_level_1'] }
end
