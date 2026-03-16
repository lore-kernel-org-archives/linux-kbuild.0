Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC73CE4B5;
	Mon, 16 Mar 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679929; cv=none; b=BB8gN0SWR4AhoZ8fYMFGeAZu6TC6lOnF/eOS+6oiINoYxhpsjRgZr7yMdO/0h8tz496baudhzwoj8KBhvwHNpOeOCySHTHapRSN0s+yFngHRCnw5hioMH7Gpa2QauzG6q6b5euCNVGR93nq4DgAwSn89QnJltygPhlfZJn2NbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679929; c=relaxed/simple;
	bh=gLGpjutcwzsXPcLImqBkJxEAGC97psYwvwNqYhNwweM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LFS54ZrSC4opIRN9eZvsRShIrjmWkgW6y3NDyOUCuqjMJZ1wI2dLyxzZt9Flv2zoSnwgYFETtyYUwynRbvSjf2xqPPaRlDXBgd7Gf+fdf5Q9heNH7hcSkNqCi/rDQq/9gFV5dj4ni83L9Y9VYJHT37dL0sCF0ZhqC3jCLsUw0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=F/RTx7Ra; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="F/RTx7Ra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773679918;
	bh=gLGpjutcwzsXPcLImqBkJxEAGC97psYwvwNqYhNwweM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F/RTx7RacW5waBmuTTpcGsn8RKec+YSA2YH7Yju/DcJB07SeAta3nAg2mGkyBWRlE
	 S/3INKMTh+fOfp+MYtIBMGM7w4+Uis7WrvGnfbLzukPHEvqc7niiv9aSlmsM/9oKDv
	 C89x5qXSoBigJ6DaM6snDQr2PLtXli/P9qxldU5E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 16 Mar 2026 17:51:59 +0100
Subject: [PATCH v2 2/5] kbuild: uapi: move all include path flags together
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-kbuild-uapi-c-v2-2-35d6d0ed863f@weissschuh.net>
References: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
In-Reply-To: <20260316-kbuild-uapi-c-v2-0-35d6d0ed863f@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773679918; l=1420;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gLGpjutcwzsXPcLImqBkJxEAGC97psYwvwNqYhNwweM=;
 b=ieC6qflpP/h0uMNU+D3WMq8J4cuQJpRGIzyQCSEdiigXPW2afNPa9B0kgxMNqmbJy+7kwYfV4
 xDkKXWNx2lNC7Y0cTUMXCIuNunAUbGRvMRYX6zMEZRncgTkhMIGCl8f
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The argument to add the root of the UAPI header tree to the include path
is separated from the other arguments concerning the include path.

Move all include path arguments together for more consistency and
balanced line lengths.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 0b1c9a4b0477..74f5ba24bb29 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -8,7 +8,7 @@
 # We cannot go as far as adding -Wpedantic since it emits too many warnings.
 UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 
-override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj)
+override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
 
 # The following are excluded for now because they fail to build.
 #
@@ -141,7 +141,7 @@ target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
 
 hdrtest-flags = -fsyntax-only -Werror \
-		-nostdinc $(if $(target-libc), -I $(srctree)/usr/dummy-include)
+		-nostdinc -I $(obj) $(if $(target-libc), -I $(srctree)/usr/dummy-include)
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<

-- 
2.53.0

