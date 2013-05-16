Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:54014 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756256Ab3EPIZG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 May 2013 04:25:06 -0400
Received: from localhost ([193.175.198.193])
	by mx10.gouders.net (8.14.6/8.14.5) with ESMTP id r4G8P32D018375
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2013 10:25:03 +0200
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC] mconf: suppress empty submenus
In-Reply-To: <1368626738-31911-1-git-send-email-dirk@gouders.net> (Dirk
	Gouders's message of "Wed, 15 May 2013 16:05:37 +0200")
References: <1368626738-31911-1-git-send-email-dirk@gouders.net>
Date: Thu, 16 May 2013 10:24:58 +0200
Message-ID: <gihai3uyat.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Dirk Gouders <dirk@gouders.net> writes:

> Hello,
>
> I noticed that sometimes it happens that there are empty
> submenus, and I tried to see if they can't be suppressed
> by mconf (if not explicitely done by the kbuild-language).
>
> Well, I am not sure if someone wants this change and also
> if I realized all possible situations and therefore the
> patch is not meant to be accepted as is but as a proof-of-concept.
>
> Because of that I implemented the changes as a new function
> menu_is_visible_new() and a helper function that walks the whole menu
> structure and compares the results of the old and the new function.
>
> I also tried to add coments to the new function which reflect
> my understanding but of course might be incomplete or even wrong.
>
> I'd be glad if someone takes the time to test and/or review
> the code or comment on the sanity of such a change.
>
> Attached is an example output of the helper function (i.e.
> empty dialogs that would be suppressed by the menu_is_visible_new()).

Sorry, I noticed the first problem with one potential user (nconfig) of
such a change: with `nconfig' one cannot enter those hidden empty
submenus even when turning on all options with (F4), in which case the
submenu wouldn't be empty.

So, for a complete proof-of-concept I need to do some more work which I
think should also contain a proof that the setting of the
SYMBOL_DEF_USER flag behaves exactly the same as before.

Dirk

PS: In the original message, `sed s/kbuild/kconfig/', of course.
