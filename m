Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:49680 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932346AbcCHJLu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Mar 2016 04:11:50 -0500
Date: Tue, 8 Mar 2016 10:10:21 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] kbuild: Add option to turn incompatible pointer check
 into error
In-Reply-To: <1457425749-24110-1-git-send-email-wagi@monom.org>
Message-ID: <alpine.DEB.2.11.1603081010000.6083@nanos>
References: <1457425749-24110-1-git-send-email-wagi@monom.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Wagner <wagi@monom.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>

On Tue, 8 Mar 2016, Daniel Wagner wrote:

> From: Daniel Wagner <daniel.wagner@bmw-carit.de>
> 
> With the introduction of the simple wait API we have two very
> similar APIs in the kernel. For example wake_up() and swake_up()
> is only one character away. Although the compiler will warn
> happily the wrong usage it keeps on going an even links the kernel.
> Thomas and Peter would rather like to see early missuses reported
> as error early on.
> 
> In a first attempt we tried to wrap all swait and wait calls
> into a macro which has an compile time type assertion. The result
> was pretty ugly and wasn't able to catch all wrong usages.
> woken_wake_function(), autoremove_wake_function() and wake_bit_function()
> are assigned as function pointers. Wrapping them with a macro around is
> not possible. Prefixing them with '_' was also not a real option
> because there some users in the kernel which do use them as well.
> All in all this attempt looked to intrusive and too ugly.
> 
> An alternative is to turn the pointer type check into an error which
> catches wrong type uses. Obviously not only the swait/wait ones. That
> isn't a bad thing either.
> 
> Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Thomas Gleixner <tglx@linutronix.de>

