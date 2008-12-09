Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:56147 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752099AbYLILCx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 06:02:53 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Tue, 9 Dec 2008 12:02:46 +0100
References: <20081208205814.GA22697@uranus.ravnborg.org> <20081209054528.GA1407@uranus.ravnborg.org> <Pine.LNX.4.64.0812090921310.29640@anakin>
In-Reply-To: <Pine.LNX.4.64.0812090921310.29640@anakin>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812091202.47150.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
> What are the other exported headers that differ?

byteorder.h, param.h, ptrace.h, setup.h, sigcontext.h, siginfo.h, signal.h
and unistd.h.

	Arnd <><
