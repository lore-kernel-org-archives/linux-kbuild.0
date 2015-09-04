Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56892 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754107AbbIDLZZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Sep 2015 07:25:25 -0400
Subject: Re: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
References: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
 <20150422143320.GB19277@sepie.suse.cz> <559EFF2F.1070301@converseincode.com>
 <20150713205933.002f9396@kryten> <20150819154140.GA8820@sepie.suse.cz>
 <55DE6CA8.5000409@converseincode.com> <55DECC61.60705@suse.cz>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55E97F9F.30300@suse.cz>
Date: Fri, 4 Sep 2015 13:25:19 +0200
MIME-Version: 1.0
In-Reply-To: <55DECC61.60705@suse.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>, Anton Blanchard <anton@samba.org>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>

On 2015-08-27 10:37, Michal Marek wrote:
> On 2015-08-27 03:49, Behan Webster wrote:
>> Is there any reason you renamed COMPILER? Because it breaks all the 
>> other patches we have queued up which use it for cross compiling.
>>
>> And aren't we supposed to use all caps for variable names?
> 
> It more like a function now and is consistent with the other cc-*
> definitions in scripts/Kbuild.include.
> 
> 
>> This doesn't only break powerpc, it breaks arm, aarch64 and clang work 
>> that's being done on MIPS malta.
> 
> So do a s/COMPILER/cc-name/ ? You can merge my patch into your tree to
> avoid a dependency on the kbuild tree.

Since I haven't seen any further uses of the $(CLANG) variable in
linux-next, I applied the patch to kbuild.git now.

Michal
