Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:46825 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbgBMMZX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Feb 2020 07:25:23 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] gcc-plugins: fix gcc-plugins directory path in documentation
Date: Thu, 13 Feb 2020 21:24:10 +0900
Message-Id: <20200213122410.1605-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Emese Revfy <re.emese@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, kernel-hardening@lists.openwall.com, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Fix typos "plgins" -> "plugins".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/reproducible-builds.rst | 2 +-
 scripts/gcc-plugins/Kconfig                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index 503393854e2e..3b25655e441b 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -101,7 +101,7 @@ Structure randomisation
 
 If you enable ``CONFIG_GCC_PLUGIN_RANDSTRUCT``, you will need to
 pre-generate the random seed in
-``scripts/gcc-plgins/randomize_layout_seed.h`` so the same value
+``scripts/gcc-plugins/randomize_layout_seed.h`` so the same value
 is used in rebuilds.
 
 Debug info conflicts
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index e3569543bdac..7b63c819610c 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -86,7 +86,7 @@ config GCC_PLUGIN_RANDSTRUCT
 	  source tree isn't cleaned after kernel installation).
 
 	  The seed used for compilation is located at
-	  scripts/gcc-plgins/randomize_layout_seed.h.  It remains after
+	  scripts/gcc-plugins/randomize_layout_seed.h.  It remains after
 	  a make clean to allow for external modules to be compiled with
 	  the existing seed and will be removed by a make mrproper or
 	  make distclean.
-- 
2.17.1
