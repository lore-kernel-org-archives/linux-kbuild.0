Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47288 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754503AbaA0VDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jan 2014 16:03:55 -0500
Message-ID: <52E6C9B8.3040605@suse.cz>
Date: Mon, 27 Jan 2014 22:03:52 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] kbuild: Fix debugging info generation for .S files
References: <cover.1386804405.git.geoff@infradead.org> <cef1ba27f4070a4ae78c77c8d43165c48e3e6c1f.1386804405.git.geoff@infradead.org>
In-Reply-To: <cef1ba27f4070a4ae78c77c8d43165c48e3e6c1f.1386804405.git.geoff@infradead.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Dne 12.12.2013 00:34, Geoff Levand napsal(a):
> Change the debuging info generation flag in KBUILD_AFLAGS from '-gdwarf-2' to
> '-Wa,--gdwarf-2'.  This will properly generate the debugging info for .S files
> when CONFIG_DEBUG_INFO=y.
> 
> It seems current gcc does not pass a '--gdwarf-2' option on to the assembler
> when '-gdwarf-2' is on its command line (note the differece in the gcc and as
> flags).  This change provides the correct assembler flag to gcc, and so does
> not rely on gcc to emit a flag for the assembler.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to kbuild.git#kbuild, sorry for the delay.

Michal

