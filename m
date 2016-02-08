Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26767 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755611AbcBHUnl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:43:41 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 4/6] fixdep: add fine grained build dependencies for exported
 symbols
Date: Mon, 08 Feb 2016 15:28:33 -0500
Message-id: <1454963315-20468-5-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

Like for kconfig options, we now have the ability to compile in and out
individual EXPORT_SYMBOL() declarations based on the content of
include/generated/expsyms.h.  However we don't want the entire world
to be rebuilt whenever that file is touched.

Let's apply the same build dependency trick used with config symbols to
those EXPORT_SYMBOL() instances. The key in this case is the actual symbol
name being exported. All symbol names are collapsed to lowercase path
names whose time stamp provide fine grained dependencies.

Because of the lowercasing, there might be name collisions triggering
spurious rebuilds for similar symbols. But this shouldn't be a big issue
in practice. (This is the case for CONFIG symbols and I didn't want to
be different here, whatever the original reason for doing so.)

To avoid needless build overhead, the exported symbol name parsing is
performed only when CONFIG_TRIM_UNUSED_EXPSYMS is selected. A new cmdline
argument is added to that effect.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 scripts/Kbuild.include |  3 ++-
 scripts/Makefile.build |  3 ++-
 scripts/basic/fixdep.c | 67 +++++++++++++++++++++++++++++++++++++++++---------
 3 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 1db6d73c8d..13b4032d42 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -257,7 +257,8 @@ if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 	@set -e;                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
-	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
+	scripts/basic/fixdep $(if $(CONFIG_TRIM_UNUSED_EXPSYMS),-e)	     \
+		 $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;	     \
 	rm -f $(depfile);                                                    \
 	mv -f $(dot-target).tmp $(dot-target).cmd)
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1d8b07ea3e..f2c4d93726 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -247,7 +247,8 @@ define rule_cc_o_c
 	$(cmd_modversions)						  \
 	$(call echo-cmd,record_mcount)					  \
 	$(cmd_record_mcount)						  \
-	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
+	scripts/basic/fixdep $(if $(CONFIG_TRIM_UNUSED_EXPSYMS),-e)	  \
+	                     $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
 	                                              $(dot-target).tmp;  \
 	rm -f $(depfile);						  \
 	mv -f $(dot-target).tmp $(dot-target).cmd
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 63f129021d..71099ffe67 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -120,13 +120,20 @@
 #define INT_NFIG ntohl(0x4e464947)
 #define INT_FIG_ ntohl(0x4649475f)
 
+#define INT_EXPO ntohl(0x4558504f)
+#define INT_XPOR ntohl(0x58504f52)
+#define INT_PORT ntohl(0x504f5254)
+#define INT_ORT_ ntohl(0x4f52545f)
+
+int parse_export_symbol;
 char *target;
 char *depfile;
 char *cmdline;
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
+	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
+	fprintf(stderr, " -e  parse EXPORT_SYMBOL_* too.\n");
 	exit(1);
 }
 
