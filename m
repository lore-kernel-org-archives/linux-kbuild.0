Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:50499 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753679AbbK3Svy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2015 13:51:54 -0500
Subject: Re: [PATCH v3 2/2] UBSAN: run-time undefined behavior sanity checker
References: <1448899183-8677-1-git-send-email-aryabinin@virtuozzo.com>
 <1448899183-8677-3-git-send-email-aryabinin@virtuozzo.com>
From: Sasha Levin <sasha.levin@oracle.com>
Message-ID: <565C9A8E.4060604@oracle.com>
Date: Mon, 30 Nov 2015 13:50:54 -0500
MIME-Version: 1.0
In-Reply-To: <1448899183-8677-3-git-send-email-aryabinin@virtuozzo.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On 11/30/2015 10:59 AM, Andrey Ryabinin wrote:
> +void __ubsan_handle_shift_out_of_bounds(struct shift_out_of_bounds_data *data,
> +					unsigned long lhs, unsigned long rhs)
> +{
> +	unsigned long flags;
> +	struct type_descriptor *rhs_type = data->rhs_type;
> +	struct type_descriptor *lhs_type = data->lhs_type;
> +	char rhs_str[VALUE_LENGTH];
> +	char lhs_str[VALUE_LENGTH];
> +
> +	if (suppress_report(&data->location))
> +		return;
> +
> +	ubsan_prologue(&data->location, &flags);
> +
> +	val_to_string(rhs_str, sizeof(rhs_str), rhs_type, rhs);
> +	val_to_string(lhs_str, sizeof(lhs_str), lhs_type, lhs);
> +
> +	if (val_is_negative(rhs_type, rhs))
> +		pr_err("shift exponent %s is negative\n", rhs_str);
> +
> +	else if (get_unsigned_val(rhs_type, rhs) >=
> +		type_bit_width(lhs_type))
> +		pr_err("shift exponent %s is to large for %u-bit type %s\n",
					     too

Otherwise looks great, I'm running fuzzing with it now.


Thanks,
Sasha
