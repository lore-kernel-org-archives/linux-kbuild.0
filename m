Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51879 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753799AbcGZVwc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2016 17:52:32 -0400
Subject: Re: [PATCH v2] kbuild: Abort build on bad stack protector flag
References: <20160726212620.GA8511@www.outflux.net>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5797DB96.2020904@suse.com>
Date: Tue, 26 Jul 2016 23:52:22 +0200
MIME-Version: 1.0
In-Reply-To: <20160726212620.GA8511@www.outflux.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kbuild@vger.kernel.org

Dne 26.7.2016 v 23:26 Kees Cook napsal(a):
> Before, the stack protector flag was sanity checked before .config had
> been reprocessed. This meant the build couldn't be aborted early, and
> only a warning could be emitted followed later by the compiler blowing
> up with an unknown flag. This has caused a lot of confusion over time,
> so this splits the flag selection from sanity checking and performs the
> sanity checking after the make has been restarted from a reprocessed
> .config, so builds can be aborted as early as possible now.
> 
> Additionally moves the x86-specific sanity check to the same location,
> since it suffered from the same warn-then-wait-for-compiler-failure
> problem.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
> - fix use of SRCARCH, mmarek
> - simplify stackp-check usage, mmarek

Applied to kbuild.git#kbuild.

Michal

