Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:35200 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264AbbGIXJl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Jul 2015 19:09:41 -0400
Received: by pactm7 with SMTP id tm7so157696361pac.2
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2015 16:09:41 -0700 (PDT)
From: Behan Webster <behanw@converseincode.com>
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
 <20150422143320.GB19277@sepie.suse.cz>
Message-ID: <559EFF2F.1070301@converseincode.com>
Date: Thu, 9 Jul 2015 16:09:35 -0700
MIME-Version: 1.0
In-Reply-To: <20150422143320.GB19277@sepie.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Resent since gmail HTML-ified my previous email...

On Wed, Apr 22, 2015 at 7:33 AM, Michal Marek <mmarek@suse.cz 
<mailto:mmarek@suse.cz>> wrote:

    On Fri, Apr 17, 2015 at 11:35:04PM +0200, Paul Cercueil wrote:
     > When the host's C compiler is clang, and when attempting to
     > cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the Makefile
     > would incorrectly detect the use of clang, which resulted in
     > clang-specific flags being passed to mipsel-linux-gcc.
     >
     > This can be verified under Debian by installing the "clang" package,
     > and then using it as the default compiler with:
     > sudo update-alternatives --config cc
     >
     > This patch moves the detection of clang after the $(CC) variable is
     > initialized to the name of the cross-compiler, so that the check
    applies
     > to the cross-compiler and not the host's C compiler.
     >
     > v2: Move the detection of clang after the inclusion of the
     > arch/*/Makefile (as they might set $(CROSS_COMPILE))
     >
     > Signed-off-by: Paul Cercueil <paul@crapouillou.net
    <mailto:paul@crapouillou.net>>

    Applied to kbuild.git#kbuild. I will push it after v4.1-rc1 becomes
    available, though.


Drat. I wish I saw this earlier.

This breaks patches which check for the value of COMPILER in 
arch/*/Makefile. This detection must be performed before the inclusion 
of the arch Makefile.

Can I move this to after the initialization of CC but before the include?

I'm not sure that being able to define the default compiler per arch is 
necessary. But I know I need to be able to add arch specific flags for 
clang.

Behan

-- 
Behan Webster
behanw@converseincode.com <mailto:behanw@converseincode.com>
