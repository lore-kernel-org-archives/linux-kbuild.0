Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65529 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752325AbdK0Vem (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:42 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 14/21] lto, fs: Avoid static variable in linux/fs.h
Date: Mon, 27 Nov 2017 13:34:16 -0800
Message-Id: <20171127213423.27218-15-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, viro@zeniv.linux.org.uk

From: Andi Kleen <ak@linux.intel.com>

linux/fs.h has a initialized static variable kernel_read_file_str. It doesn't
make much sense to have a static variable in a frequently included
header file. With LTO -fno-toplevel-reorder gcc is unable to eliminate
it, which leads to a lot of unnecessary duplicated copies.

Move the static into the scope of the only inline that uses it,
this tells the compiler enough to not duplicate it. Right now
the inline is only called from one place, so that is ok. If it was
called from more places would need to move it somewhere else
to avoid unnecessary copies.

With LTO this avoids ~100k unnecessary data segment for a x86 defconfig
build. Even without LTO it doesn't make any sense.

Cc: viro@zeniv.linux.org.uk
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/fs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 2995a271ec46..2f02f1c991c9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2821,12 +2821,12 @@ enum kernel_read_file_id {
 	__kernel_read_file_id(__fid_enumify)
 };
 
-static const char * const kernel_read_file_str[] = {
-	__kernel_read_file_id(__fid_stringify)
-};
-
 static inline const char *kernel_read_file_id_str(enum kernel_read_file_id id)
 {
+	static const char * const kernel_read_file_str[] = {
+		__kernel_read_file_id(__fid_stringify)
+	};
+
 	if ((unsigned)id >= READING_MAX_ID)
 		return kernel_read_file_str[READING_UNKNOWN];
 
-- 
2.13.6

