Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38294 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgEQJte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:34 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/29] modpost: re-add -e to set external_module flag
Date: Sun, 17 May 2020 18:48:47 +0900
Message-Id: <20200517094859.2376211-18-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Previously, the -i option had two functions; load a symbol dump file,
and set the external_module flag.

I want to assign a dedicate option for each of them.

Going forward, the -i is used to load a symbol dump file, and the -e
to set the external_module flag.

With this, we will be able to use -i for loading in-kernel symbols.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

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
index a5bac158d344..b14ecfbfd640 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2556,10 +2556,12 @@ int main(int argc, char **argv)
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
