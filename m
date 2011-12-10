Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38693 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751190Ab1LJOnZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 Dec 2011 09:43:25 -0500
Message-ID: <4EE37010.6060207@suse.cz>
Date: Sat, 10 Dec 2011 15:43:28 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] headers_install: avoid those .install & ..install.cmd
 unused files
References: <CAH5vBdJ=Ws7FvO-KXUmOvg6jTuGCX9mZG77A8-38g1Lh=CchnA@mail.gmail.com>
In-Reply-To: <CAH5vBdJ=Ws7FvO-KXUmOvg6jTuGCX9mZG77A8-38g1Lh=CchnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crquan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On 3.12.2011 10:24, Cheng Renquan wrote:
> The modules_install, firmware_install, all install commands
> don't generate such hidden unused files under destination;
> I think headers_install also should not to generate such .install
> & ..install.cmd files;
> Usually, we call "make headers_install INSTALL_HDR_PATH=/some/path"
> expecting it install just the header files, not those dot files;
> 
> The original "call if_changed" could generate ..install.cmd and
> together with "touch .install" could make the 2nd time headers_install
> quite faster but it's not meaningful here, because we usually only install once;

I think it makes sense for any *_install target to run the whole install
sequence. The slight problem is that headers_check has an explicit
dependency on headers_install, so someone doing
   make headers_install && make headers_check
might not like the change.


> diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
> index a57f5bd..b3deff2 100644
> --- a/scripts/Makefile.headersinst
> +++ b/scripts/Makefile.headersinst
> @@ -54,8 +54,7 @@ quiet_cmd_install = INSTALL $(printdir) ($(words
> $(all-files))\
>          $(PERL) $< $(objtree)/$(obj) $(install) $(SRCARCH) $(objhdr-y); \
>          for F in $(wrapper-files); do                                   \
>                  echo "\#include <asm-generic/$$F>" > $(install)/$$F;    \
> -        done;                                                           \
> -        touch $@
> +        done

If you are removing the .install marker, then please also remove any
reference to it from the makefile.

Michal
