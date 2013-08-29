Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:40515 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754620Ab3H2PIp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Aug 2013 11:08:45 -0400
Message-ID: <521F63E4.80809@infradead.org>
Date: Thu, 29 Aug 2013 08:08:20 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: fixdep ought to be compiled with -D_FILE_OFFSET_BITS
References: <alpine.LSU.2.10.9.1308291200240.15586@nerf07.vanv.qr>
In-Reply-To: <alpine.LSU.2.10.9.1308291200240.15586@nerf07.vanv.qr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Engelhardt <jengelh@inai.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

adding linux-kbuild list...


On 08/29/13 03:04, Jan Engelhardt wrote:
> 
> Because fixdep is compiled without -D_FILE_OFFSET_BITS=64,
> a 32-bit fixdep (in a chroot build root, for example) may fail to run
> on a 64-bit host system if any file has an inode larger than 2^32,
> which can easily happen (in my case, on xfs):
> 
> 
> [ares07:~/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-obj]
> $ make silentoldconfig -C $PWD/../linux-3.10 O=$PWD V=1
> 
> make: Entering directory `/home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10'
> make -C /home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-obj \
> KBUILD_SRC=/home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10 \
> KBUILD_EXTMOD="" -f /home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10/Makefile \
> silentoldconfig
> make -f /home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10/scripts/Makefile.build obj=scripts/basic
>   gcc -Wp,-MD,scripts/basic/.fixdep.d -Iscripts/basic -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -o scripts/basic/fixdep /home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10/scripts/basic/fixdep.c  
> fixdep: error fstat'ing depfile: scripts/basic/.fixdep.d: Value too large for defined data type
> make[2]: *** [scripts/basic/fixdep] Error 2
> make[1]: *** [scripts_basic] Error 2
> make: *** [sub-make] Error 2
> make: Leaving directory `/home/abuild/rpmbuild/BUILD/kernel-pae-3.10.9~jng20/linux-3.10'
> --


-- 
~Randy
