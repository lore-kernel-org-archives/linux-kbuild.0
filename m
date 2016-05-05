Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49534 "EHLO
	conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757359AbcEEOuQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2016 10:50:16 -0400
MIME-Version: 1.0
In-Reply-To: <1462435694.44077.9.camel@intel.com>
References: <1462434312-19422-1-git-send-email-yamada.masahiro@socionext.com>
	<1462435694.44077.9.camel@intel.com>
Date: Thu, 5 May 2016 23:49:56 +0900
Message-ID: <CAK7LNAT4XMudrUvUVzqcUGpXGvGAniY8=6nwy64241AipVhfaA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix if_change and friends to consider argument order
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarek@suse.com" <mmarek@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dhowells@redhat.com" <dhowells@redhat.com>

2016-05-05 17:08 GMT+09:00 Woodhouse, David <david.woodhouse@intel.com>:
> On Thu, 2016-05-05 at 16:45 +0900, Masahiro Yamada wrote:
>>
>> This commit fixes arg-check to compare two strings as a whole.
>> $(strip ...) is important because we want to ignore the difference
>> that comes from white-spaces.
>
> Do we?
>
> I can construct a hypothetical situation in which whitespace differs
> and we *do* want it to make a difference (for example I used to sign
> with a key called 'My Signing Key.pem' and now I've changed to use
> 'My  Signing  Key.pem'. (OK, it's a *stupid* example but still...)
>
> I couldn't come up with the converse — where whitespace does change for
> some reason, but we really don't want to rebuild.
>
> Should we err on the side of caution, and let whitespace changes
> trigger a rebuild?
>
> --
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation
>



Please hold on.

I noticed some side effect on this patch.

I need to test it more carefully.



-- 
Best Regards
Masahiro Yamada
