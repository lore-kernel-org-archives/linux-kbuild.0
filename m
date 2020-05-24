Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19700 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 17/29] modpost: re-add -e to set external_module flag
Date: Mon, 25 May 2020 00:42:23 +0900
Message-Id: <20200524154235.380482-18-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Previously, the -i option had two functions; load a symbol dump file,
and set the external_module flag.

I want to assign a dedicate option for each of them.

Going forward, the -i is used to load a symbol dump file, and the -e
to set the external_module flag.

With this, we will be able to use -i for loading in-kernel symbols.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost | 1 +
 scripts/mod/modpost.c    | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index a316095c843c..d14143b30b7a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -81,6 +81,7 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 
 # modpost options for external modules
 MODPOST += \
+	-e \
 	-i Module.symvers \
 	$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)) \
 	-o $(KBUILD_EXTMOD)/Module.symvers
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ebfc720ee5a4..0a24d2c501c1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2566,10 +2566,12 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
-		case 'i':
+		case 'e':
 			external_module = 1;
+			break;
+		case 'i':
 			*dump_read_iter =
 				NOFAIL(calloc(1, sizeof(**dump_read_iter)));
 			(*dump_read_iter)->file = optarg;
-- 
2.25.1
