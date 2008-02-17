Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:41101 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751258AbYBQTbt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2008 14:31:49 -0500
Date: Sun, 17 Feb 2008 20:31:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] modpost: Fix reversed symbol name order
Message-ID: <20080217193159.GI14588@uranus.ravnborg.org>
References: <Pine.LNX.4.64.0802171411400.19269@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0802171411400.19269@anakin>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Feb 17, 2008 at 02:12:10PM +0100, Geert Uytterhoeven wrote:
> XXXINIT_TO_INIT and XXXEXIT_TO_EXIT warnings use the reversed symbol name order
> in the suggestion, e.g.:
> 
>     WARNING: vmlinux.o(.meminit.text+0x36c): Section mismatch in reference from the function free_area_init_core() to the function .init.text:setup_usemap()
>     The function __meminit free_area_init_core() references
>     a function __init setup_usemap().
>     If free_area_init_core is only used by setup_usemap then
>     annotate free_area_init_core with a matching annotation.
> 

Ups - applied.

Thanks,

	Sam
