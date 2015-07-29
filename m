Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34924 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309AbbG2UJX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Jul 2015 16:09:23 -0400
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Subject: [PATCH] kbuild: document recursive dependency limitation / resolution
Date: Wed, 29 Jul 2015 13:09:16 -0700
Message-Id: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, "Luis R. Rodriguez" <mcgrof@suse.com>

From: "Luis R. Rodriguez" <mcgrof@suse.com>

Recursive dependency issues with kconfig are unavoidable due to
some limitations with kconfig, since these issues are recurring
provide a hint to the user how they can resolve these dependency
issues and also document why such limitation exists.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Bottomley <jbottomley@odin.com>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Michal Marek <mmarek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
---

I've cc'd Roberto and Stefano as I think we might be able to in the
long term use some of their work on package dependency and solvers for
this problem [0] [1] [2]. This last part -- just consider it long term
focused.

[0] https://upsilon.cc/~zack/research/publications/splc2010-fd-deps.pdf
[1] https://ocaml.org/meetings/ocaml/2014/preferences-2014-09-05-slides.pdf
[2] https://www.youtube.com/watch?v=GSOcRQvZg8w

 Documentation/kbuild/kconfig-language.txt | 22 ++++++++++++++++++++++
 scripts/kconfig/symbol.c                  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 350f733bf2c7..7e0510d1cef7 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -393,3 +393,25 @@ config FOO
 	depends on BAR && m
 
 limits FOO to module (=m) or disabled (=n).
+
+Kconfig recursive dependency limitations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+If you've hit the Kconfig error: "recursive dependency detected" you've run
+into a recursive dependency issue with Kconfig. Kconfig does not do recursive
+dependency resolution, this has a few implications for Kconfig file writers. In
+practice it means that for instance if a driver A selects a few kconfig symbols
+another driver B which selects any of these symbols cannot negate any of the
+symbols the driver A selected.  Because of this current limitation developers
+who run into this type of recursive dependency issue have two diverging
+options:
+
+  a) Either swap all "select FOO" to "depends on FOO" or,
+  b) Change the offending "depends on FOO" to "select FOO"
+
+Kconfig's limitations can be addressed by implementing a SAT solver for it,
+but until then, Kconfig is limitted to require developers to use one of
+the above two mechanisms to address recursive dependency issues. For more
+details you can refer to this thread and discussion:
+
+http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 70c5ee189dce..4d61b7490dad 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1117,6 +1117,8 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		if (stack->sym == last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
+			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
+			fprintf(stderr, "section \"Kconfig recursive dependency limitations\"\n");
 		if (stack->expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
 				prop->file->name, prop->lineno,
-- 
2.3.2.209.gd67f9d5.dirty

