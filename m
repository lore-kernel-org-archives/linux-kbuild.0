Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40288 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759622Ab3EDOdA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 May 2013 10:33:00 -0400
From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] Fix cleaning in scripts/mod
References: <51814943.7000604@intel.com> <20130501182138.GA17550@kroah.com>
	<5B8DA87D05A7694D9FA63FD143655C1B01F18E66@HASMSX106.ger.corp.intel.com>
	<518284E6.7040503@intel.com>
	<CAMuHMdWSVUcwkY=xn+HjbruLxsc8Eqq=CWX78CdUc1+MAwCVhg@mail.gmail.com>
Date: Sat, 04 May 2013 16:32:53 +0200
In-Reply-To: <CAMuHMdWSVUcwkY=xn+HjbruLxsc8Eqq=CWX78CdUc1+MAwCVhg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Fri, 3 May 2013 13:34:50 +0200")
Message-ID: <87sj22zuga.fsf_-_@hase.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dave Hansen <dave.hansen@intel.com>, "Winkler, Tomas" <tomas.winkler@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "SamuelOrtiz@kroah.com" <SamuelOrtiz@kroah.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Make sure devicetable-offsets.h is cleaned in the scripts/mod directory

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 scripts/mod/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 9415b56..75d59fc 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -37,6 +37,8 @@ scripts/mod/devicetable-offsets.s: scripts/mod/devicetable-offsets.c FORCE
 $(obj)/$(devicetable-offsets-file): scripts/mod/devicetable-offsets.s
 	$(call cmd,offsets)
 
+targets += $(devicetable-offsets-file)
+
 # dependencies on generated files need to be listed explicitly
 
 $(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o: $(obj)/elfconfig.h
-- 
1.8.2.2
