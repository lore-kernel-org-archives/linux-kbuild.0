Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.argonst.com ([67.220.151.134]:3609 "EHLO
	smtp1.argonst.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473AbYLIRJX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 12:09:23 -0500
In-Reply-To: <Pine.LNX.4.64.0812082359190.29640@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com>
Content-Transfer-Encoding: 7bit
From: Allon Stern <allon.stern@argonst.com>
Subject: Re: [uClinux-dev] Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Tue, 9 Dec 2008 11:54:05 -0500
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: uClinux development list <uclinux-dev@uclinux.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>


On Dec 8, 2008, at 6:01 PM, Geert Uytterhoeven wrote:
>
> I think you can share a toolchain for m68k and m68knommu, at least  
> for the
> kernel (I used my plain m68k toolchain when experimenting with  
> m68knommu for
> Amiga).

The coldfire (m68knommu) doesn't have some instructions; this caused  
us some grief in the assembly code exported from m68k for byte order  
in user-space.

-
allon
