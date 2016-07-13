Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:46372 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751302AbcGMWfy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jul 2016 18:35:54 -0400
Date: Thu, 14 Jul 2016 01:34:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] kconfig: Add some missing curly braces
Message-ID: <20160713223433.GA20475@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michal Marek <mmarek@suse.com>

There are missing curly braces here so we print some stuff to stderr
which we hadn't intended.

Fixes: 1c199f2878f6 ('kbuild: document recursive dependency limitation / resolution')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 2432298..ff0feab 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1127,11 +1127,12 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 					break;
 			}
 		}
-		if (stack->sym == last_sym)
+		if (stack->sym == last_sym) {
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
 			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
 			fprintf(stderr, "subsection \"Kconfig recursive dependency limitations\"\n");
+		}
 		if (stack->expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
 				prop->file->name, prop->lineno,
