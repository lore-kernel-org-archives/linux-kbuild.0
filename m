Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63067 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755170AbaJUKJS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Oct 2014 06:09:18 -0400
Message-id: <544630CA.2000502@samsung.com>
Date: Tue, 21 Oct 2014 14:09:14 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [RFC PATCH] UBSan: run-time undefined behavior sanity checker
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
 <1413802499-17928-2-git-send-email-a.ryabinin@samsung.com>
 <20141021094714.GR23531@worktop.programming.kicks-ass.net>
In-reply-to: <20141021094714.GR23531@worktop.programming.kicks-ass.net>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

On 10/21/2014 01:47 PM, Peter Zijlstra wrote:
> On Mon, Oct 20, 2014 at 02:54:59PM +0400, Andrey Ryabinin wrote:
>>
>> UBSan uses compile-time instrumentation to catch undefined behavior (UB).
>> Compiler inserts code that perform certain kinds of
>> checks before operations that could cause UB.
>> If check fails (i.e. UB detected) __ubsan_handle_* function called.
>> to print error message.
>>
>> So the most of the work is done by compiler.
>> This patch just implements ubsan handlers printing errors.
>>
>> GCC supports this since 4.9, however upcoming GCC 5.0 has
>> more checkers implemented.
> 
> It might be useful if you've got a link to the relevant GCC
> documentation of this new shiny stuf.
> 

Documentation is very brief (look for fsanitize=undefined): https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
GCC 4.9.1 doc: https://gcc.gnu.org/onlinedocs/gcc-4.9.1/gcc/Debugging-Options.html

And there is an article which might be interesting: http://developerblog.redhat.com/2014/10/16/gcc-undefined-behavior-sanitizer-ubsan/



