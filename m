Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:54221 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402AbcANEdU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Jan 2016 23:33:20 -0500
Date: Thu, 14 Jan 2016 04:33:14 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [vfs:asm-exports 6/6] ERROR: "__raw_readsb"
 [drivers/ata/pata_pcmcia.ko] undefined!
Message-ID: <20160114043314.GV17997@ZenIV.linux.org.uk>
References: <201601141009.4c7T6SyL%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201601141009.4c7T6SyL%fengguang.wu@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>

On Thu, Jan 14, 2016 at 10:50:12AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git asm-exports
> head:   5719a6be97e89c65e2b432b45850100c96c7419a
> commit: 5719a6be97e89c65e2b432b45850100c96c7419a [6/6] arm: move exports to definitions
> config: arm-viper_defconfig (attached as .config)
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5719a6be97e89c65e2b432b45850100c96c7419a
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: "__raw_readsb" [drivers/ata/pata_pcmcia.ko] undefined!
> >> ERROR: "__raw_writesb" [drivers/ata/pata_pcmcia.ko] undefined!

Arrgh...  OK, I see what's going on - export in a lib-y object.  For lib/*.c
we deal with that by putting such objects into obj-y; the same certainly
can be done for *.S, but I wonder if a better solution would be to have
lib-y objects scanned for __ksymtab_strings section (grepping in objdump -h
output) and treat the ones that have such as obj-y.

Comments?
