Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54114 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754622AbaFKMWQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jun 2014 08:22:16 -0400
Message-ID: <539849F6.8010501@suse.cz>
Date: Wed, 11 Jun 2014 14:22:14 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Kernel build fail with "Circular xxxx <- xxxx dependency dropped"
References: <5397F0E9.8060305@linux.vnet.ibm.com> <53981238.8010007@suse.cz> <20140611122104.GA24569@pobox.suse.cz>
In-Reply-To: <20140611122104.GA24569@pobox.suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Qiu <qiudayu@linux.vnet.ibm.com>
Cc: linuxppc <linuxppc-dev@lists.ozlabs.org>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 11.6.2014 14:21, Michal Marek napsal(a):
> On Wed, Jun 11, 2014 at 10:24:24AM +0200, Michal Marek wrote:
>> Dne 11.6.2014 08:02, Mike Qiu napsal(a):
>>> make[1]: Circular arch/powerpc/boot/zImage.lds.S <-
>>> arch/powerpc/boot/zImage.lds dependency dropped.
>>> make[1]: Circular arch/powerpc/boot/zImage.coff.lds.S <-
>>> arch/powerpc/boot/zImage.lds dependency dropped.
>>> make[1]: Circular arch/powerpc/boot/zImage.coff.lds.S <-
>>> arch/powerpc/boot/zImage.coff.lds dependency dropped.
>>> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
>>> arch/powerpc/boot/zImage.lds dependency dropped.
>>> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
>>> arch/powerpc/boot/zImage.coff.lds dependency dropped.
>>> make[1]: Circular arch/powerpc/boot/zImage.ps3.lds.S <-
>>> arch/powerpc/boot/zImage.ps3.lds dependency dropped.
>>>   WRAP    arch/powerpc/boot/zImage.ps3.lds.S
>>> INFO: Uncompressed kernel (size 0x14d0db8) overlaps the address of the
>>> wrapper(0x400000)
>>> INFO: Fixing the link_address of wrapper to (0x1500000)
>>> ld: cannot open linker script file arch/powerpc/boot/zImage.lds: No such
>>> file or directory
>>> make[1]: *** [arch/powerpc/boot/zImage.ps3.lds.S] Error 1
>>> make: *** [zImage] Error 2
>>> make: *** Waiting for unfinished jobs....
>>>   MODPOST 1853 modules
>>>
>>> I use git bisect to find out the possible commits to lead this problem:
>>> 7e1c04779efd51154baf652e653ceb24ce68939b kbuild: Use relative path for
>>> $(objtree)
>>> 890676c65d699db3ad82e7dddd0cf8fb449031af kbuild: Use relative path when
>>> building in the source tree
>>> 9da0763bdd82572be243fcf5161734f11568960f kbuild: Use relative path when
>>> building in a subdir of the source tree
>>
>> Thanks for the report, I'll have a look. If I do not come up with a
>> solution soon, I'll revert the series.
> 
> I have yet to test this, but can you try the patch below?
> 
> Thanks!
> Michal
> 
> 
> From 7f8336f4c7f2131efbe82543580dda3ec1988609 Mon Sep 17 00:00:00 2001
> From: Michal Marek <mmarek@suse.cz>
> Date: Wed, 11 Jun 2014 13:53:48 +0200
> Subject: [PATCH] powerpc: Avoid circular dependency with zImage.%
> 
> The rule to create the final images uses a zImage.% pattern.
> Unfortunately, this also matches the names of the zImage.*.lds linker
> scripts, which appear as a dependency of the final images. This somehow
> worked when $(srctree) used to be an absolute path, but now the pattern
> matches too much. List only the images from $(image-y) as the target of
> the rule, to avoid the circular dependency.
> 

If merged, this should of course have a Reported-by: Mike Qiu
<qiudayu@linux.vnet.ibm.com>

Michal
