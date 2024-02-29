//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_windows/file_selector_windows.h>
#include <git2dart_binaries/git2dart_binaries_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  Git2dartBinariesPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("Git2dartBinariesPluginCApi"));
}
