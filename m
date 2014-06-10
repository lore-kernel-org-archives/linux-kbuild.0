Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:41955 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752055AbaFJKIV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 06:08:21 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s5AA8Kvs026119
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 19:08:20 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili11) with ESMTP id s5AA8JR02191
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 19:08:19 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2] kbuild: trivial - use tabs for code indent where possible
Date: Tue, 10 Jun 2014 19:08:13 +0900
Message-Id: <1402394893-28486-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v2:
  - Update zconf.lex.c_shipped and zconf.tab.c_shipped by hand




 scripts/basic/fixdep.c               |  8 +++---
 scripts/docproc.c                    | 56 ++++++++++++++++++------------------
 scripts/kallsyms.c                   |  2 +-
 scripts/kconfig/conf.c               |  2 +-
 scripts/kconfig/gconf.c              |  2 +-
 scripts/kconfig/lxdialog/checklist.c |  4 +--
 scripts/kconfig/lxdialog/inputbox.c  |  2 +-
 scripts/kconfig/lxdialog/menubox.c   |  4 +--
 scripts/kconfig/lxdialog/util.c      |  2 +-
 scripts/kconfig/mconf.c              |  2 +-
 scripts/kconfig/menu.c               |  6 ++--
 scripts/kconfig/zconf.l              |  4 +--
 scripts/kconfig/zconf.lex.c_shipped  |  4 +--
 scripts/kconfig/zconf.tab.c_shipped  |  2 +-
 scripts/kconfig/zconf.y              |  2 +-
 scripts/mod/file2alias.c             | 42 +++++++++++++--------------
 scripts/mod/modpost.c                | 30 +++++++++----------
 scripts/mod/sumversion.c             |  4 +--
 scripts/tags.sh                      |  2 +-
 19 files changed, 89 insertions(+), 91 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 078fe1d..b304068 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -409,10 +409,10 @@ static void print_deps(void)
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
-                fprintf(stderr, "fixdep: error fstat'ing depfile: ");
-                perror(depfile);
-                exit(2);
-        }
+		fprintf(stderr, "fixdep: error fstat'ing depfile: ");
+		perror(depfile);
+		exit(2);
+	}
 	if (st.st_size == 0) {
 		fprintf(stderr,"fixdep: %s is empty\n",depfile);
 		close(fd);
diff --git a/scripts/docproc.c b/scripts/docproc.c
index 2b69eaf..e267e621 100644
--- a/scripts/docproc.c
+++ b/scripts/docproc.c
@@ -154,7 +154,7 @@ int symfilecnt = 0;
 static void add_new_symbol(struct symfile *sym, char * symname)
 {
 	sym->symbollist =
-          realloc(sym->symbollist, (sym->symbolcnt + 1) * sizeof(char *));
+	  realloc(sym->symbollist, (sym->symbolcnt + 1) * sizeof(char *));
 	sym->symbollist[sym->symbolcnt++].name = strdup(symname);
 }
 
@@ -215,7 +215,7 @@ static void find_export_symbols(char * filename)
 			char *p;
 			char *e;
 			if (((p = strstr(line, "EXPORT_SYMBOL_GPL")) != NULL) ||
-                            ((p = strstr(line, "EXPORT_SYMBOL")) != NULL)) {
+			    ((p = strstr(line, "EXPORT_SYMBOL")) != NULL)) {
 				/* Skip EXPORT_SYMBOL{_GPL} */
 				while (isalnum(*p) || *p == '_')
 					p++;
@@ -291,28 +291,28 @@ static void extfunc(char * filename) { docfunctions(filename, FUNCTION);   }
 static void singfunc(char * filename, char * line)
 {
 	char *vec[200]; /* Enough for specific functions */
-        int i, idx = 0;
-        int startofsym = 1;
+	int i, idx = 0;
+	int startofsym = 1;
 	vec[idx++] = KERNELDOC;
 	vec[idx++] = DOCBOOK;
 	vec[idx++] = SHOWNOTFOUND;
 
-        /* Split line up in individual parameters preceded by FUNCTION */
-        for (i=0; line[i]; i++) {
-                if (isspace(line[i])) {
-                        line[i] = '\0';
-                        startofsym = 1;
-                        continue;
-                }
-                if (startofsym) {
-                        startofsym = 0;
-                        vec[idx++] = FUNCTION;
-                        vec[idx++] = &line[i];
-                }
-        }
+	/* Split line up in individual parameters preceded by FUNCTION */
+	for (i=0; line[i]; i++) {
+		if (isspace(line[i])) {
+			line[i] = '\0';
+			startofsym = 1;
+			continue;
+		}
+		if (startofsym) {
+			startofsym = 0;
+			vec[idx++] = FUNCTION;
+			vec[idx++] = &line[i];
+		}
+	}
 	for (i = 0; i < idx; i++) {
-        	if (strcmp(vec[i], FUNCTION))
-        		continue;
+		if (strcmp(vec[i], FUNCTION))
+			continue;
 		consume_symbol(vec[i + 1]);
 	}
 	vec[idx++] = filename;
@@ -460,14 +460,14 @@ static void parse_file(FILE *infile)
 					break;
 				case 'D':
 					while (*s && !isspace(*s)) s++;
-                                        *s = '\0';
-                                        symbolsonly(line+2);
-                                        break;
+					*s = '\0';
+					symbolsonly(line+2);
+					break;
 				case 'F':
 					/* filename */
 					while (*s && !isspace(*s)) s++;
 					*s++ = '\0';
-                                        /* function names */
+					/* function names */
 					while (isspace(*s))
 						s++;
 					singlefunctions(line +2, s);
@@ -515,11 +515,11 @@ int main(int argc, char *argv[])
 	}
 	/* Open file, exit on error */
 	infile = fopen(argv[2], "r");
-        if (infile == NULL) {
-                fprintf(stderr, "docproc: ");
-                perror(argv[2]);
-                exit(2);
-        }
+	if (infile == NULL) {
+		fprintf(stderr, "docproc: ");
+		perror(argv[2]);
+		exit(2);
+	}
 
 	if (strcmp("doc", argv[1]) == 0) {
 		/* Need to do this in two passes.
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 1237dd7..dc7aa45 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -123,7 +123,7 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	}
 	if (strlen(str) > KSYM_NAME_LEN) {
 		fprintf(stderr, "Symbol %s too long for kallsyms (%zu vs %d).\n"
-                                "Please increase KSYM_NAME_LEN both in kernel and kallsyms.c\n",
+				"Please increase KSYM_NAME_LEN both in kernel and kallsyms.c\n",
 			str, strlen(str), KSYM_NAME_LEN);
 		return -1;
 	}
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index d19944f..fef75fc 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -696,7 +696,7 @@ int main(int ac, char **av)
 	} else if (input_mode == savedefconfig) {
 		if (conf_write_defconfig(defconfig_file)) {
 			fprintf(stderr, _("n*** Error while saving defconfig to: %s\n\n"),
-			        defconfig_file);
+				defconfig_file);
 			return 1;
 		}
 	} else if (input_mode != listnewconfig) {
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index f2bee70..d0a35b2 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1404,7 +1404,7 @@ static void display_tree(struct menu *menu)
 		    && (tree == tree2))
 			continue;
 /*
-                if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
+		if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))*/
 
diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index 3b15c08..8d016fa 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -168,13 +168,13 @@ do_resize:
 
 	/* create new window for the list */
 	list = subwin(dialog, list_height, list_width, y + box_y + 1,
-	              x + box_x + 1);
+		      x + box_x + 1);
 
 	keypad(list, TRUE);
 
 	/* draw a box around the list items */
 	draw_box(dialog, box_y, box_x, list_height + 2, list_width + 2,
-	         dlg.menubox_border.atr, dlg.menubox.atr);
+		 dlg.menubox_border.atr, dlg.menubox.atr);
 
 	/* Find length of longest item in order to center checklist */
 	check_x = 0;
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 447a582..d58de1d 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -42,7 +42,7 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
  * Display a dialog box for inputing a string
  */
 int dialog_inputbox(const char *title, const char *prompt, int height, int width,
-                    const char *init)
+		    const char *init)
 {
 	int i, x, y, box_y, box_x, box_width;
 	int input_x = 0, key = 0, button = -1;
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index c93de0b..11ae9ad7 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -64,7 +64,7 @@ static int menu_width, item_x;
  * Print menu item
  */
 static void do_print_item(WINDOW * win, const char *item, int line_y,
-                          int selected, int hotkey)
+			  int selected, int hotkey)
 {
 	int j;
 	char *menu_item = malloc(menu_width + 1);
@@ -182,7 +182,7 @@ static void do_scroll(WINDOW *win, int *scroll, int n)
  * Display a menu for choosing among a number of options
  */
 int dialog_menu(const char *title, const char *prompt,
-                const void *selected, int *s_scroll)
+		const void *selected, int *s_scroll)
 {
 	int i, j, x, y, box_x, box_y;
 	int height, width, menu_height;
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 58a8289..f7abdeb 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -623,7 +623,7 @@ void item_make(const char *fmt, ...)
 void item_add_str(const char *fmt, ...)
 {
 	va_list ap;
-        size_t avail;
+	size_t avail;
 
 	avail = sizeof(item_cur->node.str) - strlen(item_cur->node.str);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 59184bb..9c08fc9 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -299,7 +299,7 @@ static void set_config_filename(const char *config_filename)
 	int size;
 
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-	                "%s - %s", config_filename, rootmenu.prompt->text);
+			"%s - %s", config_filename, rootmenu.prompt->text);
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
 	set_dialog_backtitle(menu_backtitle);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 3ac2c9c..a26cc5d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -258,8 +258,8 @@ static void sym_check_prop(struct symbol *sym)
 				    "config symbol '%s' uses select, but is "
 				    "not boolean or tristate", sym->name);
 			else if (sym2->type != S_UNKNOWN &&
-			         sym2->type != S_BOOLEAN &&
-			         sym2->type != S_TRISTATE)
+				 sym2->type != S_BOOLEAN &&
+				 sym2->type != S_TRISTATE)
 				prop_warn(prop,
 				    "'%s' has wrong type. 'select' only "
 				    "accept arguments of boolean and "
@@ -268,7 +268,7 @@ static void sym_check_prop(struct symbol *sym)
 		case P_RANGE:
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
-				                "for int or hex symbols");
+						"for int or hex symbols");
 			if (!menu_validate_number(sym, prop->expr->left.sym) ||
 			    !menu_validate_number(sym, prop->expr->right.sym))
 				prop_warn(prop, "range is invalid");
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 1a9f53e..6c62d93 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -27,8 +27,8 @@ static char *text;
 static int text_size, text_asize;
 
 struct buffer {
-        struct buffer *parent;
-        YY_BUFFER_STATE state;
+	struct buffer *parent;
+	YY_BUFFER_STATE state;
 };
 
 struct buffer *current_buf;
