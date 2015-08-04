Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38672 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933819AbbHDL52 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Aug 2015 07:57:28 -0400
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <55B938EA.2080402@infradead.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55C0A8A1.2030706@suse.com>
Date: Tue, 4 Aug 2015 13:57:21 +0200
MIME-Version: 1.0
In-Reply-To: <55B938EA.2080402@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, "Luis R. Rodriguez" <mcgrof@suse.com>

Dne 29.7.2015 v 22:34 Randy Dunlap napsal(a):
> On 07/29/15 13:09, Luis R. Rodriguez wrote:
>> From: "Luis R. Rodriguez" <mcgrof@suse.com>
>>
>> Recursive dependency issues with kconfig are unavoidable due to
>> some limitations with kconfig, since these issues are recurring
>> provide a hint to the user how they can resolve these dependency
>> issues and also document why such limitation exists.

Good idea.


>> +Kconfig's limitations can be addressed by implementing a SAT solver for it,
>> +but until then, Kconfig is limitted to require developers to use one of
> 
>                               limited

should I apply the patch with the typo fixed or are you going to send a v2?

Thanks,
Michal
