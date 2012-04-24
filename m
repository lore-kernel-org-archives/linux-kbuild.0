Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out01.mta.xmission.com ([166.70.13.231]:48564 "EHLO
	out01.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752266Ab2DXKdn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Apr 2012 06:33:43 -0400
From: ebiederm@xmission.com (Eric W. Biederman)
References: <m1aa22rllb.fsf@fess.ebiederm.org> <4F96705C.5030901@suse.cz>
Date: Tue, 24 Apr 2012 03:37:46 -0700
In-Reply-To: <4F96705C.5030901@suse.cz> (Michal Marek's message of "Tue, 24
	Apr 2012 11:20:28 +0200")
Message-ID: <m11undpg91.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: [PATCH] kbuld: Implement oldmodconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org

Michal Marek <mmarek@suse.cz> writes:

> Dne 24.4.2012 02:59, Eric W. Biederman napsal(a):
>> 
>> While verifying that my user namespace patches are as complete as I
>> expect them to be I came a came across the need to build kernel
>> configurations with a few choice settings disabled and everything else
>> enabled.  Adding a make oldmodconfig made generating those
>> configurations straight forward, as now I can set the options I care
>> about and the oldmodconfig can answering everything else for me in a
>> consistent way.
>
> Doesn't
>
> KCONFIG_ALLCONFIG=base.config make allmodconfig
>
> do the same thing? If not, the difference should be explained in the
> changelog.

The only difference apparently is that KCONFIG_ALLCONFIG... allmodconfig 
does not show up in the help and is rather unintuitively named so I
totally missed it's presence.

If I get ambitious I might fix the bug that KCONFIG_ALLCONFIG uses some
other working directory when reading a file than the directory that make
was run in.  Which is compounded by the fact that if KCONFIG_ALLCONFIG
can't find your file it treats it as if you had not specified the file
and does this all silently making it just about impossible to debug
without instrumenting up conf.c and confdata.c

So please feel free to drop my patch.

Eric