diff --git a/scripts/kconfig/zconf.lex.c_shipped b/scripts/kconfig/zconf.lex.c_shipped
index a0521aa..349a7f2 100644
--- a/scripts/kconfig/zconf.lex.c_shipped
+++ b/scripts/kconfig/zconf.lex.c_shipped
@@ -789,8 +789,8 @@ static char *text;
 static int text_size, text_asize;
 
 struct buffer {
-        struct buffer *parent;
-        YY_BUFFER_STATE state;
+	struct buffer *parent;
+	YY_BUFFER_STATE state;
 };
 
 struct buffer *current_buf;
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 25ae16a..de5e84e 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2314,7 +2314,7 @@ void conf_parse(const char *name)
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
 			zconfnerrs++;
-        }
+	}
 	if (zconfnerrs)
 		exit(1);
 	sym_set_change_count(1);
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 0653886..0f683cf 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -510,7 +510,7 @@ void conf_parse(const char *name)
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
 			zconfnerrs++;
-        }
+	}
 	if (zconfnerrs)
 		exit(1);
 	sym_set_change_count(1);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 1924990..e614ef6 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -644,28 +644,26 @@ ADD_TO_DEVTABLE("pcmcia", pcmcia_device_id, do_pcmcia_entry);
 
 static int do_of_entry (const char *filename, void *symval, char *alias)
 {
-    int len;
-    char *tmp;
-    DEF_FIELD_ADDR(symval, of_device_id, name);
-    DEF_FIELD_ADDR(symval, of_device_id, type);
-    DEF_FIELD_ADDR(symval, of_device_id, compatible);
-
-    len = sprintf (alias, "of:N%sT%s",
-                    (*name)[0] ? *name : "*",
-                    (*type)[0] ? *type : "*");
-
-    if (compatible[0])
-        sprintf (&alias[len], "%sC%s",
-                     (*type)[0] ? "*" : "",
-                     *compatible);
-
-    /* Replace all whitespace with underscores */
-    for (tmp = alias; tmp && *tmp; tmp++)
-        if (isspace (*tmp))
-            *tmp = '_';
-
-    add_wildcard(alias);
-    return 1;
+	int len;
+	char *tmp;
+	DEF_FIELD_ADDR(symval, of_device_id, name);
+	DEF_FIELD_ADDR(symval, of_device_id, type);
+	DEF_FIELD_ADDR(symval, of_device_id, compatible);
+
+	len = sprintf(alias, "of:N%sT%s", (*name)[0] ? *name : "*",
+		      (*type)[0] ? *type : "*");
+
+	if (compatible[0])
+		sprintf(&alias[len], "%sC%s", (*type)[0] ? "*" : "",
+			*compatible);
+
+	/* Replace all whitespace with underscores */
+	for (tmp = alias; tmp && *tmp; tmp++)
+		if (isspace (*tmp))
+			*tmp = '_';
+
+	add_wildcard(alias);
+	return 1;
 }
 ADD_TO_DEVTABLE("of", of_device_id, do_of_entry);
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ea7f953..646d94d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -862,7 +862,7 @@ static const char *section_white_list[] =
  * without "ax" / "aw".
  */
 static void check_section(const char *modname, struct elf_info *elf,
-                          Elf_Shdr *sechdr)
+			  Elf_Shdr *sechdr)
 {
 	const char *sec = sech_name(elf, sechdr);
 
@@ -1296,12 +1296,12 @@ static void print_section_list(const char * const list[20])
  */
 static void report_sec_mismatch(const char *modname,
 				const struct sectioncheck *mismatch,
-                                const char *fromsec,
-                                unsigned long long fromaddr,
-                                const char *fromsym,
-                                int from_is_func,
-                                const char *tosec, const char *tosym,
-                                int to_is_func)
+				const char *fromsec,
+				unsigned long long fromaddr,
+				const char *fromsym,
+				int from_is_func,
+				const char *tosec, const char *tosym,
+				int to_is_func)
 {
 	const char *from, *from_p;
 	const char *to, *to_p;
@@ -1441,7 +1441,7 @@ static void report_sec_mismatch(const char *modname,
 }
 
 static void check_section_mismatch(const char *modname, struct elf_info *elf,
-                                   Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
+				   Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
 {
 	const char *tosec;
 	const struct sectioncheck *mismatch;
@@ -1528,7 +1528,7 @@ static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 	case R_ARM_ABS32:
 		/* From ARM ABI: (S + A) | T */
 		r->r_addend = (int)(long)
-		              (elf->symtab_start + ELF_R_SYM(r->r_info));
+			      (elf->symtab_start + ELF_R_SYM(r->r_info));
 		break;
 	case R_ARM_PC24:
 	case R_ARM_CALL:
@@ -1538,8 +1538,8 @@ static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 	case R_ARM_THM_JUMP19:
 		/* From ARM ABI: ((S + A) | T) - P */
 		r->r_addend = (int)(long)(elf->hdr +
-		              sechdr->sh_offset +
-		              (r->r_offset - sechdr->sh_addr));
+			      sechdr->sh_offset +
+			      (r->r_offset - sechdr->sh_addr));
 		break;
 	default:
 		return 1;
@@ -1571,7 +1571,7 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 }
 
 static void section_rela(const char *modname, struct elf_info *elf,
-                         Elf_Shdr *sechdr)
+			 Elf_Shdr *sechdr)
 {
 	Elf_Sym  *sym;
 	Elf_Rela *rela;
@@ -1615,7 +1615,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
 }
 
 static void section_rel(const char *modname, struct elf_info *elf,
-                        Elf_Shdr *sechdr)
+			Elf_Shdr *sechdr)
 {
 	Elf_Sym *sym;
 	Elf_Rel *rel;
@@ -1685,7 +1685,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
  * be discarded and warns about it.
  **/
 static void check_sec_ref(struct module *mod, const char *modname,
-                          struct elf_info *elf)
+			  struct elf_info *elf)
 {
 	int i;
 	Elf_Shdr *sechdrs = elf->sechdrs;
@@ -1945,7 +1945,7 @@ static int add_versions(struct buffer *b, struct module *mod)
 					     s->name, mod->name);
 				} else {
 					merror("\"%s\" [%s.ko] undefined!\n",
-					          s->name, mod->name);
+					       s->name, mod->name);
 					err = 1;
 				}
 			}
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index deb2994..944418d 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -214,7 +214,7 @@ static void md4_final_ascii(struct md4_ctx *mctx, char *out, unsigned int len)
 	mctx->block[14] = mctx->byte_count << 3;
 	mctx->block[15] = mctx->byte_count >> 29;
 	le32_to_cpu_array(mctx->block, (sizeof(mctx->block) -
-	                  sizeof(uint64_t)) / sizeof(uint32_t));
+			  sizeof(uint64_t)) / sizeof(uint32_t));
 	md4_transform(mctx->hash, mctx->block);
 	cpu_to_le32_array(mctx->hash, sizeof(mctx->hash) / sizeof(uint32_t));
 
@@ -367,7 +367,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 			break;
 		/* Terminate line at first space, to get rid of final ' \' */
 		while (*p) {
-                       if (isspace(*p)) {
+			if (isspace(*p)) {
 				*p = '\0';
 				break;
 			}
diff --git a/scripts/tags.sh b/scripts/tags.sh
index f2c5b00..05b8978 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -266,7 +266,7 @@ xtags()
 		emacs $1
 	else
 		all_target_sources | xargs $1 -a
-        fi
+	fi
 }
 
 # Support um (which uses SUBARCH)
-- 
1.9.1

