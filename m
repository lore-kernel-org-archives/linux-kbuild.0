Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:29748 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKEXP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 00:23:15 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: make module name conflict fatal error
Date: Mon, 11 May 2020 13:21:49 +0900
Message-Id: <20200511042149.1712876-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michal Marek <michal.lkml@markovi.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org

I think all the warnings have been fixed by now. Make it a fatal error.

Check it before modpost because we need to stop building *.ko files.
Also, pass modules.order via a script parameter.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 |  7 +++++--
 scripts/modules-check.sh | 16 +++++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 1162cb04860c..a2e4d0945500 100644
--- a/Makefile
+++ b/Makefile
@@ -1328,9 +1328,12 @@ all: modules
 # using awk while concatenating to the final file.
 
 PHONY += modules
-modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_check
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
+
+PHONY += modules_check
+modules_check: modules.order
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
 
 modules.order: descend
 	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index f51f446707b8..43de226071ae 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -3,14 +3,24 @@
 
 set -e
 
+if [ $# != 1 ]; then
+	echo "Usage: $0 <modules.order>" >& 2
+	exit 1
+fi
+
+exit_code=0
+
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
+	for m in $(sed 's:.*/::' $1 | sort | uniq -d)
 	do
-		echo "warning: same module names found:" >&2
+		echo "error: the following would cause module name conflict:" >&2
 		sed -n "/\/$m/s:^:  :p" modules.order >&2
+		exit_code=1
 	done
 }
 
-check_same_name_modules
+check_same_name_modules "$1"
+
+exit $exit_code
-- 
2.25.1
