Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:55899 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbaDUIDR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Apr 2014 04:03:17 -0400
Subject: [PATCH] scripts/tags.sh: ignore code of user space tools
From: Konstantin Khlebnikov <koct9i@gmail.com>
Date: Mon, 21 Apr 2014 12:03:08 +0400
Message-ID: <20140421080308.14562.30914.stgit@zurg>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>

User space code in tools/ often reuses names of kernel constructions,
this confuses navigation in the normal kernel code. Let's fix this mess.

Signed-off-by: Konstantin Khlebnikov <koct9i@gmail.com>
---
 scripts/tags.sh |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index f2c5b00..7f506e0 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -25,6 +25,9 @@ else
 	tree=${srctree}/
 fi
 
+# ignore userspace tools
+ignore="$ignore ( -path ${tree}tools ) -prune -o"
+
 # Find all available archs
 find_all_archs()
 {

