Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:48744 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756319AbbLEAht (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 19:37:49 -0500
Date: Fri, 4 Dec 2015 16:37:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/3] UBSAN: run-time undefined behavior sanity
 checker
Message-Id: <20151204163747.0bb51d61832ac75bfc73ce0c@linux-foundation.org>
In-Reply-To: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
References: <1449157807-20298-1-git-send-email-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, 3 Dec 2015 18:50:04 +0300 Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:

> UBSAN is run-time undefined behaviour checker. It uses compile-time
> instrumentation to catch undefined behavior (UB). Compiler inserts code
> that perform certain kinds of checks before operations that could cause UB.
> If check fails (i.e. UB detected) __ubsan_handle_* function called to print error message.

What I'd like to see in this changelog is a description of any kernel
issues which this checker has already identified: what were they and
what was their potential impact at runtime.

This info will help us to understand the value of the proposed feature.

Thanks.
