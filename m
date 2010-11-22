Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:39518 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755943Ab0KVCRh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 21 Nov 2010 21:17:37 -0500
MIME-Version: 1.0
In-Reply-To: <20101121180941.16d787ab.randy.dunlap@oracle.com>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>
	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>
	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>
	<20101121180941.16d787ab.randy.dunlap@oracle.com>
Date: Sun, 21 Nov 2010 21:17:37 -0500
Message-ID: <AANLkTikN6d9+icvwYp8Ntsa8M_USQd5QdNN24hoK2soY@mail.gmail.com>
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, catalin.marinas@arm.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>

Hi,

On Sun, Nov 21, 2010 at 9:09 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> On Sun, 21 Nov 2010 20:58:54 -0500 Arnaud Lacombe wrote:
>> [..]
>> Alternatively, if you don't care about the menu structure, Randy
>> proposed a one-liner.
>
> which Mauro nacked.
>
> I don't care about the menu structure, I just want to eliminate the
> warnings.
>
Yes, I know. I just wanted to raise the point "if you don't care about
the menu structure, a oneliner can do the job".

 - Arnaud
