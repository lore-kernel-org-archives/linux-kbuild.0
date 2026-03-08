Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D135DA71;
	Sun,  8 Mar 2026 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773005052; cv=none; b=elCsm+xKifKQjLAU8Iqs76l+adPkE11K6uumSPLemfhEemNCwz/NRcPR/0PK/LTIga/o3aTmJYrAz+kFlcvd0Paqyzn0Of3kw+WPbmtdqiRUlhrAT7NPtpwVBTtGbz7vGCO7ecZggDAB5D8gkAly+sDKUJ+6Vb/iZ+egmfkw5WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773005052; c=relaxed/simple;
	bh=8Xb6jJpdwO7R7c+RLnF9gP8gw2AUKUlOxUqqqcY0FA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCKjDCGWqZDmxU16bIO58ctovH1hXDAl1qlOEARWLAaYR9yLS1c5QTOK6zIXKT0qfdSS7L6IrL/vVo6lmFL3u9n9zh29chwmWUhL6PkiYz6GcyyWB1ETlEqUQF2Vm09J5q9WJJJWz81PAMRLofrCLGmOa0mkJXKOKkBIcR7ifbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JK1d4TOc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JK1d4TOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1773005046;
	bh=8Xb6jJpdwO7R7c+RLnF9gP8gw2AUKUlOxUqqqcY0FA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JK1d4TOcFfLslpBSbnx/9uF72ChMsLValB48qh2RwiP4xT9IrA8cGGQkSMy/Tgl4t
	 jfb4IFmd2WbyjXn7roSYU0vsrNRlyVJQjxghHHj8eeshbvkLf4+FABHw0VFr+4FZge
	 2bvgvNSFuOrWUh4wjZNOAHRZIoXudVTkdzXGYrbM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Mar 2026 22:24:05 +0100
Subject: [PATCH RFC 5/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260308-kbuild-uapi-c-v1-5-86aae09a7f1d@weissschuh.net>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
In-Reply-To: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Howells <dhowells@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773005045; l=2840;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8Xb6jJpdwO7R7c+RLnF9gP8gw2AUKUlOxUqqqcY0FA0=;
 b=0Wxl00PsQjn++HA/NrUflyKm0sM7sHvgM9X/ELqGnNImzexv0Vb+lTWcZZSMOollS4ssaE7BR
 r+ssUz0q7JDCdbz+BzzWTpiMlj5/JS3yfnbVGdTEUbKa9BjvRZ2lLvD
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

C++ language requirements differ from those of C.

Also test the headers against C++ compilers to make sure no errors
creep in accidentally.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 usr/include/Makefile | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index edeaf9d778c4..0e23aeace410 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -10,6 +10,7 @@ UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
 UAPI_ARCH := $(or $(HEADER_ARCH),$(SRCARCH))
 
 override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
+cxx_flags = $(filter-out -Wmissing-prototypes -Wstrict-prototypes -std=%, $(KBUILD_USERCFLAGS)) -std=c++98
 
 # The following are excluded for now because they fail to build.
 #
@@ -61,6 +62,27 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 no-header-test += asm-generic/%
 
+# The following are not compatible with C++.
+#
+# Do not add a new header to the list without legitimate reason.
+# Please consider to fix the header first.
+#
+# Sorted alphabetically.
+no-header-test-cxx += linux/auto_dev-ioctl.h
+no-header-test-cxx += linux/map_to_14segment.h
+no-header-test-cxx += linux/map_to_7segment.h
+no-header-test-cxx += linux/netfilter/xt_sctp.h
+no-header-test-cxx += linux/target_core_user.h
+no-header-test-cxx += linux/vhost.h
+no-header-test-cxx += linux/vhost_types.h
+no-header-test-cxx += linux/virtio_net.h
+no-header-test-cxx += linux/virtio_ring.h
+no-header-test-cxx += scsi/fc/fc_els.h
+
+ifeq ($(UAPI_ARCH),x86)
+no-header-test-cxx += asm/elf.h
+endif
+
 # The following are using libc header and types.
 #
 # Do not add a new header to the list without legitimate reason.
@@ -138,8 +160,12 @@ endif
 
 always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
+# $(cc-option) forces '-x c' which breaks '-x c++' detection.
+cc-can-compile-cxx := $(call try-run,$(CC) -c -x c++ /dev/null -o "$$TMP", 1)
+
 target-libc = $(filter $(uses-libc), $*.h)
 target-can-compile = $(filter-out $(no-header-test), $*.h)
+target-can-compile-cxx = $(and $(cc-can-compile-cxx), $(target-can-compile), $(filter-out $(no-header-test-cxx), $*.h))
 
 hdrtest-flags = -fsyntax-only -Werror \
 		-nostdinc -I $(obj) $(if $(target-libc), -I $(srctree)/usr/dummy-include)
@@ -149,6 +175,8 @@ quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) $(hdrtest-flags) -x c /dev/null \
 			$(if $(target-can-compile), -include $< -include $<); \
+		$(if $(target-can-compile-cxx), \
+			$(CC) $(cxx_flags) $(hdrtest-flags) -x c++ /dev/null -include $<;) \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 

-- 
2.53.0

