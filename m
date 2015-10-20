Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from erouter8.ore.mailhop.org ([54.187.218.212]:42874 "EHLO
	erouter8.ore.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773AbbJTNgI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Oct 2015 09:36:08 -0400
Date: Tue, 20 Oct 2015 13:20:02 +0000
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH RESEND] dtbsinstall: don't move target directory out of
 the way
Message-ID: <20151020132002.GD3953@io.lakedaemon.net>
References: <E1ZoWXk-0007DX-SY@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ZoWXk-0007DX-SY@rmk-PC.arm.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

Hey Russell,

On Tue, Oct 20, 2015 at 02:01:32PM +0100, Russell King wrote:
> No other kernel installation target moves the target directory out of
> the way, even deleting an old version of it.  These are destructive
> operations, ones which the kernel build system should not be making.
> 
> This behaviour prevents being able to do:
> 
> 	make install INSTALL_PATH=/some/path/boot
> 	make dtbs_install INSTALL_DTBS_PATH=/some/path/boot
> 
> As it causes the boot directory containing the kernel installed in
> step 1 to be moved to /some/path/boot.old.  Things get even more fun
> if you do:
> 
> 	make install dtbs_install INSTALL_PATH=/some/path/boot INSTALL_DTBS_PATH=/some/path/boot
> 
> The kernel gets installed into /some/path/boot, then the directory gets
> renamed to /some/path/boot.old, and a new directory created to hold the
> dtbs.  Even more fun if you supply -j2 when we end up with races in
> make.
> 
> Remove this behaviour.
> 
> If this behaviour is required at installation time, this should be
> done by the installation external to the kernel makefiles, just like
> it would be done for 'make modules_install'.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Acked-by: Jason Cooper <jason@lakedaemon.net>

fwiw, I honestly don't remember adding this brokenness, but the git
history doesn't lie:

  f4d4ffc03efc8 kbuild: dtbs_install: new make target

thx,

Jason.

> ---
>  scripts/Makefile.dtbinst | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> index 1c15717e0d56..a1be75d0a5fd 100644
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -23,8 +23,6 @@ include $(src)/Makefile
>  PHONY += __dtbs_install_prep
>  __dtbs_install_prep:
>  ifeq ("$(dtbinst-root)", "$(obj)")
> -	$(Q)if [ -d $(INSTALL_DTBS_PATH).old ]; then rm -rf $(INSTALL_DTBS_PATH).old; fi
> -	$(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
>  	$(Q)mkdir -p $(INSTALL_DTBS_PATH)
>  endif
>  
> -- 
> 2.1.0
> 
