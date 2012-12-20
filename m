Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:43895 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751745Ab2LTWI6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Dec 2012 17:08:58 -0500
Received: by mail-we0-f176.google.com with SMTP id r5so1867343wey.35
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Dec 2012 14:08:57 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/2] kconfig: ensure we use proper CONFIG_ prefix
Date: Thu, 20 Dec 2012 23:08:47 +0100
Message-Id: <6a9a981154fd1f3e05f2098eb7bbe5d658cc0e40.1356041188.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356041188.git.yann.morin.1998@free.fr>
References: <cover.1356041188.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1356041188.git.yann.morin.1998@free.fr>
References: <cover.1356041188.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Now that we get the CONFIG_ prefix from the environment, we must
ensure we use the proper prefix in case the user has it set in
the environment.

Simply unexport the CONFIG_ environment variable to fallback to
our hard-coded default.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 5be2ee8..fe20913a 100644
--- a/Makefile
+++ b/Makefile
@@ -233,6 +233,7 @@ hdr-arch  := $(SRCARCH)
 
 KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
+unexport CONFIG_
 
 # SHELL used by kbuild
 CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-- 
1.7.2.5

