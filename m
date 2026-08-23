Received: from mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74B126299
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787478623; cv=none; b=c2cPL/Ua+W38viFD2EvjkqZUDZgOV+NRxE04s4/j8/1dQ54mdXK7vSnLWH3pQsWL7pfUcrHBGQYKEIlAx9jlo3lCbuh0JSqIlaEYMVGTXgTwa299wTH8K4Kgnz3zM7QtKYVUlq/GzHcyg656DRy2A/hXR/W7Gv2sllCLic/F/z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787478623; c=relaxed/simple;
	bh=+dOKv6BitXrrWcEMIFlt8ELgiy+e7BvkjeNNID8iu/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLE5bcqD3u5yUJRxGbJAsUuJoq4pLBPMhjFNjGX3ZVkzeQtGRBZgLof4Io4BGDtYkjGF/BVWebzwpvESIF2/eDZJMcUYJFZTcnbQqZAQrxhVjBRBrfA0Kfs2AXceQTe6Qtk//f6tJHXh8RTJC6aRjZVhZo/KUUfgpCfQKe4G6Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JoyBVq6v; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JoyBVq6v"
X-Envelope-To: linux-kbuild@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+dOKv6BitXrrWcEMIFlt8ELgiy+e7BvkjeNNID8iu/A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787478617; v=1; x=1788083417;
 b=JoyBVq6v0BDpldfM6AaNwJZaAo4V6EU5HuN0wv0k3iY8t+sy24meLB9nloU3EMBRc6zk227e
 3jZqIXnXIXMtC1UeAMWfk5nk9fQuyJhhhpaCmv2YjCcxc28uDRD4vJGp/aB+be1ZrzmHd4UjPME
 4bB7RZLQoMhS4oYoIoJr+aNI=
X-Envelope-To: linux-kbuild@vger.kernel.org
Received: from nixos (149.28.209.68)
	by smtp.migadu.com with ESMTPS id 3eff0bb7133e5f9c;
	Sun, 23 Aug 2026 09:50:17 +0000
X-Mizu-Trace-ID: 3eff0bb7133e5f9c
X-Migadu-Flow: FLOW_OUT
From: Yuntao Wang <yuntao.wang@linux.dev>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yuntao Wang <yuntao.wang@linux.dev>
Subject: [PATCH] setlocalversion: make tag local to try_tag()
Date: Sun, 23 Aug 2026 17:49:13 +0800
Message-ID: <20260823094913.421144-1-yuntao.wang@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tag variable is only used by try_tag(), but is currently declared
local to scm_version() and modified by try_tag().

Make tag local to try_tag() instead and remove the unused declaration
from scm_version().

No functional changes.

Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>
---
 scripts/setlocalversion | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 28169d7e143b..f264c2460ad7 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -33,7 +33,7 @@ if test $# -gt 0 -o ! -d "$srctree"; then
 fi
 
 try_tag() {
-	tag="$1"
+	local tag="$1"
 
 	# Is $tag an annotated tag?
 	if [ "$(git cat-file -t "$tag" 2> /dev/null)" != tag ]; then
@@ -59,7 +59,6 @@ scm_version()
 {
 	local short=false
 	local no_dirty=false
-	local tag
 
 	while [ $# -gt 0 ];
 	do
-- 
2.55.0

