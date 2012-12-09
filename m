Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44409 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750787Ab2LIQh5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 9 Dec 2012 11:37:57 -0500
Message-ID: <50C4BE64.5090808@suse.cz>
Date: Sun, 09 Dec 2012 17:37:56 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] x86: add dummy rules to avoid 'nothing to be done'
 messages
References: <1353269117-39917-1-git-send-email-pefoley2@verizon.net> <1353269117-39917-5-git-send-email-pefoley2@verizon.net>
In-Reply-To: <1353269117-39917-5-git-send-email-pefoley2@verizon.net>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: pefoley2@verizon.net, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Added x86@kernel.org

Michal

On 18.11.2012 21:05, pefoley2@verizon.net wrote:
> From: Peter Foley <pefoley2@verizon.net>
> 
> Add do-nothing rules to archheaders and archscripts targets to avoid
> 'nothing to be done' messages.
> 
> Signed-off-by: Peter Foley <pefoley2@verizon.net>
> ---
>  arch/x86/syscalls/Makefile | 1 +
>  arch/x86/tools/Makefile    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/x86/syscalls/Makefile b/arch/x86/syscalls/Makefile
> index f325af2..b6c923a 100644
> --- a/arch/x86/syscalls/Makefile
> +++ b/arch/x86/syscalls/Makefile
> @@ -56,3 +56,4 @@ targets	+= $(uapisyshdr-y) $(syshdr-y)
>  
>  all: $(addprefix $(uapi)/,$(uapisyshdr-y))
>  all: $(addprefix $(out)/,$(syshdr-y))
> +	@:
> diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
> index bae601f..dce567c 100644
> --- a/arch/x86/tools/Makefile
> +++ b/arch/x86/tools/Makefile
> @@ -40,3 +40,4 @@ $(obj)/insn_sanity.o: $(srctree)/arch/x86/lib/insn.c $(srctree)/arch/x86/lib/ina
>  HOST_EXTRACFLAGS += -I$(srctree)/tools/include
>  hostprogs-y	+= relocs
>  relocs: $(obj)/relocs
> +	@:
> 

