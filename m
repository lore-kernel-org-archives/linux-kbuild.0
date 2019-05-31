Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:50880 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfEaQjR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 12:39:17 -0400
Date: Fri, 31 May 2019 12:39:08 -0400
From: "George G. Davis" <george_davis@mentor.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown
 architecture
Message-ID: <20190531163908.GB10644@mam-gdavis-lt>
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hello Masahiro,

On Sat, Jun 01, 2019 at 01:02:37AM +0900, Masahiro Yamada wrote:
> On Sat, Jun 1, 2019 at 12:27 AM George G. Davis <george_davis@mentor.com> wrote:
> >
> > The following error occurs for the `make ARCH=arm64 checkstack` case:
> >
> > aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> > perl ./scripts/checkstack.pl arm64
> > wrong or unknown architecture "arm64"
> >
> > Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
> > ARCH=arm64 case.
> >
> > Signed-off-by: George G. Davis <george_davis@mentor.com>
> 
> 
> Why don't you fix scripts/checkstack.pl ?

Like so?:


diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 122aef5e4e14..8502de57e2ef 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -41,6 +41,8 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
 	if ($arch eq "") {
 		$arch = `uname -m`;
 		chomp($arch);
+	} elsif ($arch eq 'arm64') {
+		$arch = "aarch64";
 	}
 
 	$x	= "[0-9a-f]";	# hex character


Thanks!

> > diff --git a/Makefile b/Makefile
> > index 11358153d8f2..3e615e8553c0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1695,7 +1695,11 @@ PHONY += checkstack kernelrelease kernelversion image_name
> >  ifeq ($(ARCH), um)
> >  CHECKSTACK_ARCH := $(SUBARCH)
> >  else
> > -CHECKSTACK_ARCH := $(ARCH)
> > +       ifeq ($(ARCH), arm64)
> > +               CHECKSTACK_ARCH := aarch64
> > +       else
> > +               CHECKSTACK_ARCH := $(ARCH)
> > +       endif
> >  endif
> >  checkstack:
> >         $(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
> > --
> > 2.7.4
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Regards,
George
