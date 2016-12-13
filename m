Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44932 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750910AbcLMXjy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Dec 2016 18:39:54 -0500
Subject: Re: [PATCH v3 1/1] x86/kbuild: enable modversions for symbols
 exported from asm
References: <20161211005211.GA11607@angband.pl>
 <20161211010918.16050-1-kilobyte@angband.pl>
From: Michal Marek <mmarek@suse.com>
Message-ID: <f90af458-f022-2291-10d5-2783da61873c@suse.com>
Date: Wed, 14 Dec 2016 00:39:50 +0100
MIME-Version: 1.0
In-Reply-To: <20161211010918.16050-1-kilobyte@angband.pl>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adam Borowski <kilobyte@angband.pl>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Nicholas Piggin <npiggin@gmail.com>

Dne 11.12.2016 v 02:09 Adam Borowski napsal(a):
> Commit 4efca4ed ("kbuild: modversions for EXPORT_SYMBOL() for asm") adds
> modversion support for symbols exported from asm files. Architectures
> must include C-style declarations for those symbols in asm/asm-prototypes.h
> in order for them to be versioned.
> 
> Add these declarations for x86, and an architecture-independent file that
> can be used for common symbols.
> 
> With f27c2f6 reverting 8ab2ae6 ("default exported asm symbols to zero") we
> produce a scary warning on x86, this commit fixes that.
> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> Tested-by: Kalle Valo <kvalo@codeaurora.org>
> Acked-by: Nicholas Piggin <npiggin@gmail.com>
> Tested-by: Peter Wu <peter@lekensteyn.nl>
> Tested-by: Oliver Hartkopp <socketcan@hartkopp.net>

Applied to kbuild.git#kbuild now.

Michal
