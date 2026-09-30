Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6135E1C5
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2026 01:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733585; cv=none; b=hHY6lUYFD8nWL8mU9kN/An9c26rnkc5Gt+UFwIPwF1plkJhIF5lxgbj/8Z+L5mGPqCeBTcB84NOClVBP3MaKg3tJ1J8z+WFt9a3mSbNZzAKxjEx4uSLrPURZTL40+JRrbrbKjOXmdQpFf3JQ3x3/o8oYdiVJkNZOTfs2G0e5YWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733585; c=relaxed/simple;
	bh=ZSpwe7rsVqJAy+Ym7JWQyKwbpk/MrY90addnSZTlJ1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6pKK7lQnWMZQuziDHLgKnzU1Q43c3ACJXI9SYH3JBSKkbfPMV5GWH3V75q3yfl1o3Fd30Z8HLl+leRAKpryduh6RgjZ3lwBU+BaGFlVxE2xLYW2Mp9vWIxOGaA4lwrCRoD7iDINPDRGhd+urTP+gYPct8dOyr2mO75v1Kyr1pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OSFDdqjQ; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OSFDdqjQ"
X-Envelope-To: linux-kbuild@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZSpwe7rsVqJAy+Ym7JWQyKwbpk/MrY90addnSZTlJ1Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790733582; v=1; x=1791338382;
 b=OSFDdqjQb/XAfR6rHlhRygCQd31jjeZX7hKfGAI+U3m4uKqpDMOLMCOf//hTV/SDsvgz+33W
 GwlYH/Kyf/c4IWQwWnjru3Wddz1tq31PLpBX400avzrMb6tpQH58qfNtzXS4S9cMbKLmiPNActR
 /T5gN4djGiQb40MwaJnG25Sk=
X-Envelope-To: linux-kbuild@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4a8f199eb519d264;
	Wed, 30 Sep 2026 01:59:42 +0000
X-Mizu-Trace-ID: 4a8f199eb519d264
X-Migadu-Flow: FLOW_OUT
From: Yuntao Wang <yuntao.wang@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuntao Wang <yuntao.wang@linux.dev>
Subject: [PATCH] init: simplify initramfs.o build rule
Date: Wed, 30 Sep 2026 09:57:48 +0800
Message-ID: <20260930015748.311366-1-yuntao.wang@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_BLK_DEV_INITRD is known to be enabled in the else branch,
so there is no need to use obj-$(CONFIG_BLK_DEV_INITRD). Use obj-y
directly to make the build rule clearer.

Also, reorder the condition to make the code easier to follow.

No functional change.

Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>
---
 init/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/Makefile b/init/Makefile
index d6f75d8907e0..9102fc34c0cc 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -6,10 +6,10 @@
 ccflags-y := -fno-function-sections -fno-data-sections
 
 obj-y                          := main.o version.o mounts.o
-ifneq ($(CONFIG_BLK_DEV_INITRD),y)
-obj-y                          += noinitramfs.o
+ifeq ($(CONFIG_BLK_DEV_INITRD),y)
+obj-y                          += initramfs.o
 else
-obj-$(CONFIG_BLK_DEV_INITRD)   += initramfs.o
+obj-y                          += noinitramfs.o
 endif
 obj-$(CONFIG_GENERIC_CALIBRATE_DELAY) += calibrate.o
 obj-$(CONFIG_INITRAMFS_TEST)   += initramfs_test.o
-- 
2.55.0

