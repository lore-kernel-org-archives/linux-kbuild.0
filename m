Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:17897 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752464AbbACAqZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 19:46:25 -0500
Date: Sat, 3 Jan 2015 00:41:24 +0000 (UTC)
From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [RFC v4] builddeb: Try to determine distribution
In-Reply-To: <1420244517-11139-1-git-send-email-sedat.dilek@gmail.com>
Message-ID: <Pine.BSM.4.64L.1501030039230.11222@herc.mirbsd.org>
References: <1420244517-11139-1-git-send-email-sedat.dilek@gmail.com>
Content-Language: de-DE-1901, en-GB
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Sedat Dilek dixit:

>Dealing with this issue I learned about "The Colon in the Shell."

Beware of the pitfalls though!
https://www.mirbsd.org/permalinks/wlog-10_e20141209-tg.htm

>Suggested-by: Thorsten Glaser <tg@debian.org>

Please make this <tg@mirbsd.org> instead. Thank you.

>v4: Embed improvements suggested by Thorsten
[…]
>diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>index 5972624..f631c77 100755

Looks good to me. Note I did not look at the whole script,
only reviewed the diff, tonight (and don’t remember what I
did in 2012).

bye,
//mirabilos
-- 
> Wish I had pine to hand :-( I'll give lynx a try, thanks.

Michael Schmitz on nntp://news.gmane.org/gmane.linux.debian.ports.68k
a.k.a. {news.gmane.org/nntp}#news.gmane.linux.debian.ports.68k in pine
