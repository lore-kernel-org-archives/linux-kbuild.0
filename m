Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:43296 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbbABVpo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 16:45:44 -0500
Received: by mail-wi0-f172.google.com with SMTP id n3so182137wiv.17
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 13:45:43 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <Pine.BSM.4.64L.1501022120500.11222@herc.mirbsd.org>
References: <1420233405-23121-1-git-send-email-sedat.dilek@gmail.com>
	<Pine.BSM.4.64L.1501022120500.11222@herc.mirbsd.org>
Date: Fri, 2 Jan 2015 22:45:43 +0100
Message-ID: <CA+icZUUGZ3FuX3o58JkvQ56o1eAWmhb_=gK=vE8BLiVk0Q+PDQ@mail.gmail.com>
Subject: Re: [RFC v3] builddeb: Try to determine distribution
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, Jan 2, 2015 at 10:23 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Sedat Dilek dixit:
>
>>+# Try to determine distribution
>>+codename=$(lsb_release --codename --short 2> /dev/null)
>>+if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>>+        distribution=$KDEB_CHANGELOG_DIST
>>+elif [ -n "$codename" ]; then
>
> This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
> lsb_release is not necessary. The following snippet
> also omits using its output if it fails but still
> produces any:
>
> if test -n "$KDEB_CHANGELOG_DIST"; then
>         distribution=$KDEB_CHANGELOG_DIST
> elif distribution=$(lsb_release -cs 2>/dev/null) && test -n "$distribution"; then
>         :
> else
>         distribution=unstable
>         echo "builddeb: Using default distribution of 'unstable' in the changelog"
>         echo "builddeb: Set \$KDEB_CHANGELOG_DIST or install lsb-release to change this"
> fi
>

Happy 2015 mira!

Ben suggested originally...

So how about something like:

if [ -n "$KDEB_CHANGELOG_DIST" ]; then
        distribution="$KDEB_CHANGELOG_DIST"
elif ! distribution="$(lsb_release --codename --short 2>/dev/null)"; then
        distribution=unstable
        echo "I: Using default distribution of 'unstable' in the changelog"
        echo "I: Install lsb-release or set \$KDEB_CHANGELOG_DIST to
change this"
fi

Is that "inversion" doing the same?
I hoped to do it a bit more "human-readable" (for me) and made it worse.

How can I embed the name of the script "builddeb" into the outputs in
case we fall back to default distro-name?
BTW, builddeb is the script invoked via 'make deb-pkg'.

- Sedat -
