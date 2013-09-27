Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47729 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929Ab3I0KTU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Sep 2013 06:19:20 -0400
Message-ID: <52455BA2.2020805@suse.cz>
Date: Fri, 27 Sep 2013 12:19:14 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix allmodconfig
References: <1379805443-10945-1-git-send-email-yann.morin.1998@free.fr> <20130921232102.GC3221@free.fr> <20130926213621.GF3418@free.fr>
In-Reply-To: <20130926213621.GF3418@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>

On 26.9.2013 23:36, Yann E. MORIN wrote:
> Hello All!
> 
> On 2013-09-22 01:21 +0200, Yann E. MORIN spake thusly:
>> Stephen, All,
>>
>> Please, test this patch to fix the allmodconfig issue reported by
>> Stephen.
>>
>> From my little testing (some randconfig followed by silentoldconfig, as
>> well as allmodconfig), this patch seems to fix the issue without any
>> regression I could ientify.
>>
>> But since this is sensitive code, I'd like some feedback before this
>> gets applied.
> 
> Ping? :-)
> 
> I wanted to push this right after -rc3 is out. If any one has an issue
> with that patch, you've got a few days to chime in! ;-)

It works for me, you can add my Tested-by: if you like. The only issue I
have is that a more verbose changelog is missing.

Michal
