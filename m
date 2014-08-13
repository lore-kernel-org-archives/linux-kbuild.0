Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59425 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750835AbaHMLmw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Aug 2014 07:42:52 -0400
Message-ID: <53EB4F39.6030501@suse.cz>
Date: Wed, 13 Aug 2014 13:42:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] Documentation: kbuild: Improve grammar
References: <1407511390-5429-1-git-send-email-geert@linux-m68k.org> <1407511390-5429-4-git-send-email-geert@linux-m68k.org> <53EA48F2.6060003@infradead.org>
In-Reply-To: <53EA48F2.6060003@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014-08-12 19:03, Randy Dunlap wrote:
> On 08/08/14 08:23, Geert Uytterhoeven wrote:
>>   - singular versus plural,
>>   - "by" versus "of",
>>   - missing "if", "it", "the",
>>   - consistent use of "xxx-specific" versus "xxx specific".
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  Documentation/kbuild/makefiles.txt | 58 +++++++++++++++++++-------------------
>>  1 file changed, 29 insertions(+), 29 deletions(-)
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Michal, are you going to pick up Geert's 4 kbuild doc. patches
> or should I do it?

I can do it. I'm just waiting for Linus to merge what is currently in
the kbuild branches, before pushing anything else.

Michal

