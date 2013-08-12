Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:42844 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754637Ab3HLEcI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Aug 2013 00:32:08 -0400
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <ananth@in.ibm.com>;
	Sun, 11 Aug 2013 22:32:07 -0600
Date: Mon, 12 Aug 2013 10:01:59 +0530
From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: [PATCH 3/3] kprobes: Use KSYM_NAME_LEN to size identifier buffers
Message-ID: <20130812043159.GA9278@in.ibm.com>
Reply-To: ananth@in.ibm.com
References: <1376182533-17530-1-git-send-email-andi@firstfloor.org>
 <1376182533-17530-3-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376182533-17530-3-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, Joe Mario <jmario@redhat.com>, Andi Kleen <ak@linux.intel.com>

On Sat, Aug 10, 2013 at 05:55:33PM -0700, Andi Kleen wrote:
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
>  kernel/kprobes.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 6e33498..e174daf 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -2083,7 +2083,7 @@ static int __init init_kprobes(void)
>  {
>  	int i, err = 0;
>  	unsigned long offset = 0, size = 0;
> -	char *modname, namebuf[128];
> +	char *modname, namebuf[KSYM_NAME_LEN];
>  	const char *symbol_name;
>  	void *addr;
>  	struct kprobe_blackpoint *kb;
> @@ -2209,7 +2209,7 @@ static int __kprobes show_kprobe_addr(struct seq_file *pi, void *v)
>  	const char *sym = NULL;
>  	unsigned int i = *(loff_t *) v;
>  	unsigned long offset = 0;
> -	char *modname, namebuf[128];
> +	char *modname, namebuf[KSYM_NAME_LEN];
> 
>  	head = &kprobe_table[i];
>  	preempt_disable();
> -- 
> 1.8.3.1

