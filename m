Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46179 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752149AbaBFP5O (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Feb 2014 10:57:14 -0500
Message-ID: <52F3B0D6.6000308@suse.cz>
Date: Thu, 06 Feb 2014 16:57:10 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile, CONFIG_MODVERSIONS, export RCS_FIND_IGNORE
 and ignore *.mod.c files in tags creation
References: <1391691102-23721-1-git-send-email-prarit@redhat.com>
In-Reply-To: <1391691102-23721-1-git-send-email-prarit@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Kirill Tkhai <tkhai@yandex.ru>, Michael Opdenacker <michael.opdenacker@free-electrons.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

On 2014-02-06 13:51, Prarit Bhargava wrote:
> CONFIG_MODVERSIONS=y results in a .mod.c for every compiled file in the kernel.
> Issuing a 'make cscope' on a compiled kernel tree results in the cscope files
> containing *.mod.c files.
> 
> [prarit@prarit linux]# make cscope
> [prarit@prarit linux]# cat cscope.files | grep mod.c | wc -l
> 4807
> 
> These files are not useful for cscope and should be ignored.  For example,
> 
>    #   line  filename / context / line
>    1    105  arch/x86/kvm/kvm-intel.mod.c <<GLOBAL>>
>              { 0x618911fc, __VMLINUX_SYMBOL_STR(numa_node) },
>    2    508  drivers/block/mtip32xx/mtip32xx.h <<GLOBAL>>
>              int numa_node;
>    3     55  drivers/block/mtip32xx/mtip32xx.mod.c <<GLOBAL>>
>              { 0x618911fc, __VMLINUX_SYMBOL_STR(numa_node) },
>    4     37  drivers/cpufreq/acpi-cpufreq.mod.c <<GLOBAL>>
>              { 0x618911fc, __VMLINUX_SYMBOL_STR(numa_node) },
>    <snip>
> 
> Add an export to RCS_FIND_IGNORE so it can be used in scripts/tags.sh and
> add explicitly ignore *.mod.c files.

Thanks, applied to kbuild.git#misc. But next time, please use a shorter
subject line. I changed it to "scripts/tags.sh: Ignore *.mod.c" so that
it does not take two lines everywhere.

Michal
