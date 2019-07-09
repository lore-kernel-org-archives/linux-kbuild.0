Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:42176 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 09/11] kbuild: remove the first line of *.mod files
Date: Tue,  9 Jul 2019 13:24:13 +0900
Message-Id: <20190709042416.27554-10-yamada.masahiro@socionext.com>
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The current format of *.mod is like this:

  line 1: directory path to the .ko file
  line 2: a list of objects linked into this module
  line 3: unresolved symbols (only when CONFIG_TRIM_UNSED_SYMBOLS=y)

Now that *.mod and *.ko are created in the same directory, the line 1
provides no valuable information. It can be derived by replacing the
extension .mod with .ko.

Cut the first line.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build      | 4 ++--
 scripts/adjust_autoksyms.sh | 2 +-
 scripts/mod/sumversion.c    | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1d01324455d1..f34f941c3b9b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -281,7 +281,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
-	@{ echo $(@:.o=.ko); echo $@; \
+	@{ echo $@; \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 
 quiet_cmd_cc_lst_c = MKLST   $@
@@ -463,7 +463,7 @@ cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
+	@{ echo $(filter %.o,$^); \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index d3561ff4089c..147de8908797 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,7 +48,7 @@ cat > "$new_ksyms_file" << EOT
 
 EOT
 sed 's/ko$/mod/' modules.order |
-xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
+xargs -r -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' |
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
