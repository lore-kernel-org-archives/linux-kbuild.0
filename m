Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailfw02.zoner.fi ([84.34.147.249]:43371 "EHLO
	mailfw02.zoner.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753673Ab1BIKBU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Feb 2011 05:01:20 -0500
From: Lasse Collin <lasse.collin@tukaani.org>
Subject: Re: [PATCH] adjust XZ_DEC_* Kconfig defaults
Date: Wed, 9 Feb 2011 11:51:08 +0200
References: <4D5260530200007800030F22@vpn.id2.novell.com>
In-Reply-To: <4D5260530200007800030F22@vpn.id2.novell.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201102091151.08930.lasse.collin@tukaani.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org

On 2011-02-09 Jan Beulich wrote:
> Having architecture specific decoders enabled by default makes little
> sense - only at most one of the respective encoders is being used,
> and hence the other decoders are not necessary in the common
> (default) case.

It can be nice to be able to mount a Squashfs image containing ARM 
binaries on a x86 desktop, but maybe that isn't important enough to keep 
all BCJ filters enabled by default. If they are not enabled by default, 
I think "if EXPERT" needs to be removed from those options too.

For bigger size savings, it doesn't seem too useful to have five 
decompressors enabled by default (and behind "if EXPERT") for initramfs. 
I added XZ to that list to be consistent with the existing methods, but 
it wasn't the best thing to do.

Bzip2 and LZMA are completely __init, but most of the gzip, LZO, and XZ 
code for initramfs is not __init. They pull zlib_inflate, 
lzo_decompress, xz_dec, and crc32 modules into the kernel.

I think gzip and LZO support for initramfs should be enough by default, 
because bzip2, LZMA, and XZ are slower to decompress. The compression 
ratio of initramfs doesn't matter much on desktop systems so the fast 
options are the best. Users of embedded systems will pick exactly one 
method anyway, ignoring the defaults.

-- 
Lasse Collin  |  IRC: Larhzu @ IRCnet & Freenode
