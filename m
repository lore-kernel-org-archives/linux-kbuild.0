Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:34637 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753600AbbLJBQW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2015 20:16:22 -0500
Received: by pacfl14 with SMTP id fl14so3936075pac.1
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Dec 2015 17:16:21 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v4 3/3] UBSAN: run-time undefined behavior sanity checker
Date: Thu, 10 Dec 2015 12:15:51 +1100
Message-Id: <1449710151-18902-1-git-send-email-dja@axtens.net>
In-Reply-To: <1449157807-20298-4-git-send-email-aryabinin@virtuozzo.com>
References: <1449157807-20298-4-git-send-email-aryabinin@virtuozzo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sasha Levin <sasha.levin@oracle.com>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, hpa@zytor.com, Yury Gribov <y.gribov@samsung.com>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Kostya Serebryany <kcc@google.com>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Daniel Axtens <dja@axtens.net>

Hi Andrey,

>+	select ARCH_HAS_UBSAN_SANTIZE_ALL

I think you've missed an I in SAN*I*TIZE here.

Apart from that, I've tested that this works on PowerPC, so:
Tested-by: Daniel Axtens <dja@axtens.net> # on PowerPC only

Regards,
Daniel
