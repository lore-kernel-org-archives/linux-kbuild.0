Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:44848 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755667AbbKCRvv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2015 12:51:51 -0500
Subject: Re: [PATCH v2 0/2] UBSan: run-time undefined behavior sanity checker
References: <1415969446-26356-1-git-send-email-a.ryabinin@samsung.com>
 <5638ECEC.1030604@oracle.com>
 <CACT4Y+aOxQO6T9fnev=SrHXwwd9DD=6=7FCDO9_Cst0Ee-TC2g@mail.gmail.com>
 <CACT4Y+bmmVQT598Oagc7KS+4qRu_vVwm8MhAXiGqO0hJHxu_Aw@mail.gmail.com>
From: Sasha Levin <sasha.levin@oracle.com>
Message-ID: <5638F3FB.8000700@oracle.com>
Date: Tue, 3 Nov 2015 12:50:51 -0500
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bmmVQT598Oagc7KS+4qRu_vVwm8MhAXiGqO0hJHxu_Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.cz>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Yury Gribov <y.gribov@samsung.com>, Konstantin Khlebnikov <koct9i@gmail.com>, "x86@kernel.org" <x86@kernel.org>, linux-doc@vger.kernel.org, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

On 11/03/2015 12:45 PM, Dmitry Vyukov wrote:
> On Tue, Nov 3, 2015 at 6:35 PM, Dmitry Vyukov <dvyukov@google.com> wrote:
>> > I guess just nobody reviewed this. I would like to see this merged as well.

Hm, at v2 it was working pretty well and the feeling I got was that there are
no further review comments (rather than no one reviewed it).


Thanks,
Sasha
