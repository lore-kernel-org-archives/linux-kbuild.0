Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:51339 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751711AbeBBQVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:22 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/7] [HACK] x86: crypto: fix link error with LTO
Date: Fri,  2 Feb 2018 17:21:00 +0100
Message-Id: <20180202162104.2300532-3-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

crypto_it_tab and the other symbols like it are defined in
crypto/aes_generic.c and exported for loadable modules. When
building with LTO and CONFIG_TRIM_UNUSED_KSYMS, the exports
are eliminated, since kbuild fails to take the users in
the arch/x86/crypto/aes-i586-asm_32.S assembler file into
account.

This adds an ugly workaround by adding a reference to each symbol
into aes_glue.c, which gets linked together with the assembler
file.

We obviously want to fix the CONFIG_TRIM_UNUSED_KSYMS logic
to do the right thing here instead, but I couldn't come up
with a good fix, so I use this instead to get a clean build
for testing.

This fix only works most of the time, but I still ran into
some cases where combining an .S with a .c file did not
produce the correct .ko file, as the lto linker apparently
did not expect that kind of input. 'nm' on the file after
'ld -r' showed only the contents of the assembler file, and
after the lto-ld stage, only the contents of the .c file
are there.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/crypto/aes_glue.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/crypto/aes_glue.c b/arch/x86/crypto/aes_glue.c
index e26984f7ab8d..6da3e3c34a77 100644
--- a/arch/x86/crypto/aes_glue.c
+++ b/arch/x86/crypto/aes_glue.c
@@ -53,6 +53,11 @@ static struct crypto_alg aes_alg = {
 
 static int __init aes_init(void)
 {
+	/* ugly hack to force a link time dependency */
+	if (&crypto_it_tab == &crypto_ft_tab ||
+	    &crypto_fl_tab == &crypto_il_tab)
+		return 0;
+
 	return crypto_register_alg(&aes_alg);
 }
 
-- 
2.9.0

