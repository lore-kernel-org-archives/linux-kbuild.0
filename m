Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:53518 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752854AbdK0Veg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:36 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 10/21] Fix read buffer overflow in delta-ipc
Date: Mon, 27 Nov 2017 13:34:12 -0800
Message-Id: <20171127213423.27218-11-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, hugues.fruchet@st.com, mchehab@s-opensource.com

From: Andi Kleen <ak@linux.intel.com>

The single caller passes a string to delta_ipc_open, which copies with a
fixed size larger than the string. So it copies some random data after
the original string the ro segment.

If the string was at the end of a page it may fault.

Just copy the string with a normal strcpy after clearing the field.

Found by a LTO build (which errors out)
because the compiler inlines the functions and can resolve
the string sizes and triggers the compile time checks in memcpy.

In function ‘memcpy’,
    inlined from ‘delta_ipc_open.constprop’ at linux/drivers/media/platform/sti/delta/delta-ipc.c:178:0,
    inlined from ‘delta_mjpeg_ipc_open’ at linux/drivers/media/platform/sti/delta/delta-mjpeg-dec.c:227:0,
    inlined from ‘delta_mjpeg_decode’ at linux/drivers/media/platform/sti/delta/delta-mjpeg-dec.c:403:0:
/home/andi/lsrc/linux/include/linux/string.h:337:0: error: call to ‘__read_overflow2’ declared with attribute error: detected read beyond size of object passed as 2nd parameter
    __read_overflow2();

Cc: hugues.fruchet@st.com
Cc: mchehab@s-opensource.com
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/platform/intel-mid/device_libs/platform_bt.c | 2 +-
 certs/blacklist_nohashes.c                            | 2 +-
 drivers/media/platform/sti/delta/delta-ipc.c          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
index dc036e511f48..2b5d86ce24c2 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
@@ -60,7 +60,7 @@ static int __init tng_bt_sfi_setup(struct bt_sfi_data *ddata)
 	return 0;
 }
 
-static const struct bt_sfi_data tng_bt_sfi_data __initdata = {
+static const struct bt_sfi_data tng_bt_sfi_data __initconst = {
 	.setup	= tng_bt_sfi_setup,
 };
 
diff --git a/certs/blacklist_nohashes.c b/certs/blacklist_nohashes.c
index 73fd99098ad7..753b703ef0ef 100644
--- a/certs/blacklist_nohashes.c
+++ b/certs/blacklist_nohashes.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "blacklist.h"
 
-const char __initdata *const blacklist_hashes[] = {
+const char __initconst *const blacklist_hashes[] = {
 	NULL
 };
diff --git a/drivers/media/platform/sti/delta/delta-ipc.c b/drivers/media/platform/sti/delta/delta-ipc.c
index 41e4a4c259b3..b6c256e3ceb6 100644
--- a/drivers/media/platform/sti/delta/delta-ipc.c
+++ b/drivers/media/platform/sti/delta/delta-ipc.c
@@ -175,8 +175,8 @@ int delta_ipc_open(struct delta_ctx *pctx, const char *name,
 	msg.ipc_buf_size = ipc_buf_size;
 	msg.ipc_buf_paddr = ctx->ipc_buf->paddr;
 
-	memcpy(msg.name, name, sizeof(msg.name));
-	msg.name[sizeof(msg.name) - 1] = 0;
+	memset(msg.name, 0, sizeof(msg.name));
+	strcpy(msg.name, name);
 
 	msg.param_size = param->size;
 	memcpy(ctx->ipc_buf->vaddr, param->data, msg.param_size);
-- 
2.13.6

