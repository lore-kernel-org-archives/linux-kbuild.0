Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:38008 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932413AbaE2FMc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 May 2014 01:12:32 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s4T5CUQg000651
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:12:30 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili16) with ESMTP id s4T5CUM17404
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:12:30 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: trivial - remove trailing empty lines
Date: Thu, 29 May 2014 14:12:29 +0900
Message-Id: <1401340349-15575-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.asm-generic        | 1 -
 scripts/Makefile.host               | 1 -
 scripts/checkstack.pl               | 1 -
 scripts/config                      | 1 -
 scripts/dtc/.gitignore              | 1 -
 scripts/dtc/fstree.c                | 1 -
 scripts/dtc/libfdt/fdt_empty_tree.c | 1 -
 scripts/dtc/treesource.c            | 1 -
 scripts/headers.sh                  | 2 --
 scripts/kconfig/Makefile            | 1 -
 scripts/kconfig/check.sh            | 1 -
 scripts/kconfig/mconf.c             | 1 -
 scripts/kconfig/nconf.c             | 1 -
 scripts/kconfig/util.c              | 2 --
 scripts/markup_oops.pl              | 1 -
 scripts/mksysmap                    | 1 -
 scripts/mod/.gitignore              | 1 -
 scripts/mod/mk_elfconfig.c          | 1 -
 scripts/package/Makefile            | 1 -
 scripts/package/buildtar            | 1 -
 scripts/pnmtologo.c                 | 1 -
 scripts/recordmcount.c              | 2 --
 scripts/rt-tester/check-all.sh      | 1 -
 scripts/rt-tester/rt-tester.py      | 2 --
 scripts/selinux/install_policy.sh   | 1 -
 scripts/show_delta                  | 1 -
 26 files changed, 30 deletions(-)

diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index d17e0ea..045e0098 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -21,4 +21,3 @@ all: $(patsubst %, $(obj)/%, $(generic-y))
 
 $(obj)/%.h:
 	$(call cmd,wrap)
-
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 0f0d6ba..6689364 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -167,4 +167,3 @@ $(host-cshlib): $(obj)/%: $(host-cshobjs) FORCE
 
 targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
 	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs)
-
diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 544aa56..c05d586 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -173,4 +173,3 @@ while (my $line = <STDIN>) {
 
 # Sort output by size (last field)
 print sort { ($b =~ /:\t*(\d+)$/)[0] <=> ($a =~ /:\t*(\d+)$/)[0] } @stack;
-
diff --git a/scripts/config b/scripts/config
index 6804179..026aeb4 100755
--- a/scripts/config
+++ b/scripts/config
@@ -223,4 +223,3 @@ while [ "$1" != "" ] ; do
 		;;
 	esac
 done
-
diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index 095acb4..cdabdc9 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -2,4 +2,3 @@ dtc
 dtc-lexer.lex.c
 dtc-parser.tab.c
 dtc-parser.tab.h
-
diff --git a/scripts/dtc/fstree.c b/scripts/dtc/fstree.c
index f377453..e464727 100644
--- a/scripts/dtc/fstree.c
+++ b/scripts/dtc/fstree.c
@@ -88,4 +88,3 @@ struct boot_info *dt_from_fs(const char *dirname)
 
 	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
 }
-
diff --git a/scripts/dtc/libfdt/fdt_empty_tree.c b/scripts/dtc/libfdt/fdt_empty_tree.c
index f72d13b..f2ae9b7 100644
--- a/scripts/dtc/libfdt/fdt_empty_tree.c
+++ b/scripts/dtc/libfdt/fdt_empty_tree.c
@@ -81,4 +81,3 @@ int fdt_create_empty_tree(void *buf, int bufsize)
 
 	return fdt_open_into(buf, buf, bufsize);
 }
-
diff --git a/scripts/dtc/treesource.c b/scripts/dtc/treesource.c
index 33eeba5..5740e69 100644
--- a/scripts/dtc/treesource.c
+++ b/scripts/dtc/treesource.c
@@ -281,4 +281,3 @@ void dt_to_source(FILE *f, struct boot_info *bi)
 
 	write_tree_source_node(f, bi->dt, 0);
 }
-
diff --git a/scripts/headers.sh b/scripts/headers.sh
index 978b42b..95ece06 100755
--- a/scripts/headers.sh
+++ b/scripts/headers.sh
@@ -28,5 +28,3 @@ for arch in ${archs}; do
 		;;
 	esac
 done
-
-
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 844bc9d..e57478aa 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -319,4 +319,3 @@ $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
 	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
 	$(obj)/gconf.glade
