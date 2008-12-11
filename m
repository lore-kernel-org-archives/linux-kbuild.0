Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns1.suse.de ([195.135.220.2]:48397 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753924AbYLKJiu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Dec 2008 04:38:50 -0500
From: Andreas Schwab <schwab@suse.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
References: <20081208205814.GA22697@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812082359190.29640@anakin>
	<200812090026.06689.arnd@arndb.de>
	<20081209054528.GA1407@uranus.ravnborg.org>
	<Pine.LNX.4.64.0812110932510.7310@anakin>
Date: Thu, 11 Dec 2008 10:38:48 +0100
In-Reply-To: <Pine.LNX.4.64.0812110932510.7310@anakin> (Geert Uytterhoeven's
	message of "Thu, 11 Dec 2008 09:33:55 +0100 (CET)")
Message-ID: <je1vwfuk47.fsf@sykes.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> None of my m68k-linux compilers set __uClinux__, as expected.

IIUC, userspace ABI is supposed to be completely identical.

Andreas.

-- 
Andreas Schwab, SuSE Labs, schwab@suse.de
SuSE Linux Products GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
PGP key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
