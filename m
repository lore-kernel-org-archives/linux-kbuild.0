Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:50701 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045Ab2HUEop (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Aug 2012 00:44:45 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <ananth@in.ibm.com>;
	Mon, 20 Aug 2012 22:44:44 -0600
Date: Tue, 21 Aug 2012 10:14:36 +0530
From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: [PATCH 71/74] lto, kprobes: Use KSYM_NAME_LEN to size
	identifier buffers
Message-ID: <20120821044436.GA3519@in.ibm.com>
Reply-To: ananth@in.ibm.com
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org> <1345345030-22211-72-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345345030-22211-72-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Joe Mario <jmario@redhat.com>, Andi Kleen <ak@linux.intel.com>

On Sat, Aug 18, 2012 at 07:57:07PM -0700, Andi Kleen wrote:
> From: Joe Mario <jmario@redhat.com>
> 
> Use KSYM_NAME_LEN to size identifier buffers, so that it can
> be easier increased.
> 
> Cc: ananth@in.ibm.com
> Signed-off-by: Joe Mario <jmario@redhat.com>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

Acked-by: Ananth N Mavinakayanahalli <ananth@in.ibm.com>

> ---
>  kernel/kprobes.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index c62b854..b9bd2a8 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1955,7 +1955,7 @@ static int __init init_kprobes(void)
>  {
>  	int i, err = 0;
>  	unsigned long offset = 0, size = 0;
> -	char *modname, namebuf[128];
> +	char *modname, namebuf[KSYM_NAME_LEN];
>  	const char *symbol_name;
>  	void *addr;
>  	struct kprobe_blackpoint *kb;
> @@ -2081,7 +2081,7 @@ static int __kprobes show_kprobe_addr(struct seq_file *pi, void *v)
>  	const char *sym = NULL;
>  	unsigned int i = *(loff_t *) v;
>  	unsigned long offset = 0;
> -	char *modname, namebuf[128];
> +	char *modname, namebuf[KSYM_NAME_LEN];
> 
>  	head = &kprobe_table[i];
>  	preempt_disable();
> -- 
> 1.7.7.6

