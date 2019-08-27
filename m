Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:4154 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbfH0LOu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 07:14:50 -0400
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] modpost: add guid_t type definition
Date: Tue, 27 Aug 2019 14:14:37 +0300
Message-Id: <20190827111437.22000-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Since guid_t is the recommended data type for UUIDs in
kernel (and I guess uuid_le is meant to be ultimately
replaced with it), it should be made available here as
well.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 scripts/mod/file2alias.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index e17a29ae2e97..c91eba751804 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -34,6 +34,11 @@ typedef Elf64_Addr	kernel_ulong_t;
 typedef uint32_t	__u32;
 typedef uint16_t	__u16;
 typedef unsigned char	__u8;
+typedef struct {
+	__u8 b[16];
+} guid_t;
+
+/* backwards compatibility, don't use in new code */
 typedef struct {
 	__u8 b[16];
 } uuid_le;
-- 
2.23.0.rc1
