Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53124 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932413Ab1EXOQL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 10:16:11 -0400
MIME-Version: 1.0
In-Reply-To: <4DD0E06C.2040009@suse.cz>
References: <1305516176-4072-1-git-send-email-lacombar@gmail.com>
	<4DD0E06C.2040009@suse.cz>
Date: Tue, 24 May 2011 10:16:11 -0400
Message-ID: <BANLkTi=bZe6T9hM+bUMBM1Jy5xVHP2x9cg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not record timestamp in .config
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal,

2011/5/16 Michal Marek <mmarek@suse.cz>:
> On 16.5.2011 05:22, Arnaud Lacombe wrote:
>>
>> Hi Michal,
>>
>> The following patch removes the timestamp in .config file. This is a
>> prerequiresite for the revised version of the printer merge I sent back
>> in December[0]. The issue is that heading comment generations will be
>> merged in a single function, and that would revert the deterministic
>> change you made in mid-April.
>>
>> The other options are either to have timestamp always enabled and
>> disable them selectively, but that might be a pain to implement, or to
>> have timestamp disable by default and an environment variable, say
>> KCONFIG_TIMESTAMP, to turn everything on manually.
>
> I personally am not a big fan of embedded timestamps, so
>
> Acked-by: Michal Marek <mmarek@suse.cz>
>
Do you intend to merge that patch for .1 (or whatever Linus decides to
call the next kernel) ?

 - Arnaud
