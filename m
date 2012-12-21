Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mta1.parkeon.com ([91.121.43.66]:36320 "EHLO mta1.parkeon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751306Ab2LUS0Z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Dec 2012 13:26:25 -0500
Received: from mta2.parkeon.com ([81.80.172.220])
	by mta1.parkeon.com with esmtp (Exim 4.76)
	(envelope-from <mfuzzey@parkeon.com>)
	id 1Tm6yv-0002zu-Bc
	for linux-kbuild@vger.kernel.org; Fri, 21 Dec 2012 19:06:01 +0100
Received: from [10.32.16.23] (helo=mail.besancon.parkeon.com)
	by mta2.parkeon.com with esmtp (Exim 4.77)
	(envelope-from <mfuzzey@parkeon.com>)
	id 1Tm6yr-0007Vw-W2
	for linux-kbuild@vger.kernel.org; Fri, 21 Dec 2012 19:05:57 +0100
Received: from [10.32.51.221] (port=41085 helo=[127.0.0.1])
	by mail.besancon.parkeon.com with esmtp (Exim 4.71)
	(envelope-from <mfuzzey@parkeon.com>)
	id 1Tm6yv-0001Ms-5i
	for linux-kbuild@vger.kernel.org; Fri, 21 Dec 2012 19:06:01 +0100
Subject: [PATCH] firmware build: Fix build failure when using
	CONFIG_EXTRA_FIRMWARE with seperate output dir.
From: Martin Fuzzey <mfuzzey@parkeon.com>
Date: Fri, 21 Dec 2012 19:06:01 +0100
Message-ID: <20121221180601.3140.75121.stgit@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

When building with a seperate output directory (O=) and
CONFIG_EXTRA_FIRMWARE the build failed with
	firmware/3com/typhoon.bin.gen.S: Assembler messages:
	firmware/3com/typhoon.bin.gen.S:5: Error: file not found: /home/linux_src/firmware/3com/typhoon.bin

Because the generated binary is in the $(objdir) but the generated .S
file tries to reference it in the $(srcdir)

Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
---
 firmware/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/firmware/Makefile b/firmware/Makefile
index eeb1403..a47e499 100644
--- a/firmware/Makefile
+++ b/firmware/Makefile
@@ -5,7 +5,7 @@
 # Create $(fwabs) from $(CONFIG_EXTRA_FIRMWARE_DIR) -- if it doesn't have a
 # leading /, it's relative to $(srctree).
 fwdir := $(subst ",,$(CONFIG_EXTRA_FIRMWARE_DIR))
-fwabs := $(addprefix $(srctree)/,$(filter-out /%,$(fwdir)))$(filter /%,$(fwdir))
+fwabs := $(addprefix $(objtree)/,$(filter-out /%,$(fwdir)))$(filter /%,$(fwdir))
 
 fw-external-y := $(subst ",,$(CONFIG_EXTRA_FIRMWARE))
 

