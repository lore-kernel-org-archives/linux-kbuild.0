Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE703CF1FD;
	Thu,  8 Oct 2026 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501554; cv=none; b=u5ZdOo/Wlr7Wuf9m7xp0H26XPeMPglBKk88rUkSxc6NCu3fuvivX9mxvKq1K2zi43/heSgodzEScvMflnZYJIpeQT465Bu8txSXEdJ/Jrk9B1Ea4MPnN5R5zF1sen1t+4KNW2O4O/cH+5IUasmBi1Dz+NwlOCKMEMa+v8ZQjesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501554; c=relaxed/simple;
	bh=sJZ9iI2OBVMZQ6uas4qKKHLaJ2Mw87YO8PArfwZrhho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A7PnO/iz/L3bei7NUwlwKZjWjscldALyT/jg5/vlrZRyKM4nIX24OR+c0/Wa+54CgDJforxo8aO+QFE7pRFU3P57T2e/17ha8BiAt+GEmlvVqasE242l6TPbeVf5YIyLrdA/2VyQ7k6nIjxTQrEepknzdttT2XyFAuHFUQ6tZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYuibeKK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYuibeKK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B234C2BCC7;
	Thu,  8 Oct 2026 23:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791501554;
	bh=sJZ9iI2OBVMZQ6uas4qKKHLaJ2Mw87YO8PArfwZrhho=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bYuibeKKrN61mIhefVBiQiBh6p4LeQqFGoeLCWQROc41szOx/vFw5RDNPvh0NoV9K
	 pBDCZ/8Kx4k9JuEhR/7q2xU/MP52wjdHY0TFDP4bIOkOZIy8jWjDoZvGiXE6X0SzAM
	 TQt00TkK5xOaFRfJ27FIrT5/5fhhltJ1neeJuNhQp2Jl7pNId5y5cdkJhDZQKkcsal
	 bL1THCDQGEhbwhaw3DJb2Er1bUvYt3tmP1DObOJjFgsWABayfejxkK+wAmDU/Y7TPM
	 szRvLXroO3Cmzg8CSfbfgk5fE/qLAa3TAVXmVkrHjfekdIxk707NB+K5/NIpafQJ4S
	 vMr6FKoK2yhIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146EBCA6015;
	Thu,  8 Oct 2026 23:19:14 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Thu, 08 Oct 2026 17:19:12 -0600
Subject: [PATCH] kallsyms: copy constants from __KERNEL__ to user, drop the
 inclusion
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-fix-kallsyms-v1-1-3339fdac2ab3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwML3bTMCt3sxJyc4srcYl1Di1TTRPO0FINUQ0sloJaColSgPNi46Nj
 aWgDLftQFXgAAAA==
X-Change-ID: 20261008-fix-kallsyms-18e5a7fd0e19
To: Nathan Chancellor <nathan@kernel.org>, 
 Denis Benato <denis.benato@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
 nsc@kernel.org, thomas.weissschuh@linutronix.de, chewi@gentoo.org, 
 abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>
Cc: Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791501553; l=2787;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=z/zMb6gglj4i+RtKQgtFQzYsPU9iLgw6hWdsZL1e5CU=;
 b=3rQyAReRHr4iktxRBcBRvu5BizvjCeAWGLqZJ9wA4TRcvlI0ImgnY2xQtump+TtLidfYDSkVr
 665vA50YLZoBKntKjdPfhSgDoj7T2PRAGX3QjmaVbT/T9a4iVjfWoJU
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Reply-To: jim.cromie@gmail.com

From: Jim Cromie <jim.cromie@gmail.com>

commit 4fafd1165b33 replaced hardcoded values which determine marker
array size, with new values that accelerate symbol-name lookups.
These symbols are needed in user-space to generate the lookup tables,
and in kernel to read the generated table.

To avoid 2-defns problem, they were added to a kernel header (with
ifdef guards) and included by scripts/kallsyms.c.  But that creates
packaging problems elsewhere, so just add the 2nd defns, with an
explicit comment about the user-kernel coupling.

Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 kernel/kallsyms_internal.h | 12 +++++-------
 scripts/kallsyms.c         |  9 ++++++++-
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 6a781e4cc77f..8311cce21128 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -2,18 +2,17 @@
 #ifndef LINUX_KALLSYMS_INTERNAL_H_
 #define LINUX_KALLSYMS_INTERNAL_H_
 
+#include <linux/types.h>
+
 /*
- * Provide compile-constants for scripts/kallsyms.c
- * so it can build the corresponding kallsyms_marker[] table.
- * and wrap the rest in __KERNEL__
+ * These constants determine the size of the kallsyms_markers array
+ * written by scripts/kallsyms.c during the build.  The symbol values
+ * must be kept in sync.
  */
 #define KALLSYMS_MARKER_SHIFT 4
 #define KALLSYMS_MARKER_SIZE  (1U << KALLSYMS_MARKER_SHIFT)
 #define KALLSYMS_MARKER_MASK  (KALLSYMS_MARKER_SIZE - 1U)
 
-#ifdef __KERNEL__
-#include <linux/types.h>
-
 extern const int kallsyms_offsets[];
 extern const u8 kallsyms_names[];
 
@@ -24,6 +23,5 @@ extern const u16 kallsyms_token_index[];
 
 extern const unsigned int kallsyms_markers[];
 extern const u8 kallsyms_seqs_of_names[];
-#endif /* __KERNEL__ */
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index be42a9111350..d142f040ad92 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -29,7 +29,14 @@
 
 #include <xalloc.h>
 
-#include "../kernel/kallsyms_internal.h"
+/*
+ * These constants determine the size of the marker array filled here,
+ * and they're duplicated in kernel/kallsyms.c, where they're used in
+ * get_symbol_offset().  They must be kept in agreement.
+ */
+#define KALLSYMS_MARKER_SHIFT 4
+#define KALLSYMS_MARKER_SIZE  (1U << KALLSYMS_MARKER_SHIFT)
+#define KALLSYMS_MARKER_MASK  (KALLSYMS_MARKER_SIZE - 1U)
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
 

---
base-commit: b9c9b9eb732aefcd02bbc211b2570a2315a889da
change-id: 20261008-fix-kallsyms-18e5a7fd0e19

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


