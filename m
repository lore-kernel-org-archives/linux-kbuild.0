Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F137E5FB
	for <linux-kbuild@vger.kernel.org>; Sun, 13 Sep 2026 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789282182; cv=none; b=j+g5WJcE/c61gLUddTov6u10Nil1dR8cmm1yRwTCrx6kIYcYdyq6bqPJDDmdz5IN35fkJE1/oe97ZIxW0FqD8dXHmu7YyGXelo39IcacuZASMFc1Li+5npx4FZCyrn6R+0hkvl/hSzLYe1HbrqhK2AiWNIguOrYQ3e/vXkkpAZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789282182; c=relaxed/simple;
	bh=vjZSKuHECzV+0pzV4P8N9/rj79FJTS2d6LlzCI8jVEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r//ciYN4tWiZlO3+37Adut9xL4Dei3udlgxr4qL3SVzgdPd3rx+/5/4E8F4mbaNi/xlB2Br8Tzu6EgzpMcrtsg+xntK9H8fFzBr25ZHueFsGqoJ7CwC1vDHVB1LcglJ4Y1/nrsf5tonCE0nZTWOxX4VCWHb9UMpBOVfb6HPRxhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xxwse7mb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xxwse7mb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3951F000FF;
	Sun, 13 Sep 2026 06:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789282181;
	bh=znh8b2lOVA0xNd+DxNRhTauvtD0i2JHiMdhUGFH57hI=;
	h=From:To:Cc:Subject:Date;
	b=Xxwse7mbE9H2fmxssGThjrVPXX5oXjQYzwLQhnMAHH6ECpNeUyEGARiSh+1dPAfQE
	 wXCpDlnSg9gtbmxmWI36uo7o34qfE1LeeWi2MhYNCQXFDyIphi+pcEOtZe/Misvq90
	 6rqLbQcoDGBDmjPZSjBPvNWl4ZjzZZUeVUvye7Xvzbbl8ZeApNSTmob/MlqLx6mleM
	 JBLdDyTQwwleSulpzbzh9W+95i9aizszkK/EpHE27Ph6XmPkBCGg+4pSDE6CCZxfGD
	 MCQZPdg7etxJSsmoWQlMPtHdgcOUvih7mmrESdn+jzePOHb9w6ldJib5udYXNVbB9b
	 JagDCwsjaZ1hg==
From: Geliang Tang <geliang@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Geliang Tang <tanggeliang@kylinos.cn>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: quote glob pattern in find command for asm-headers
Date: Sun, 13 Sep 2026 14:49:14 +0800
Message-ID: <f54cae8e7da612ad558154706ce2e99f98d136c4.1789282037.git.tanggeliang@kylinos.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geliang Tang <tanggeliang@kylinos.cn>

The find command in Makefile.asm-headers uses an unquoted *.h glob
pattern inside $(shell ...):

  old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)

Since $(shell ...) runs in the build output directory, the shell
expands *.h against the current directory before passing arguments
to find. When the output directory contains .h files (e.g. stale
BPF skeleton headers), this produces:

  find: paths must precede expression: `xxx.skel.h'
  find: possible unquoted pattern after predicate `-name'?

Quote the glob pattern as '*.h' so that it is passed literally to
find, which will then expand it internally against $(obj).

Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
---
 scripts/Makefile.asm-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index b38931314ad7..9db8ab0145a4 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -48,7 +48,7 @@ syscall-y   := $(addprefix $(obj)/, $(syscall-y))
 generated-y := $(addprefix $(obj)/, $(generated-y))
 
 # Remove stale wrappers when the corresponding files are removed from generic-y
-old-headers := $(shell test -d $(obj) && find $(obj) -name *.h)
+old-headers := $(shell test -d $(obj) && find $(obj) -name '*.h')
 unwanted    := $(filter-out $(generic-y) $(generated-y) $(syscall-y),$(old-headers))
 
 filechk_wrap = echo "\#include <asm-generic/$*.h>"
-- 
2.53.0

