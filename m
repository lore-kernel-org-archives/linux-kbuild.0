Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.parallels.com ([199.115.105.18]:57586 "EHLO
	mx2.parallels.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756004AbbLGQsI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Dec 2015 11:48:08 -0500
Subject: Re: [PATCH v4 0/3] UBSAN: run-time undefined behavior sanity checker
References: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
 <20151204163747.0bb51d61832ac75bfc73ce0c@linux-foundation.org>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <5665B860.9040404@virtuozzo.com>
Date: Mon, 7 Dec 2015 19:48:32 +0300
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

Sure, I'll come back soon with a list of found bugs.

> Thanks.
> 
