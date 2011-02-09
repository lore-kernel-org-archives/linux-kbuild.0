Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:38439 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1750853Ab1BIT12 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Feb 2011 14:27:28 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 9 Feb 2011 11:27:18 -0800
Date: Wed, 9 Feb 2011 11:27:18 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH] adjust XZ_DEC_* Kconfig defaults
Message-Id: <20110209112718.0622417f.rdunlap@xenotime.net>
In-Reply-To: <201102091151.08930.lasse.collin@tukaani.org>
References: <4D5260530200007800030F22@vpn.id2.novell.com>
	<201102091151.08930.lasse.collin@tukaani.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Lasse Collin <lasse.collin@tukaani.org>
Cc: Jan Beulich <JBeulich@novell.com>, linux-kbuild@vger.kernel.org

On Wed, 9 Feb 2011 11:51:08 +0200 Lasse Collin wrote:

> On 2011-02-09 Jan Beulich wrote:
> > Having architecture specific decoders enabled by default makes little
> > sense - only at most one of the respective encoders is being used,
> > and hence the other decoders are not necessary in the common
> > (default) case.
> 
> It can be nice to be able to mount a Squashfs image containing ARM 
> binaries on a x86 desktop, but maybe that isn't important enough to keep 
> all BCJ filters enabled by default. If they are not enabled by default, 
> I think "if EXPERT" needs to be removed from those options too.
> 
> For bigger size savings, it doesn't seem too useful to have five 
> decompressors enabled by default (and behind "if EXPERT") for initramfs. 
> I added XZ to that list to be consistent with the existing methods, but 
> it wasn't the best thing to do.
> 
> Bzip2 and LZMA are completely __init, but most of the gzip, LZO, and XZ 
> code for initramfs is not __init. They pull zlib_inflate, 
> lzo_decompress, xz_dec, and crc32 modules into the kernel.
> 
> I think gzip and LZO support for initramfs should be enough by default, 
> because bzip2, LZMA, and XZ are slower to decompress. The compression 
> ratio of initramfs doesn't matter much on desktop systems so the fast 
> options are the best. Users of embedded systems will pick exactly one 
> method anyway, ignoring the defaults.

Hi,
Did you see this email?  what do you think of it?

https://lkml.org/lkml/2011/2/1/438
Subject: Change DECOMPRESS_LZMA to boolean

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
