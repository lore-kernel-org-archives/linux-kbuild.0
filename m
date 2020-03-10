Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr60074.outbound.protection.outlook.com ([40.107.6.74]:41383
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726480AbgCJUeM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 16:34:12 -0400
From: Mikhail Petrov <Mikhail.Petrov@mir.dev>
Subject: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
Message-ID: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
Date: Tue, 10 Mar 2020 23:34:03 +0300
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

There is the code in the read_symbol function in 'scripts/kallsyms.c':

	if (is_ignored_symbol(name, type))
		return NULL;

	/* Ignore most absolute/undefined (?) symbols. */
	if (strcmp(name, "_text") == 0)
		_text = addr;

But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.

It makes the wrong kallsyms_relative_base symbol as a result of the code:

	if (base_relative) {
		output_label("kallsyms_relative_base");
		output_address(relative_base);
		printf("\n");
	}

Because the output_address function uses the _text variable.

So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:

	Call Trace:
	[aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
	[aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
	[aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
	[aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
	[aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010

The right stack trace:

	Call Trace:
	[aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
	[aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
	[aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
	[aa095f28] [80002ed0] kernel_init+0x14/0x124
	[aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c

Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>

---

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0133dfaaf352..3e8dea6e0a95 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -195,13 +195,13 @@ static struct sym_entry *read_symbol(FILE *in)
 		return NULL;
 	}
 
-	if (is_ignored_symbol(name, type))
-		return NULL;
-
-	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(name, "_text") == 0)
 		_text = addr;
 
+	/* Ignore most absolute/undefined (?) symbols. */
+	if (is_ignored_symbol(name, type))
+		return NULL;
+
 	check_symbol_range(name, addr, text_ranges, ARRAY_SIZE(text_ranges));
 	check_symbol_range(name, addr, &percpu_range, 1);
 
