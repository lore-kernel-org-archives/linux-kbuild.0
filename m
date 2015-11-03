Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34821 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932236AbbKCTVb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2015 14:21:31 -0500
MIME-Version: 1.0
In-Reply-To: <5638ECEC.1030604@oracle.com>
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
	<5638ECEC.1030604@oracle.com>
Date: Tue, 3 Nov 2015 21:15:35 +0300
Message-ID: <CAPAsAGzEaA26QoUam3_H4Ygcs__ZwYbsu+V3nZ8e0uqYNPMo4Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] UBSan: run-time undefined behavior sanity checker
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, "x86@kernel.org" <x86@kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

2015-11-03 20:20 GMT+03:00 Sasha Levin <sasha.levin@oracle.com>:
> Anyone knows why wasn't this merged a year ago? I didn't see any review comments, and it
> ended up finding real bugs.
>

Probably because I didn't ping so it just lost.
I'll send v3 after the merge window.
