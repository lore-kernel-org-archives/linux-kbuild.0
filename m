Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:37486 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751680Ab0JYFsc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Oct 2010 01:48:32 -0400
Subject: Re: [PATCH] kconfig: don't select 64 bit option on sparc32
 all{yes,mod}config
From: Namhyung Kim <namhyung@gmail.com>
In-Reply-To: <4CC4AEBB.6000505@suse.cz>
References: <1287762484-8154-1-git-send-email-namhyung@gmail.com>
	 <4CC4AEBB.6000505@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 14:48:23 +0900
Message-ID: <1287985703.1689.11.camel@leonhard>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org

2010-10-25 (월), 00:10 +0200, Michal Marek:
> On 22.10.2010 17:48, Namhyung Kim wrote:
> > The SPARC architecture provides 64BIT config option to select
> > build type and it is set to 1 on ARCH=sparc64 as a default value.
> > But in case of 32-bit, it is also set to 1 by the allyesconfig
> > logic, end result would be the same as of sparc64. So I think
> > it would be better if plain ARCH=sparc all{yes,mod}config do not
> > set it then we can test 32-bit build by default.
> > 
> > Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> > ---
> >  scripts/kconfig/confdata.c |    4 ++++
> 
> Can't this be fixed in the sparc Makefile/Kconfig instead? E.g. have
> ARCH=sparc -> ask
> ARCH=sparc64 -> CONFIG_64BIT=y
> ARCH=sparc32 -> # CONFIG_64BIT is not set
> like the x86/i386/x86_64 ARCH option for x86.
> 
> Michal

Looks better. :-) I didn't noticed that CONFIG_64BIT setup on sparc was
just same as x86's. Adding sparc32 target will simply resolve the issue.
The patch follows, Thanks.


kbuild: add ARCH=sparc32 target
    
Add 'sparc32' ARCH target to test all{yes,mod}config for 32-bit build.
    
Signed-off-by: Namhyung Kim <namhyung@gmail.com>

diff --git a/Makefile b/Makefile
index 3e43805..8da6685 100644
--- a/Makefile
+++ b/Makefile
@@ -204,6 +204,9 @@ ifeq ($(ARCH),x86_64)
 endif
 
 # Additional ARCH settings for sparc
+ifeq ($(ARCH),sparc32)
+       SRCARCH := sparc
+endif
 ifeq ($(ARCH),sparc64)
        SRCARCH := sparc
 endif


-- 
Regards,
Namhyung Kim


