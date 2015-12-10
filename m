Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.parallels.com ([199.115.105.18]:40530 "EHLO
	mx2.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751564AbbLJPsO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2015 10:48:14 -0500
Subject: Re: [PATCH v4 0/3] UBSAN: run-time undefined behavior sanity checker
References: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
 <20151204163747.0bb51d61832ac75bfc73ce0c@linux-foundation.org>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <56699ECC.4020808@virtuozzo.com>
Date: Thu, 10 Dec 2015 18:48:28 +0300
MIME-Version: 1.0
In-Reply-To: <20151204163747.0bb51d61832ac75bfc73ce0c@linux-foundation.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On 12/05/2015 03:37 AM, Andrew Morton wrote:
> On Thu, 3 Dec 2015 18:50:04 +0300 Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
> 
>> UBSAN is run-time undefined behaviour checker. It uses compile-time
>> instrumentation to catch undefined behavior (UB). Compiler inserts code
>> that perform certain kinds of checks before operations that could cause UB.
>> If check fails (i.e. UB detected) __ubsan_handle_* function called to print error message.
> 
> What I'd like to see in this changelog is a description of any kernel
> issues which this checker has already identified: what were they and
> what was their potential impact at runtime.
> 
> This info will help us to understand the value of the proposed feature.
> 


It's hard for me to judge about runtime impact of those bugs,
as don't know much about what that bugged code is doing.
Frankly speaking, nothing looks too scary for me, although some bugs would
be hard to find without UBSAN.


Found bugs:

	* out-of-bounds access - 97840cb67ff5 ("netfilter: nfnetlink: fix insufficient validation in nfnetlink_bind")

undefined shifts:
	* d48458d4a768 ("jbd2: use a better hash function for the revoke table")
	* 10632008b9e1 ("clockevents: Prevent shift out of bounds")
	* 'x << -1' shift in ext4 - http://lkml.kernel.org/r/<5444EF21.8020501@samsung.com>
	* undefined rol32(0) - http://lkml.kernel.org/r/<1449198241-20654-1-git-send-email-sasha.levin@oracle.com>
	* undefined dirty_ratelimit calculation - http://lkml.kernel.org/r/<566594E2.3050306@odin.com>
	* undefined roundown_pow_of_two(0) - http://lkml.kernel.org/r/<1449156616-11474-1-git-send-email-sasha.levin@oracle.com>
	* [WONTFIX] undefined shift in __bpf_prog_run - http://lkml.kernel.org/r/<CACT4Y+ZxoR3UjLgcNdUm4fECLMx2VdtfrENMtRRCdgHB2n0bJA@mail.gmail.com>
		WONTFIX here because it should be fixed in bpf program, not in kernel.

signed overflows:
	* 32a8df4e0b33f ("sched: Fix odd values in effective_load() calculations")
	* mul overflow in ntp - http://lkml.kernel.org/r/<1449175608-1146-1-git-send-email-sasha.levin@oracle.com>
	* incorrect conversion into rtc_time in rtc_time64_to_tm() - http://lkml.kernel.org/r/<1449187944-11730-1-git-send-email-sasha.levin@oracle.com>
	* unvalidated timespec in io_getevents() - http://lkml.kernel.org/r/<CACT4Y+bBxVYLQ6LtOKrKtnLthqLHcw-BMp3aqP3mjdAvr9FULQ@mail.gmail.com>
	* [NOTABUG] signed overflow in ktime_add_safe() - http://lkml.kernel.org/r/<CACT4Y+aJ4muRnWxsUe1CMnA6P8nooO33kwG-c8YZg=0Xc8rJqw@mail.gmail.com>
		

