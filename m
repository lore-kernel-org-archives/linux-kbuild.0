Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:61095 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750750AbdEHAfX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 20:35:23 -0400
From: Kamil Rytarowski <n54@gmx.com>
Subject: [PATCH] scripts: Switch to more portable Perl shebang
Date: Sun,  7 May 2017 16:56:09 +0200
Message-Id: <20170507145609.4395-1-n54@gmx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: apw@canonical.com, joe@perches.com, Kamil Rytarowski <n54@gmx.com>

The default NetBSD package manager is pkgsrc and it installs Perl
along other third party programs under custom and configurable prefix.
The default prefix for binary prebuilt packages is /usr/pkg, and the
Perl executable lands in /usr/pkg/bin/perl.

This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
the most portable solution that should work for almost everybody.
Perl's executable is detected automatically.

This change switches -w option passed to the executable with more
modern "use warnings;" approach. There is no functional change to the
default behavior.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 scripts/bootgraph.pl                 | 2 +-
 scripts/checkincludes.pl             | 2 +-
 scripts/checkpatch.pl                | 3 ++-
 scripts/checkstack.pl                | 2 +-
 scripts/checkversion.pl              | 2 +-
 scripts/cleanfile                    | 3 ++-
 scripts/cleanpatch                   | 3 ++-
 scripts/dtc/dt_to_config             | 2 +-
 scripts/export_report.pl             | 3 ++-
 scripts/extract-module-sig.pl        | 3 ++-
 scripts/extract-sys-certs.pl         | 3 ++-
 scripts/extract_xc3028.pl            | 2 +-
 scripts/get_dvb_firmware             | 2 +-
 scripts/get_maintainer.pl            | 3 ++-
 scripts/headerdep.pl                 | 2 +-
 scripts/headers_check.pl             | 3 ++-
 scripts/kconfig/streamline_config.pl | 3 ++-
 scripts/kernel-doc                   | 3 ++-
 scripts/kernel-doc-xml-ref           | 3 ++-
 scripts/markup_oops.pl               | 2 +-
 scripts/namespace.pl                 | 3 ++-
 scripts/profile2linkerlist.pl        | 2 +-
 scripts/recordmcount.pl              | 3 ++-
 scripts/stackdelta                   | 2 +-
 24 files changed, 37 insertions(+), 24 deletions(-)

diff --git a/scripts/bootgraph.pl b/scripts/bootgraph.pl
index 9ca667bcaee9..594c55541b16 100755
--- a/scripts/bootgraph.pl
+++ b/scripts/bootgraph.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 # Copyright 2008, Intel Corporation
 #
diff --git a/scripts/checkincludes.pl b/scripts/checkincludes.pl
index 381c018a4612..ce9edefd6e0b 100755
--- a/scripts/checkincludes.pl
+++ b/scripts/checkincludes.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 #
 # checkincludes: find/remove files included more than once
 #
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index baa3c7be04ad..26cc462dd08e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 # (c) 2001, Dave Jones. (the file handling bit)
 # (c) 2005, Joel Schopp <jschopp@austin.ibm.com> (the ugly bit)
 # (c) 2007,2008, Andy Whitcroft <apw@uk.ibm.com> (new conditions, test suite)
@@ -6,6 +6,7 @@
 # Licensed under the terms of the GNU GPL License version 2
 
 use strict;
+use warnings;
 use POSIX;
 use File::Basename;
 use Cwd 'abs_path';
diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 9d37aa4faf5c..7f4c41717e26 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 #	Check the stack usage of functions
 #
diff --git a/scripts/checkversion.pl b/scripts/checkversion.pl
index 5e490a8ceca5..8b4f205234b5 100755
--- a/scripts/checkversion.pl
+++ b/scripts/checkversion.pl
@@ -1,4 +1,4 @@
-#! /usr/bin/perl
+#! /usr/bin/env perl
 #
 # checkversion find uses of LINUX_VERSION_CODE or KERNEL_VERSION
 # without including <linux/version.h>, or cases of
diff --git a/scripts/cleanfile b/scripts/cleanfile
index cefd29e52298..72e3755327ae 100755
--- a/scripts/cleanfile
+++ b/scripts/cleanfile
@@ -1,9 +1,10 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # Clean a text file -- or directory of text files -- of stealth whitespace.
 # WARNING: this can be a highly destructive operation.  Use with caution.
 #
 
+use warnings;
 use bytes;
 use File::Basename;
 
diff --git a/scripts/cleanpatch b/scripts/cleanpatch
index 9680d03ad2b8..3e5a2303dc0e 100755
--- a/scripts/cleanpatch
+++ b/scripts/cleanpatch
@@ -1,9 +1,10 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # Clean a patch file -- or directory of patch files -- of stealth whitespace.
 # WARNING: this can be a highly destructive operation.  Use with caution.
 #
 
+use warnings;
 use bytes;
 use File::Basename;
 
diff --git a/scripts/dtc/dt_to_config b/scripts/dtc/dt_to_config
index 9a248b505c58..5dfd1bff351f 100755
--- a/scripts/dtc/dt_to_config
+++ b/scripts/dtc/dt_to_config
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 # Copyright 2016 by Frank Rowand
 # Copyright 2016 by Gaurav Minocha
diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 8f79b701de87..68ff426b347c 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # (C) Copyright IBM Corporation 2006.
 #	Released under GPL v2.
@@ -7,6 +7,7 @@
 # Usage: export_report.pl -k Module.symvers [-o report_file ] -f *.mod.c
 #
 
+use warnings;
 use Getopt::Std;
 use strict;
 
