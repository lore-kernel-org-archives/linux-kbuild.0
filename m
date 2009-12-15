Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 216-239-44-51.google.com ([216.239.44.51]:2772 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205AbZLOGq1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Dec 2009 01:46:27 -0500
Received: from spaceape9.eur.corp.google.com (spaceape9.eur.corp.google.com [172.28.16.143])
	by smtp-out.google.com with ESMTP id nBF6kPuj011842
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2009 22:46:26 -0800
Received: from qyk37 (qyk37.prod.google.com [10.241.83.165])
	by spaceape9.eur.corp.google.com with ESMTP id nBF6kNFM028144
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2009 22:46:23 -0800
Received: by qyk37 with SMTP id 37so2475356qyk.18
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2009 22:46:22 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?VmFkaW0gQmVuZGVidXJ5ICjQstCxKQ==?= <vbendeb@google.com>
Date: Mon, 14 Dec 2009 22:46:02 -0800
Message-ID: <3b09bd800912142246u2d069702n759e165553bddc9f@mail.gmail.com>
Subject: [PATCH] wrap long help lines, take two
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz

Help text for certain config options is very extensive (the text includes all
config options which the option in question depends on). Long lines are not
wrapped, making it impossible to see the list.

This patch adds some logic which wraps help screen lines at word
boundaries to prevent truncating .

Tested by running

mkdir ../build/powerpc
ARCH=powerpc make menuconfig O=../build/powerpc

in the kernel sorce tree. Once menu is displayed, hitting c<cr>cc? brings up
the help message for CONFIG_CRYPTO_MANAGER, now properly wrapped.

Signed-off-by: Vadim Bendebury <vbendeb@google.com>
---
 scripts/kconfig/expr.c |   20 ++++++++++++++++++--
 1 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 2aa49e8..203eb6d 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1099,9 +1099,25 @@ void expr_fprint(struct expr *e, FILE *out)

 static void expr_print_gstr_helper(void *data, struct symbol *sym,
const char *str)
 {
-       str_append((struct gstr*)data, str);
+       struct gstr *gs = (struct gstr*)data;
+       unsigned extra_length = strlen(str) + (sym ? 4 : 0);
+       const char *last_cr = strrchr(gs->s, '\n');
+       unsigned screen_width = getmaxx(stdscr) - 10;
+       unsigned last_line_length;
+
+       if (!last_cr) {
+               last_cr = gs->s;
+       }
+
+       last_line_length = strlen(gs->s) - (last_cr - gs->s);
+
+       if ((last_line_length + extra_length) > screen_width) {
+               str_append(gs, "\\\n");
+       }
+
+       str_append(gs, str);
        if (sym)
-               str_printf((struct gstr*)data, " [=%s]",
sym_get_string_value(sym));
+               str_printf(gs, " [=%s]", sym_get_string_value(sym));
 }

 void expr_gstr_print(struct expr *e, struct gstr *gs)
--
1.5.4.3