-
diff --git a/scripts/kconfig/check.sh b/scripts/kconfig/check.sh
index 854d9c7..55b79ba 100755
--- a/scripts/kconfig/check.sh
+++ b/scripts/kconfig/check.sh
@@ -11,4 +11,3 @@ EOF
 if [ ! "$?" -eq "0"  ]; then
 	echo -DKBUILD_NO_NLS;
 fi
-
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 9c08fc9..14cea74 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -1034,4 +1034,3 @@ int main(int ac, char **av)
 
 	return res;
 }
-
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 4fbecd2..984489e 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1554,4 +1554,3 @@ int main(int ac, char **av)
 	endwin();
 	return 0;
 }
-
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 6e7fbf1..94f9c83 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -155,5 +155,3 @@ void *xcalloc(size_t nmemb, size_t size)
 	fprintf(stderr, "Out of memory.\n");
 	exit(1);
 }
-
-
diff --git a/scripts/markup_oops.pl b/scripts/markup_oops.pl
index 827896f..c21d163 100644
--- a/scripts/markup_oops.pl
+++ b/scripts/markup_oops.pl
@@ -367,4 +367,3 @@ OPTION:
 EOT
 	exit;
 }
-
diff --git a/scripts/mksysmap b/scripts/mksysmap
index c1b6191..7ada35a 100644
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -42,4 +42,3 @@
 # (At least sparc64 has __crc_ in the middle).
 
 $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)' > $2
-
diff --git a/scripts/mod/.gitignore b/scripts/mod/.gitignore
index 33bae0d..3bd11b6 100644
--- a/scripts/mod/.gitignore
+++ b/scripts/mod/.gitignore
@@ -2,4 +2,3 @@ elfconfig.h
 mk_elfconfig
 modpost
 devicetable-offsets.h
-
diff --git a/scripts/mod/mk_elfconfig.c b/scripts/mod/mk_elfconfig.c
index 639bca7..a4fd71d 100644
--- a/scripts/mod/mk_elfconfig.c
+++ b/scripts/mod/mk_elfconfig.c
@@ -54,4 +54,3 @@ main(int argc, char **argv)
 
 	return 0;
 }
-
diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index c5d4733..99ca6e7 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -143,4 +143,3 @@ help: FORCE
 	@echo '  perf-targz-src-pkg  - Build $(perf-tar).tar.gz source tarball'
 	@echo '  perf-tarbz2-src-pkg - Build $(perf-tar).tar.bz2 source tarball'
 	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
-
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index aa22f94..995c1ea 100644
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -136,4 +136,3 @@ esac
 echo "Tarball successfully created in ${tarball}${file_ext}"
 
 exit 0
-
diff --git a/scripts/pnmtologo.c b/scripts/pnmtologo.c
index 68bb4ef..4718d78 100644
--- a/scripts/pnmtologo.c
+++ b/scripts/pnmtologo.c
@@ -512,4 +512,3 @@ int main(int argc, char *argv[])
     }
     exit(0);
 }
-
diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
index 9c22317..c085306 100644
--- a/scripts/recordmcount.c
+++ b/scripts/recordmcount.c
@@ -480,5 +480,3 @@ main(int argc, char *argv[])
 	}
 	return !!n_error;
 }
-
-
diff --git a/scripts/rt-tester/check-all.sh b/scripts/rt-tester/check-all.sh
index 43098af..6b5c83b 100644
--- a/scripts/rt-tester/check-all.sh
+++ b/scripts/rt-tester/check-all.sh
@@ -19,4 +19,3 @@ testit t3-l2-pi.tst
 testit t4-l2-pi-deboost.tst
 testit t5-l4-pi-boost-deboost.tst
 testit t5-l4-pi-boost-deboost-setsched.tst
-
diff --git a/scripts/rt-tester/rt-tester.py b/scripts/rt-tester/rt-tester.py
index 34186ca..6d916c2 100644
--- a/scripts/rt-tester/rt-tester.py
+++ b/scripts/rt-tester/rt-tester.py
@@ -216,5 +216,3 @@ while 1:
 # Normal exit pass
 print "Pass"
 sys.exit(0)
-
-
diff --git a/scripts/selinux/install_policy.sh b/scripts/selinux/install_policy.sh
index 7b9ccf6..f6a0ce7 100644
--- a/scripts/selinux/install_policy.sh
+++ b/scripts/selinux/install_policy.sh
@@ -66,4 +66,3 @@ if [ "eq$dodev" != "eq" ]; then
 	$SF file_contexts /dev
 	mount --move /mnt /dev
 fi
-
diff --git a/scripts/show_delta b/scripts/show_delta
index e25732b..5b36500 100755
--- a/scripts/show_delta
+++ b/scripts/show_delta
@@ -126,4 +126,3 @@ def main():
 		print (convert_line(line, base_time),)
 
 main()
-
-- 
1.9.1

