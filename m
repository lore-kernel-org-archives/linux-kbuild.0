Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.argonst.com ([67.220.151.134]:3366 "EHLO
	smtp1.argonst.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756104AbYLKPpI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Dec 2008 10:45:08 -0500
In-Reply-To: <Pine.LNX.4.64.0812091838500.27084@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin> <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com> <Pine.LNX.4.64.0812091838500.27084@anakin>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <EB7A6806-7754-4EB5-8CCB-BCDE7380194D@argonst.com>
Content-Transfer-Encoding: 7bit
From: Allon Stern <Allon.Stern@argonst.com>
Subject: Re: [uClinux-dev] Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Thu, 11 Dec 2008 10:44:49 -0500
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, Sam Ravnborg <sam@ravnborg.org>, linux-m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>


On Dec 9, 2008, at 12:39 PM, Geert Uytterhoeven wrote:
> Sure, but that one is nicely protected by "#if defined  
> (__mcfisaaplus__) ||
> defined (__mcfisac__)", right?

Well, that was the patch we had to apply.
It wasn't in the baseline kernel.org kernel.
-
allon
