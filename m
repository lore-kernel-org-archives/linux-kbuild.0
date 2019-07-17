Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62965 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 10/12] kbuild: remove the first line of *.mod files
Date: Wed, 17 Jul 2019 15:17:58 +0900
Message-Id: <20190717061800.10018-11-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The current format of *.mod is like this:

  line 1: directory path to the .ko file
  line 2: a list of objects linked into this module
  line 3: unresolved symbols (only when CONFIG_TRIM_UNUSED_KSYMS=y)

Now that *.mod and *.ko are created in the same directory, the line 1
provides no valuable information. It can be derived by replacing the
extension .mod with .ko. In fact, nobody uses the first line any more.

Cut down the first line.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 scripts/Makefile.build      | 4 ++--
 scripts/adjust_autoksyms.sh | 4 ++--
 scripts/mod/sumversion.c    | 9 ++-------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c6dfcc028f56..9f37f203882f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -274,7 +274,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
-	@{ echo $(@:.o=.ko); echo $@; \
+	@{ echo $@; \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 
 quiet_cmd_cc_lst_c = MKLST   $@
@@ -456,7 +456,7 @@ quiet_cmd_link_multi-m = LD [M]  $@
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
+	@{ echo $(filter %.o,$^); \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 2e4a7320bfb4..a904bf1f5e67 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -8,7 +8,7 @@
 #
 
 # Create/update the include/generated/autoksyms.h file from the list
-# of all module's needed symbols as recorded on the third line of *.mod files.
+# of all module's needed symbols as recorded on the second line of *.mod files.
 #
 # For each symbol being added or removed, the corresponding dependency
 # file's timestamp is updated to force a rebuild of the affected source
@@ -47,7 +47,7 @@ cat > "$new_ksyms_file" << EOT
 
 EOT
 sed 's/ko$/mod/' modules.order |
-xargs -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' -- |
+xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 166f3fa247a9..63062024ce0e 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -398,7 +398,7 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	char *sources, *end, *fname;
 	char filelist[PATH_MAX + 1];
 
-	/* objects for a module are listed in the second line of *.mod file. */
+	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%.*smod",
 		 (int)strlen(modname) - 1, modname);
 
@@ -407,13 +407,8 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 		/* not a module or .mod file missing - ignore */
 		return;
 
-	sources = strchr(file, '\n');
-	if (!sources) {
-		warn("malformed versions file for %s\n", modname);
-		goto release;
-	}
+	sources = file;
 
-	sources++;
 	end = strchr(sources, '\n');
 	if (!end) {
 		warn("bad ending versions file for %s\n", modname);
-- 
2.17.1
