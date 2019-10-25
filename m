Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:40078 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfJYLwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 07:52:39 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] kconfig: Wrap long "make help" text lines
Date: Fri, 25 Oct 2019 13:52:32 +0200
Message-Id: <20191025115232.9592-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Some "make help" text lines extend beyond 80 characters.
Wrap them before an opening parenthesis, or before 80 characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "[PATCH] kconfig: Wrap long "make help" text line for
xenconfig ".

v2:
  - Fix more recent offenders.
---
 Documentation/Makefile   | 6 ++++--
 Makefile                 | 3 ++-
 scripts/Makefile.package | 3 ++-
 scripts/kconfig/Makefile | 3 ++-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e145e4db508bc6a4..0c5185187dad0b68 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -128,8 +128,10 @@ dochelp:
 	@echo  '  pdfdocs         - PDF'
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
-	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
-	@echo  '  refcheckdocs    - check for references to non-existing files under Documentation'
+	@echo  '  linkcheckdocs   - check for broken external links'
+	@echo  '                    (will connect to external hosts)'
+	@echo  '  refcheckdocs    - check for references to non-existing files under'
+	@echo  '                    Documentation'
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
diff --git a/Makefile b/Makefile
index 5475cdb6d57d4117..5a1ef8db2cec69f6 100644
--- a/Makefile
+++ b/Makefile
@@ -1523,7 +1523,8 @@ help:
 	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
 	@echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
 	@echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
-	@echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK (sparse by default)'
+	@echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK'
+	@echo  '                       (sparse by default)'
 	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
 	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
 	@echo  '  make W=n   [targets] Enable extra build checks, n=1,2,3 where'
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 56eadcc48d46de54..ee9b368dfcf37736 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -146,7 +146,8 @@ help:
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
-	@echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
+	@echo '  snap-pkg            - Build only the binary kernel snap package'
+	@echo '                        (will connect to external hosts)'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ef2f2336c46960df..a7d130b9306e8876 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -137,7 +137,8 @@ help:
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
-	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
+	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel'
+	@echo  '                    support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
 
-- 
2.17.1
