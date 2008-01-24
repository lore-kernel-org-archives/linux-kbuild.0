Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37448 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759059AbYAXWDy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:54 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 25/77] kbuild: fix installing external modules
Date: Thu, 24 Jan 2008 23:03:06 +0100
Message-Id: <1201212238-4369-25-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Eric Sandeen <sandeen@redhat.com>

Eric Sandeen <sandeen@redhat.com> reported:
  Installing external modules is supposed to put them in some path
  under /lib/modules/<version>/extra/subdir/, but this change:
  http://linux.bkbits.net:8080/linux-2.6/?PAGE=cset&REV=1.1982.9.23
  makes them go under /lib/modules/<version>/extrasubdir

 (for example, make M=fs/ext3 modules_install puts ext3.ko in
 /lib/modules/<version>/extrafs/ext3.ko)

This was the case only when specifying a trailing slash to M=..

Fixed by removing trailing slash if present so
we correctly match dir part of target.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Eric Sandeen <sandeen@redhat.com>
---
 scripts/Makefile.modinst |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index f0ff248..efa5d94 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -21,7 +21,7 @@ quiet_cmd_modules_install = INSTALL $@
 
 # Modules built outside the kernel source tree go into extra by default
 INSTALL_MOD_DIR ?= extra
-ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(KBUILD_EXTMOD),,$(@D))
+ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst %/,%,$(KBUILD_EXTMOD)),,$(@D))
 
 modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
 
-- 
1.5.4.rc3.14.g44397

