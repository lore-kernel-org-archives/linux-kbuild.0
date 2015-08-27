Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:32860 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754506AbbH0NOD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Aug 2015 09:14:03 -0400
From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: [RFC/PATCH 2/2] kconfig: add KCONFIG_BASECONFIG option to savedefconfig
Date: Thu, 27 Aug 2015 08:08:45 -0500
Message-Id: <1440680925-2879-3-git-send-email-felipe.contreras@gmail.com>
In-Reply-To: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
References: <1440680925-2879-1-git-send-email-felipe.contreras@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linus Torvalds <torvalds@linux-foundation.org>, Felipe Contreras <felipe.contreras@gmail.com>

This option parses a defconfig file, and sets all the values as default
ones. The result is a much simplified defconfig.

This defconfig can be used as a KBUILD_USERCONFIG, which added to the
default defconfig generates exactly the same config file.

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 scripts/kconfig/conf.c      |  3 ++
 scripts/kconfig/confdata.c  | 89 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/lkc_proto.h |  1 +
 3 files changed, 93 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6c20431..382151c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -698,6 +698,9 @@ int main(int ac, char **av)
 			return 1;
 		}
 	} else if (input_mode == savedefconfig) {
+		name = getenv("KCONFIG_BASECONFIG");
+		if (name)
+			conf_read_def(name);
 		if (conf_write_defconfig(defconfig_file)) {
 			fprintf(stderr, _("n*** Error while saving defconfig to: %s\n\n"),
 				defconfig_file);
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c814f57..af96042 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -476,6 +476,95 @@ int conf_read(const char *name)
 	return 0;
 }
 
+static void conf_set_sym_default(struct symbol *sym, char *p)
+{
+	struct property *prop, **propp;
+
+	prop = xmalloc(sizeof(*prop));
+	memset(prop, 0, sizeof(*prop));
+	prop->type = P_DEFAULT;
+	prop->sym = sym;
+	prop->file = current_file;
+	prop->lineno = zconf_lineno();
+
+	for (propp = &sym->prop; *propp; propp = &(*propp)->next) {
+		if ((*propp)->type == P_DEFAULT) {
+			prop->next = *propp;
+			break;
+		}
+	}
+	*propp = prop;
+
+	prop->expr = expr_alloc_symbol(sym_lookup(p, SYMBOL_CONST));
+}
+
+int conf_read_def(const char *name)
+{
+	FILE *in = NULL;
+	char *line = NULL;
+	size_t line_asize = 0;
+	char *p, *p2;
+	struct symbol *sym;
+
+	in = zconf_fopen(name);
+	if (!in)
+		return 1;
+
+	conf_filename = name;
+	conf_lineno = 0;
+	conf_warnings = 0;
+
+	while (compat_getline(&line, &line_asize, in) != -1) {
+		conf_lineno++;
+		sym = NULL;
+		if (line[0] == '#') {
+			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
+				continue;
+			p = strchr(line + 2 + strlen(CONFIG_), ' ');
+			if (!p)
+				continue;
+			*p++ = 0;
+			if (strncmp(p, "is not set", 10))
+				continue;
+			sym = sym_find(line + 2 + strlen(CONFIG_));
+			if (!sym)
+				continue;
+			switch (sym->type) {
+			case S_BOOLEAN:
+			case S_TRISTATE:
+				conf_set_sym_default(sym, "n");
+				break;
+			default:
+				;
+			}
+		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
+			p = strchr(line + strlen(CONFIG_), '=');
+			if (!p)
+				continue;
+			*p++ = 0;
+			p2 = strchr(p, '\n');
+			if (p2) {
+				*p2-- = 0;
+				if (*p2 == '\r')
+					*p2 = 0;
+			}
+
+			sym = sym_find(line + strlen(CONFIG_));
+			if (!sym)
+				continue;
+			conf_set_sym_default(sym, p);
+		} else {
+			if (line[0] != '\r' && line[0] != '\n')
+				conf_warning("unexpected data");
+			continue;
+		}
+	}
+	free(line);
+	fclose(in);
+
+	return 0;
+}
+
 /*
  * Kconfig configuration printer
  *
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index d539871..69c3785 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -3,6 +3,7 @@
 /* confdata.c */
 void conf_parse(const char *name);
 int conf_read(const char *name);
+int conf_read_def(const char *name);
 int conf_read_simple(const char *name, int);
 int conf_write_defconfig(const char *name);
 int conf_write(const char *name);
-- 
2.5.0