@@ -140,6 +147,7 @@ static void print_cmdline(void)
 
 struct item {
 	struct item	*next;
+	const char	*type;
 	unsigned int	len;
 	unsigned int	hash;
 	char		name[0];
@@ -161,12 +169,12 @@ static unsigned int strhash(const char *str, unsigned int sz)
 /*
  * Lookup a value in the configuration string.
  */
-static int is_defined_config(const char *name, int len, unsigned int hash)
+static int is_defined_string(const char *type, const char *name, int len, unsigned int hash)
 {
 	struct item *aux;
 
 	for (aux = hashtab[hash % HASHSZ]; aux; aux = aux->next) {
-		if (aux->hash == hash && aux->len == len &&
+		if (aux->hash == hash && aux->len == len && aux->type == type &&
 		    memcmp(aux->name, name, len) == 0)
 			return 1;
 	}
@@ -176,7 +184,7 @@ static int is_defined_config(const char *name, int len, unsigned int hash)
 /*
  * Add a new value to the configuration string.
  */
-static void define_config(const char *name, int len, unsigned int hash)
+static void define_string(const char *type, const char *name, int len, unsigned int hash)
 {
 	struct item *aux = malloc(sizeof(*aux) + len);
 
@@ -186,25 +194,26 @@ static void define_config(const char *name, int len, unsigned int hash)
 	}
 	memcpy(aux->name, name, len);
 	aux->len = len;
+	aux->type = type;
 	aux->hash = hash;
 	aux->next = hashtab[hash % HASHSZ];
 	hashtab[hash % HASHSZ] = aux;
 }
 
 /*
- * Record the use of a CONFIG_* word.
+ * Record the use of a CONFIG_* word, or the argument to EXPORT_MODULE*()
  */
-static void use_config(const char *m, int slen)
+static void use_dep(const char *type, const char *m, int slen)
 {
 	unsigned int hash = strhash(m, slen);
 	int c, i;
 
-	if (is_defined_config(m, slen, hash))
+	if (is_defined_string(type, m, slen, hash))
 	    return;
 
-	define_config(m, slen, hash);
+	define_string(type, m, slen, hash);
 
-	printf("    $(wildcard include/config/");
+	printf("    $(wildcard include/%s/", type);
 	for (i = 0; i < slen; i++) {
 		c = m[i];
 		if (c == '_')
@@ -228,7 +237,17 @@ static void parse_config_file(const char *map, size_t len)
 		if (*m == INT_ONFI) { p = (char *) m-1; goto conf; }
 		if (*m == INT_NFIG) { p = (char *) m-2; goto conf; }
 		if (*m == INT_FIG_) { p = (char *) m-3; goto conf; }
+
+		if (!parse_export_symbol)
+			continue;
+
+		if (*m == INT_EXPO) { p = (char *) m  ; goto export; }
+		if (*m == INT_XPOR) { p = (char *) m-1; goto export; }
+		if (*m == INT_PORT) { p = (char *) m-2; goto export; }
+		if (*m == INT_ORT_) { p = (char *) m-3; goto export; }
+
 		continue;
+
 	conf:
 		if (p > map + len - 7)
 			continue;
@@ -240,12 +259,34 @@ static void parse_config_file(const char *map, size_t len)
 				if (!memcmp(q - 7, "_MODULE", 7))
 					q -= 7;
 				if (q - p > 0)
-					use_config(p, q - p);
+					use_dep("config", p, q - p);
 				break;
 			}
 		}
 		continue;
 
+	export:
+		if (p[-1] == '_')
+			continue;
+		if (p > map + len - 7 || memcmp(p, "EXPORT_", 7) != 0)
+			continue;
+		p += 7;
+		if (p <= map + len - 8 && memcmp(p, "PER_CPU_", 8) == 0)
+			p += 8;
+		if (p > map + len - 6 || memcmp(p, "SYMBOL", 6) != 0)
+			continue;
+		p += 6;
+		while (p < map + len && *p != '(' && *p != '\n')
+			p++;
+		q = p + 1;
+		while (q < map + len && *q != ')' && *q != '\n' && *q != '#')
+			q++;
+		if (q >= map + len || *p != '(' || *q != ')')
+			continue;
+		while (isblank(*++p));
+		while (isblank(q[-1])) q--;
+		if (q - p > 0)
+			use_dep("config/expsym", p, q - p);
 	}
 }
 
@@ -330,6 +371,7 @@ static void parse_dep_file(void *map, size_t len)
 			if (strrcmp(s, "include/generated/autoconf.h") &&
 			    strrcmp(s, "arch/um/include/uml-config.h") &&
 			    strrcmp(s, "include/linux/kconfig.h") &&
+			    strrcmp(s, "include/generated/expsyms.h") &&
 			    strrcmp(s, ".ver")) {
 				/*
 				 * Do not list the source file as dependency,
@@ -429,7 +471,10 @@ int main(int argc, char *argv[])
 {
 	traps();
 
-	if (argc != 4)
+	if (argc == 5 && !strcmp(argv[1], "-e")) {
+		parse_export_symbol = 1;
+		argv++;
+	} else if (argc != 4)
 		usage();
 
 	depfile = argv[1];
-- 
2.5.0

