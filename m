Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:50316 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366AbbACA66 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 19:58:58 -0500
Received: by mail-wi0-f180.google.com with SMTP id n3so323387wiv.13
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 16:58:56 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <Pine.BSM.4.64L.1501030039230.11222@herc.mirbsd.org>
References: <1420244517-11139-1-git-send-email-sedat.dilek@gmail.com>
	<Pine.BSM.4.64L.1501030039230.11222@herc.mirbsd.org>
Date: Sat, 3 Jan 2015 01:58:56 +0100
Message-ID: <CA+icZUVyK7_nifB7vx8j61Ce7ugXf9F_WfZpNW2hmsYbBLbO1Q@mail.gmail.com>
Subject: Re: [RFC v4] builddeb: Try to determine distribution
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, Jan 3, 2015 at 1:41 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Sedat Dilek dixit:
>
>>Dealing with this issue I learned about "The Colon in the Shell."
>
> Beware of the pitfalls though!
> https://www.mirbsd.org/permalinks/wlog-10_e20141209-tg.htm
>
>>Suggested-by: Thorsten Glaser <tg@debian.org>
>
> Please make this <tg@mirbsd.org> instead. Thank you.
>
>>v4: Embed improvements suggested by Thorsten
> […]
>>diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>index 5972624..f631c77 100755
>
> Looks good to me. Note I did not look at the whole script,
> only reviewed the diff, tonight (and don’t remember what I
> did in 2012).
>

Thanks again.
I have sent out a v5 with corrections.

- Sedat -

> bye,
> //mirabilos
> --
>> Wish I had pine to hand :-( I'll give lynx a try, thanks.
>
> Michael Schmitz on nntp://news.gmane.org/gmane.linux.debian.ports.68k
> a.k.a. {news.gmane.org/nntp}#news.gmane.linux.debian.ports.68k in pine
