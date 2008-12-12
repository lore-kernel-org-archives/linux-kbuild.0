Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:48810 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752390AbYLLF2b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Dec 2008 00:28:31 -0500
Message-ID: <4941F530.8000003@snapgear.com>
Date: Fri, 12 Dec 2008 15:22:56 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
Subject: Re: [uClinux-dev] Re: Merge headerfiles for m68k and m68knommu to
 arch/m68k/include/asm
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin> <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com> <Pine.LNX.4.64.0812091838500.27084@anakin> <EB7A6806-7754-4EB5-8CCB-BCDE7380194D@argonst.com>
In-Reply-To: <EB7A6806-7754-4EB5-8CCB-BCDE7380194D@argonst.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Allon Stern <Allon.Stern@argonst.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, uClinux development list <uclinux-dev@uclinux.org>, Sam Ravnborg <sam@ravnborg.org>, linux-m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>


Allon Stern wrote:
> On Dec 9, 2008, at 12:39 PM, Geert Uytterhoeven wrote:
>> Sure, but that one is nicely protected by "#if defined 
>> (__mcfisaaplus__) ||
>> defined (__mcfisac__)", right?
> 
> Well, that was the patch we had to apply.
> It wasn't in the baseline kernel.org kernel.

What kernel.org version?
Its has been in for a little while.
In 2.6.28-rc8:

grep mcfisaaplus arch/m68knommu/include/asm/*

arch/m68knommu/include/asm/bitops.h:#if defined (__mcfisaaplus__) || 
defined (__mcfisac__)
arch/m68knommu/include/asm/byteorder.h:#if defined (__mcfisaaplus__) || 
defined (__mcfisac__)


Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