diff --git a/scripts/extract-module-sig.pl b/scripts/extract-module-sig.pl
index faac6f2e377f..0f161ea41261 100755
--- a/scripts/extract-module-sig.pl
+++ b/scripts/extract-module-sig.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # extract-mod-sig <part> <module-file>
 #
@@ -12,6 +12,7 @@
 #  -k: Just the key ID
 #  -s: Just the crypto signature or PKCS#7 message
 #
+use warnings;
 use strict;
 
 die "Format: $0 -[0adnks] module-file >out\n"
diff --git a/scripts/extract-sys-certs.pl b/scripts/extract-sys-certs.pl
index 8227ca10a494..2aa873b944e0 100755
--- a/scripts/extract-sys-certs.pl
+++ b/scripts/extract-sys-certs.pl
@@ -1,5 +1,6 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
+use warnings;
 use strict;
 use Math::BigInt;
 use Fcntl "SEEK_SET";
diff --git a/scripts/extract_xc3028.pl b/scripts/extract_xc3028.pl
index 47877deae6d7..61d9b256c658 100755
--- a/scripts/extract_xc3028.pl
+++ b/scripts/extract_xc3028.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 # Copyright (c) Mauro Carvalho Chehab <mchehab@infradead.org>
 # Released under GPLv2
diff --git a/scripts/get_dvb_firmware b/scripts/get_dvb_firmware
index 1a0a04125f71..f3f230225aba 100755
--- a/scripts/get_dvb_firmware
+++ b/scripts/get_dvb_firmware
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 #     DVB firmware extractor
 #
 #     (c) 2004 Andrew de Quincey
diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 633f2dd3de27..3bd5f4f30235 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 # (c) 2007, Joe Perches <joe@perches.com>
 #           created from checkpatch.pl
 #
@@ -10,6 +10,7 @@
 #
 # Licensed under the terms of the GNU GPL License version 2
 
+use warnings;
 use strict;
 
 my $P = $0;
diff --git a/scripts/headerdep.pl b/scripts/headerdep.pl
index 8dd019bc5a73..86ebb9ee7570 100755
--- a/scripts/headerdep.pl
+++ b/scripts/headerdep.pl
@@ -1,4 +1,4 @@
-#! /usr/bin/perl
+#! /usr/bin/env perl
 #
 # Detect cycles in the header file dependency graph
 # Vegard Nossum <vegardno@ifi.uio.no>
diff --git a/scripts/headers_check.pl b/scripts/headers_check.pl
index 8b2da054cdc3..3091e4ee6ee1 100755
--- a/scripts/headers_check.pl
+++ b/scripts/headers_check.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # headers_check.pl execute a number of trivial consistency checks
 #
@@ -18,6 +18,7 @@
 #
 # 3) Check for leaked CONFIG_ symbols
 
+use warnings;
 use strict;
 use File::Basename;
 
diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index b8c7b29affc5..a2e83ab17de3 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # Copyright 2005-2009 - Steven Rostedt
 # Licensed under the terms of the GNU GPL License version 2
@@ -42,6 +42,7 @@
 #    mv config_strip .config
 #    make oldconfig
 #
+use warnings;
 use strict;
 use Getopt::Long;
 
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index a26a5f2dce39..7b0a8f01fed5 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1,5 +1,6 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 
+use warnings;
 use strict;
 
 ## Copyright (c) 1998 Michael Zucchi, All Rights Reserved        ##
diff --git a/scripts/kernel-doc-xml-ref b/scripts/kernel-doc-xml-ref
index 104a5a5ba2c8..e3b24bfc804c 100755
--- a/scripts/kernel-doc-xml-ref
+++ b/scripts/kernel-doc-xml-ref
@@ -1,5 +1,6 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 
+use warnings;
 use strict;
 
 ## Copyright (C) 2015  Intel Corporation                         ##
diff --git a/scripts/markup_oops.pl b/scripts/markup_oops.pl
index c21d16328d3f..70dcfb6b3de1 100755
--- a/scripts/markup_oops.pl
+++ b/scripts/markup_oops.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 use File::Basename;
 use Math::BigInt;
diff --git a/scripts/namespace.pl b/scripts/namespace.pl
index 9f3c9d47a4a5..e5d5a4a34c93 100755
--- a/scripts/namespace.pl
+++ b/scripts/namespace.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 #	namespace.pl.  Mon Aug 30 2004
 #
@@ -63,6 +63,7 @@
 #
 
 require 5;	# at least perl 5
+use warnings;
 use strict;
 use File::Find;
 
diff --git a/scripts/profile2linkerlist.pl b/scripts/profile2linkerlist.pl
index 6943fa7cc95b..f23d7be94394 100755
--- a/scripts/profile2linkerlist.pl
+++ b/scripts/profile2linkerlist.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 #
 # Takes a (sorted) output of readprofile and turns it into a list suitable for
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 1633c3e6c0b9..2033af758173 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 # (c) 2008, Steven Rostedt <srostedt@redhat.com>
 # Licensed under the terms of the GNU GPL License version 2
 #
@@ -106,6 +106,7 @@
 # 9) Move the result back to the original object.
 #
 
+use warnings;
 use strict;
 
 my $P = $0;
diff --git a/scripts/stackdelta b/scripts/stackdelta
index 48eabf2f48f8..20a79f19a111 100755
--- a/scripts/stackdelta
+++ b/scripts/stackdelta
@@ -1,4 +1,4 @@
-#!/usr/bin/perl
+#!/usr/bin/env perl
 
 # Read two files produced by the stackusage script, and show the
 # delta between them.
-- 
2.12.2

