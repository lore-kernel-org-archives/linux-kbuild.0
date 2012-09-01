Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40067 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752423Ab2IAP0a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 1 Sep 2012 11:26:30 -0400
Message-ID: <5042291E.6050602@suse.cz>
Date: Sat, 01 Sep 2012 17:26:22 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 44/74] lto: Mark functions used by the vsyscall init code
 visible
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-45-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-45-git-send-email-andi@firstfloor.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

Dne 19.8.2012 04:56, Andi Kleen napsal(a):
> From: Andi Kleen <ak@linux.intel.com>
> 
> The vsyscall code is compiled without LTO. This also includes
> its init function. The function which are called by it have
> to be visible, otherwise they could be optimized away
> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  drivers/char/random.c |    2 +-
>  include/linux/mm.h    |    1 +
>  mm/vmalloc.c          |    2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index b86eae9..33c8fe5 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -1450,7 +1450,7 @@ late_initcall(random_int_secret_init);
>   * depleting entropy is too high
>   */
>  static DEFINE_PER_CPU(__u32 [MD5_DIGEST_WORDS], get_random_int_hash);
> -unsigned int get_random_int(void)
> +__visible unsigned int get_random_int(void)

I think that there should be a comment why the symbol needs to be
visible (just copy the reasoning from the changelog). Otherwise someone
might attempt to do a cleanup a few years later, noticing that there is
no assembler code calling get_random_int().

Michal
