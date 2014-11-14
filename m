Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0229.hostedemail.com ([216.40.44.229]:44398 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1161609AbaKNR3d (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Nov 2014 12:29:33 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id C3153B1D5A
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2014 17:22:16 +0000 (UTC)
Message-ID: <1415985728.5912.17.camel@perches.com>
Subject: Re: [PATCH v2 1/2] kernel: printk: specify alignment for struct
 printk_log
From: Joe Perches <joe@perches.com>
Date: Fri, 14 Nov 2014 09:22:08 -0800
In-Reply-To: <1415969446-26356-2-git-send-email-a.ryabinin@samsung.com>
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
	 <1415969446-26356-2-git-send-email-a.ryabinin@samsung.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, 2014-11-14 at 15:50 +0300, Andrey Ryabinin wrote:
> On architectures that have support for efficient unaligned access
> struct printk_log has 4-byte alignment.
> Specify alignment attribute in type declaration.
> 
> The whole point of this patch is to fix deadlock which happening
> when UBSan detects unaligned access in printk() thus UBSan recursively
> calls printk() with logbuf_lock held by top printk() call.
[]
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
[]
> @@ -223,7 +223,11 @@ struct printk_log {
>  	u8 facility;		/* syslog facility */
>  	u8 flags:5;		/* internal record flags */
>  	u8 level:3;		/* syslog level */
> -};
> +}
> +#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> +__packed __aligned(4)
> +#endif

Why is adding __packed useful or __aligned(4) useful?

The struct is naturally aligned on u64 and should be
the size of 2 u64s.

struct printk_log {
	u64 ts_nsec;		/* timestamp in nanoseconds */
	u16 len;		/* length of entire record */
	u16 text_len;		/* length of text buffer */
	u16 dict_len;		/* length of dictionary buffer */
	u8 facility;		/* syslog facility */
	u8 flags:5;		/* internal record flags */
	u8 level:3;		/* syslog level */
};

Is there any case when it's not sizeof(u64) * 2?


