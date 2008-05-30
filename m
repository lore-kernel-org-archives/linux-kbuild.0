Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pmx1.sophos.com ([213.31.172.16]:42673 "EHLO pmx1.sophos.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752078AbYE3J1i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2008 05:27:38 -0400
In-Reply-To: <20080529193658.GA20113@uranus.ravnborg.org>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
MIME-Version: 1.0
From: tvrtko.ursulin@sophos.com
Date: Fri, 30 May 2008 10:27:21 +0100
Content-Type: text/plain; charset="US-ASCII"
Message-Id: <20080530092722.A10312FE858@pmx1.sophos.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrea Arcangeli <andrea@qumranet.com>, linux-kbuild@vger.kernel.org

Sam Ravnborg <sam@ravnborg.org> wrote on 29/05/2008 20:36:58:

> On Wed, May 28, 2008 at 10:18:03PM +0200, Andrea Arcangeli wrote:
> > On Wed, May 28, 2008 at 09:13:15PM +0200, Sam Ravnborg wrote:
> > > Inspect the gcc commandlien to see if the last -I
> > > contains the expected value (which is `pwd`)
> > 
> > I can reproduce a failure, not sure if it's the same one but it ends
> > up with -I. Actually on the good build it seems the -I wasn't there at
> > all.
> 
> I tracked it down now (a simple bisect would have doen the trick too).
> It was the introduction of KBUILD_EXTRA_SYMBOLS that caused
> us troubles because we started to include the Makefile
> in Makefile.modpost and thus ccflags-y (EXTRA_CFLAGS) were
> assigned the value "-I$(src)" but $(src) was not defined so
> we ended up with an empty -I which then picked up the following
> parameter on the command line.
> 
> I cooked up the following fix:
> 
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index a098a04..28ef233 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -37,6 +37,10 @@
>  # symbols in the final module linking stage
>  # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
>  # This is solely usefull to speed up test compiles
> +
> +# Assign src as it may be used in ccflags-y
> +src = .
> +
>  PHONY := _modpost
>  _modpost: __modpost
> 
> 
> Please let me know if this solves your problem or more issues reamin.

For me this changes the output but $(src) is still wrong. Shouldn't it 
contain the thing passed in M ie. pwd?

Excerpts from make ... V=1 below.

2.6.26-rc3:
--------------------------------
  Building modules, stage 2.
make -f /usr/src/linux-2.6.26-rc3/scripts/Makefile.modpost
/root/talpa-0.9.46/Makefile:52: /src/app-ctrl/core/talpa-linux/common.mk: 
No such file or directory

2.6.26-rc3 with the above patch:
--------------------------------
  Building modules, stage 2.
make -f /usr/src/linux-2.6.26-rc3/scripts/Makefile.modpost
/root/talpa-0.9.46/Makefile:52: src/app-ctrl/core/talpa-linux/common.mk: 
No such file or directory

2.6.25:
--------------------------------
  Building modules, stage 2.
make -f /usr/src/linux-2.6.25/scripts/Makefile.modpost
scripts/mod/modpost   -i /usr/src/linux-2.6.25/Module.symvers -I 
/root/2.6.25/talpa-0.9.46/Module.symvers -o 
/root/2.6.25/talpa-0.9.46/Module.symvers -S   -w  -s

Tvrtko


Sophos Plc, The Pentagon, Abingdon Science Park, Abingdon,
OX14 3YP, United Kingdom.

Company Reg No 2096520. VAT Reg No GB 348 3873 20.

