Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48781 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750763AbaFKIY1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 04:24:27 -0400
Message-ID: <53981238.8010007@suse.cz>
Date: Wed, 11 Jun 2014 10:24:24 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kernel build fail with "Circular xxxx <- xxxx dependency dropped"
References: <5397F0E9.8060305@linux.vnet.ibm.com>
In-Reply-To: <5397F0E9.8060305@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Qiu <qiudayu@linux.vnet.ibm.com>
Cc: linuxppc <linuxppc-dev@lists.ozlabs.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.6.2014 08:02, Mike Qiu napsal(a):
> Hi all,
> 
> I recently build linux next kernel in IBM Power7 platform, use default
> config file copy from /boot/config-3.6.10-4.fc18.ppc64p7
> 
> [root@cena01 linux-next]# uname -a
> Linux cena01.austin.ibm.com 3.15.0-rc1+ #47 SMP Thu Apr 24 20:59:46 CDT
> 2014 ppc64 ppc64 ppc64 GNU/Linux
> 
> [root@cena01 linux-next]# cat /etc/issue
> Fedora release 18 (Spherical Cow)
> Kernel \r on an \m (\l)
> 
> and build error log below:
> 
> [root@cena01 linux-next]# make -j60
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CALL    arch/powerpc/kernel/systbl_chk.sh
>   CALL    arch/powerpc/kernel/prom_init_check.sh
>   CHK     include/generated/uapi/linux/version.h
>   CALL    arch/powerpc/relocs_check.pl
>   Building modules, stage 2.
> WARNING: 1 bad relocations
> c000000001455040 R_PPC64_ADDR64    uprobes_fetch_type_table
> make[1]: Circular arch/powerpc/boot/zImage.lds.S <-
> arch/powerpc/boot/zImage.lds dependency dropped.
> make[1]: Circular arch/powerpc/boot/zImage.coff.lds.S <-
> arch/powerpc/boot/zImage.lds dependency dropped.
> make[1]: Circular arch/powerpc/boot/zImage.coff.lds.S <-
> arch/powerpc/boot/zImage.coff.lds dependency dropped.
> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
> arch/powerpc/boot/zImage.lds dependency dropped.
> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
> arch/powerpc/boot/zImage.coff.lds dependency dropped.
> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
> arch/powerpc/boot/zImage.ps3.lds dependency dropped.
>   WRAP    arch/powerpc/boot/zImage.ps3.lds.S
> INFO: Uncompressed kernel (size 0x14d0db8) overlaps the address of the
> wrapper(0x400000)
> INFO: Fixing the link_address of wrapper to (0x1500000)
> ld: cannot open linker script file arch/powerpc/boot/zImage.lds: No such
> file or directory
> make[1]: *** [arch/powerpc/boot/zImage.ps3.lds.S] Error 1
> make: *** [zImage] Error 2
> make: *** Waiting for unfinished jobs....
>   MODPOST 1853 modules
> 
> I use git bisect to find out the possible commits to lead this problem:
> 7e1c04779efd51154baf652e653ceb24ce68939b kbuild: Use relative path for
> $(objtree)
> 890676c65d699db3ad82e7dddd0cf8fb449031af kbuild: Use relative path when
> building in the source tree
> 9da0763bdd82572be243fcf5161734f11568960f kbuild: Use relative path when
> building in a subdir of the source tree

Thanks for the report, I'll have a look. If I do not come up with a
solution soon, I'll revert the series.

Michal

