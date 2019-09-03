Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f202.google.com ([209.85.221.202]:52032 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbfICPHj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:39 -0400
Received: by mail-vk1-f202.google.com with SMTP id y73so7243786vky.18
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 08:07:38 -0700 (PDT)
Date: Tue,  3 Sep 2019 16:06:31 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-6-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
Subject: [PATCH v4 05/12] module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, arnd@arndb.de, gregkh@linuxfoundation.org, jeyu@kernel.org, joel@joelfernandes.org, lucas.de.marchi@gmail.com, maco@android.com, sspatil@google.com, will@kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org

If MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is enabled (default=n), the
requirement for modules to import all namespaces that are used by
the module is relaxed.

Enabling this option effectively allows (invalid) modules to be loaded
while only a warning is emitted.

Disabling this option keeps the enforcement at module loading time and
loading is denied if the module's imports are not satisfactory.

Reviewed-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 init/Kconfig    | 13 +++++++++++++
 kernel/module.c | 11 +++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bd7d650d4a99..cc28561288a7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2119,6 +2119,19 @@ config MODULE_COMPRESS_XZ
 
 endchoice
 
+config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+	bool "Allow loading of modules with missing namespace imports"
+	help
+	  Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
+	  a namespace. A module that makes use of a symbol exported with such a
+	  namespace is required to import the namespace via MODULE_IMPORT_NS().
+	  There is no technical reason to enforce correct namespace imports,
+	  but it creates consistency between symbols defining namespaces and
+	  users importing namespaces they make use of. This option relaxes this
+	  requirement and lifts the enforcement when loading a module.
+
+	  If unsure, say N.
+
 config TRIM_UNUSED_KSYMS
 	bool "Trim unused exported kernel symbols"
 	depends on MODULES && !UNUSED_SYMBOLS
diff --git a/kernel/module.c b/kernel/module.c
index 6bb9b938f9c7..f76efcf2043e 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1408,9 +1408,16 @@ static int verify_namespace_is_imported(const struct load_info *info,
 			imported_namespace = get_next_modinfo(
 				info, "import_ns", imported_namespace);
 		}
-		pr_err("%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
-		       mod->name, kernel_symbol_name(sym), namespace);
+#ifdef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+		pr_warn(
+#else
+		pr_err(
+#endif
+			"%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
+			mod->name, kernel_symbol_name(sym), namespace);
+#ifndef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 		return -EINVAL;
+#endif
 	}
 	return 0;
 }
-- 
2.23.0.187.g17f5b7556c-goog
