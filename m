Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36533 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:51:04 -0400
From: Alexander Popov <alex.popov@linux.com>
Subject: [PATCH 3/5] gcc-plugins/stackleak: Add 'verbose' plugin parameter
Date: Thu,  4 Jun 2020 16:49:55 +0300
Message-Id: <20200604134957.505389-4-alex.popov@linux.com>
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, Sven Schnelle <svens@stackframe.org>, Iurii Zaikin <yzaikin@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Collingbourne <pcc@google.com>, Naohiro Aota <naohiro.aota@wdc.com>, Alexander Monakov <amonakov@ispras.ru>, Mathias Krause <minipli@googlemail.com>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, Laura Abbott <labbott@redhat.com>, Florian Weimer <fweimer@redhat.com>, Alexander Popov <alex.popov@linux.com>, kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc: notify@kernel.org

Add 'verbose' plugin parameter for stackleak gcc plugin.
It can be used for printing additional info about the kernel code
instrumentation.

For using it add the following to scripts/Makefile.gcc-plugins:
  gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
    += -fplugin-arg-stackleak_plugin-verbose

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 scripts/gcc-plugins/stackleak_plugin.c | 31 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/scripts/gcc-plugins/stackleak_plugin.c b/scripts/gcc-plugins/stackleak_plugin.c
index 0769c5b9156d..19358712d4ed 100644
--- a/scripts/gcc-plugins/stackleak_plugin.c
+++ b/scripts/gcc-plugins/stackleak_plugin.c
@@ -33,6 +33,8 @@ __visible int plugin_is_GPL_compatible;
 static int track_frame_size = -1;
 static bool build_for_x86 = false;
 static const char track_function[] = "stackleak_track_stack";
+static bool disable = false;
+static bool verbose = false;
 
 /*
  * Mark these global variables (roots) for gcc garbage collector since
@@ -45,6 +47,7 @@ static struct plugin_info stackleak_plugin_info = {
 	.help = "track-min-size=nn\ttrack stack for functions with a stack frame size >= nn bytes\n"
 		"arch=target_arch\tspecify target build arch\n"
 		"disable\t\tdo not activate the plugin\n"
+		"verbose\t\tprint info about the instrumentation\n"
 };
 
 static void add_stack_tracking_gcall(gimple_stmt_iterator *gsi)
@@ -98,6 +101,10 @@ static tree get_current_stack_pointer_decl(void)
 		return var;
 	}
 
+	if (verbose) {
+		fprintf(stderr, "stackleak: missing current_stack_pointer in %s()\n",
+			DECL_NAME_POINTER(current_function_decl));
+	}
 	return NULL_TREE;
 }
 
@@ -366,6 +373,7 @@ static bool remove_stack_tracking_gasm(void)
  */
 static unsigned int stackleak_cleanup_execute(void)
 {
+	const char *fn = DECL_NAME_POINTER(current_function_decl);
 	bool removed = false;
 
 	/*
@@ -376,11 +384,17 @@ static unsigned int stackleak_cleanup_execute(void)
 	 * For more info see gcc commit 7072df0aae0c59ae437e.
 	 * Let's leave such functions instrumented.
 	 */
-	if (cfun->calls_alloca)
+	if (cfun->calls_alloca) {
+		if (verbose)
+			fprintf(stderr, "stackleak: instrument %s() old\n", fn);
 		return 0;
+	}
 
-	if (large_stack_frame())
+	if (large_stack_frame()) {
+		if (verbose)
+			fprintf(stderr, "stackleak: instrument %s()\n", fn);
 		return 0;
+	}
 
 	if (lookup_attribute_spec(get_identifier("no_caller_saved_registers")))
 		removed = remove_stack_tracking_gasm();
@@ -506,9 +520,6 @@ __visible int plugin_init(struct plugin_name_args *plugin_info,
 
 	/* Parse the plugin arguments */
 	for (i = 0; i < argc; i++) {
-		if (!strcmp(argv[i].key, "disable"))
-			return 0;
-
 		if (!strcmp(argv[i].key, "track-min-size")) {
 			if (!argv[i].value) {
 				error(G_("no value supplied for option '-fplugin-arg-%s-%s'"),
@@ -531,6 +542,10 @@ __visible int plugin_init(struct plugin_name_args *plugin_info,
 
 			if (!strcmp(argv[i].value, "x86"))
 				build_for_x86 = true;
+		} else if (!strcmp(argv[i].key, "disable")) {
+			disable = true;
+		} else if (!strcmp(argv[i].key, "verbose")) {
+			verbose = true;
 		} else {
 			error(G_("unknown option '-fplugin-arg-%s-%s'"),
 					plugin_name, argv[i].key);
@@ -538,6 +553,12 @@ __visible int plugin_init(struct plugin_name_args *plugin_info,
 		}
 	}
 
+	if (disable) {
+		if (verbose)
+			fprintf(stderr, "stackleak: disabled for this translation unit\n");
+		return 0;
+	}
+
 	/* Give the information about the plugin */
 	register_callback(plugin_name, PLUGIN_INFO, NULL,
 						&stackleak_plugin_info);
-- 
2.25.2
