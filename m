Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([78.24.191.182]:54268 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792Ab3FKPlp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Jun 2013 11:41:45 -0400
Received: from localhost.localdomain ([127.0.0.1]:49217 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6835220Ab3FKPlnupV6n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jun 2013 17:41:43 +0200
Date: Tue, 11 Jun 2013 17:41:29 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: Kconfig: Set default value for the "Kernel code
 model"
Message-ID: <20130611154129.GD13126@linux-mips.org>
References: <1370944336-13703-1-git-send-email-markos.chandras@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1370944336-13703-1-git-send-email-markos.chandras@imgtec.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-mips@linux-mips.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Tue, Jun 11, 2013 at 10:52:16AM +0100, Markos Chandras wrote:

(Adding the kconfig maintainer and mailing list to cc.)

> Certain randconfigs may not select neither CONFIG_32BIT nor
> CONFIG_64BIT which can lead to build problems and to the following
> Kbuild warning:
> 
> .config:154:warning: symbol value '' invalid for PHYSICAL_START
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> Acked-by: Steven J. Hill <Steven.Hill@imgtec.com>

Systems are supposed to set if they support 32 bit kernels and/or 64 bit
kernels in arch/mips/Kconfig.  The behaviour you're reporting happens
if the default system (which happens to be SGI_IP22) supports both
kernel models, that is SYS_SUPPORTS_32BIT_KERNEL and
SYS_SUPPORTS_64BIT_KERNEL are set.  Then "make randconfig" will generate
a .config with neiher CONFIG_32BIT nor CONFIG_64BIT set.

Just defaulting to CONFIG_32BIT as in your patch
http://patchwork.linux-mips.org/patch/5377/ isn't really a good solution
because for some platforms 32 bit kernels, for others 64 bit kernels are
preferred so I tried to implement something like

choice
        prompt "Kernel code model"
        default 32BIT if SYS_32BIT_KERNEL_PREFERRED
        default 64BIT if SYS_64BIT_KERNEL_PREFERRED

and have individual platforms set their preferred kernel variant.  And
I got more odd Kconfig behaviour, getting both choice values 32BIT and
64BIT set for some platforms.

Another variant that only uses a single auxilliary symbol,
SYS_64BIT_KERNEL_PREFERRED like this:

choice
        prompt "Kernel code model"
        default 32BIT if !SYS_64BIT_KERNEL_PREFERRED
        default 64BIT if SYS_64BIT_KERNEL_PREFERRED

still results in

CONFIG_32BIT=y
CONFIG_64BIT=y

So I'm not quite certain how to obtain the desired behaviour - but I appears
highly unobvious to buggy on kconfig's side.

Michal, can you shed some light?

  Ralf
