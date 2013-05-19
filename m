Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:59151 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751305Ab3ESQWJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 May 2013 12:22:09 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC] mconf: mark empty menus/menuconfigs different form non-empty ones
In-Reply-To: <20130519090855.GA3359@free.fr> (Yann E. MORIN's message of "Sun,
	19 May 2013 11:08:55 +0200")
References: <20130516230404.GB19534@free.fr>
	<1368786492-23751-1-git-send-email-dirk@gouders.net>
	<20130519090855.GA3359@free.fr>
Date: Sun, 19 May 2013 18:22:05 +0200
Message-ID: <ghzjvrkkia.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-05-17 12:28 +0200, Dirk Gouders spake thusly:
>> here is a patch for the scheme you suggested.
>> 
>> I also tried how it looks if empty submenus are maked by "---|" but I
>> think that is a matter of personal preferences and I don't want to try to
>> anticipate what users who use mconf heavily want.
>
> I suggested '----' to floow the scheme for booleans and tristates:
>     [ ] Selectable boolean
>     < > Selectable tristate
>     { } Selectable tristate, forced to at least M
>     - - Unselectable tristate, forced to Y
>
> So I think '----' is a nice fit for '--->'.

Thanks for the explatation, Yann.  Now, I understand why you suggested
exactly that scheme.

Dirk
