Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:33747 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754305AbaJVJ65 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Oct 2014 05:58:57 -0400
Received: by mail-lb0-f169.google.com with SMTP id 10so2558280lbg.28
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Oct 2014 02:58:56 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH] UBSan: run-time undefined behavior sanity checker
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
	<1413802499-17928-2-git-send-email-a.ryabinin@samsung.com>
Date: Wed, 22 Oct 2014 11:58:54 +0200
In-Reply-To: <1413802499-17928-2-git-send-email-a.ryabinin@samsung.com>
	(Andrey Ryabinin's message of "Mon, 20 Oct 2014 14:54:59 +0400")
Message-ID: <871tq077dt.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

On Mon, Oct 20 2014, Andrey Ryabinin <a.ryabinin@samsung.com> wrote:

> UBSan uses compile-time instrumentation to catch undefined behavior (UB).
> Compiler inserts code that perform certain kinds of
> checks before operations that could cause UB.
> If check fails (i.e. UB detected) __ubsan_handle_* function called.
> to print error message.
>
> So the most of the work is done by compiler.
> This patch just implements ubsan handlers printing errors.
>
> GCC supports this since 4.9, however upcoming GCC 5.0 has
> more checkers implemented.

[...]

> +
> +#define REPORTED_BIT 31
> +#define COLUMN_MASK (~(1U << REPORTED_BIT))
> +
> +static bool is_disabled(struct source_location *location)
> +{
> +	return test_and_set_bit(REPORTED_BIT,
> +				(unsigned long *)&location->column);
> +}

[...]

> +struct source_location {
> +	const char *file_name;
> +	u32 line;
> +	u32 column;
> +};


AFAICT, this introduces UB and/or memory corruption on big-endian
systems with BITS_PER_LONG==64. (Also, on both LE and BE 64 bit systems,
there's the issue of the alignment of location->column, which is likely
to be 4-but-not-8 byte aligned).

Is the layout of struct source_location dictated by gcc? 

Rasmus
