Received: from mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7390A4DD3C9
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230501; cv=none; b=mYEIzyOvcHZMiq41b3c/XyksfBO0RatE3yAa/R99wT9HWfi6f+zPISXKvu8mkTvMYyWbB0Ovmei51XS0Zut9kefVZKk1oSJutqDjkJja5iHaRfrwQTnStO+sVOJzIYjbLUAFsb6BYl77Tl5o4yktpStmloVEcRq/NO3210+UXeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230501; c=relaxed/simple;
	bh=pxNRpQR1aM1prySYd9a9xcqeZnHu3QNp3wCGlteiBH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7N70pVjHUTXIwAFn/RCCxwBBSGXldugPNbGm/budSn64qXs46M1yQkWCj2/6vKOl2Us7f95ox6Wmj1Cdc94jK4SlVdo7Uqx2lZ9YfQ9B5FZ/nLSsP+3NdircO+PaDy0zkDq9xTs9yS7YZM81jmOiOHz38T/8p1qfByjoS+arCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BlHCRwtb; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BlHCRwtb"
X-Envelope-To: linux-kbuild@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pxNRpQR1aM1prySYd9a9xcqeZnHu3QNp3wCGlteiBH4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791230489; v=1; x=1791835289;
 b=BlHCRwtbIPOi+ofW3nlEQk8OEogEtlqBDC9jxMp9gUgLpd0tCV9NaS0b6Tq5j/fl7558srWf
 oLKwFshu/s3RwI4wMlAtpbKL5zdUlcgw4c53pKLbV4soebLSHIwGoAV9xtg+5XbYsCIu7tKieKf
 wiSk86j9HEvueI2DJjoxuCRo=
X-Envelope-To: linux-kbuild@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0542c9c1650a45ee;
	Mon, 05 Oct 2026 20:01:29 +0000
X-Mizu-Trace-ID: 0542c9c1650a45ee
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kbuild@vger.kernel.org
Cc: nathan@kernel.org,
	nsc@kernel.org,
	thomas.weissschuh@linutronix.de,
	chewi@gentoo.org,
	abelvesa@kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] kbuild: install-extmod-build: install kernel/kallsyms_internal.h
Date: Mon,  5 Oct 2026 20:01:23 +0000
Message-ID: <20261005200123.146822-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tree staged by install-extmod-build contains no kernel/ files, but
since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:1
to accelerate lookups") scripts/kallsyms.c includes
../kernel/kallsyms_internal.h.

install-extmod-build rebuilds the host programs inside the staged tree
whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped CC).
scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:

  scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_internal.h' file not found
     39 | #include "../kernel/kallsyms_internal.h"
        |          ^~~~~~~

Stage the header so the linux-headers-* and kernel-devel style packages
can rebuild scripts/kallsyms.

Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
Assisted-by: ZCode:glm-5.3
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 scripts/package/install-extmod-build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index f12e1ffe409eb..aad2cd59a37ba 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -20,6 +20,8 @@ mkdir -p "${destdir}"
 (
 	cd "${srctree}"
 	echo Makefile
+	# scripts/kallsyms.c includes this header
+	echo kernel/kallsyms_internal.h
 	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
 	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
 	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
-- 
2.47.3

