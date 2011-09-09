Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52427 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933622Ab1IILzy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Sep 2011 07:55:54 -0400
Message-ID: <4E69FEC9.2080204@suse.cz>
Date: Fri, 09 Sep 2011 13:55:53 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Kbuild: append missing-syscalls to the default target
 list
References: <1314234210-11090-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1314234210-11090-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 25.8.2011 03:03, Arnaud Lacombe wrote:
> This avoid an extra make invocation on `prepare0'.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  Kbuild   |    4 +++-
>  Makefile |    1 -
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Kbuild b/Kbuild
> index 2114113..1a2eb32 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -88,10 +88,12 @@ $(obj)/$(offsets-file): arch/$(SRCARCH)/kernel/asm-offsets.s Kbuild
>  # 3) Check for missing system calls
>  #
>  
> +always += missing-syscalls
> +targets += missing-syscalls
> +
>  quiet_cmd_syscalls = CALL    $<
>        cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags)

checksyscalls.sh needs to depend on generated/asm-offsets.h, otherwise a
parallel build will fail.

Michal

