Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:36104 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936AbbACJct (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 3 Jan 2015 04:32:49 -0500
Received: by mail-wg0-f53.google.com with SMTP id x13so7160424wgg.26
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Jan 2015 01:32:47 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20150103062226.GA7357@gluino>
References: <1420246852-7113-1-git-send-email-sedat.dilek@gmail.com>
	<1420254507.5686.130.camel@decadent.org.uk>
	<20150103062226.GA7357@gluino>
Date: Sat, 3 Jan 2015 10:32:47 +0100
Message-ID: <CA+icZUWK-_yTjraaxe3y3C3YWf8=NSjGP2X74s7S8p5J8DMVXQ@mail.gmail.com>
Subject: Re: [RFC v5] builddeb: Try to determine distribution
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>, Thorsten Glaser <tg@mirbsd.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, Jan 3, 2015 at 7:22 AM, maximilian attems <max@stro.at> wrote:
> On Sat, Jan 03, 2015 at 03:08:27AM +0000, Ben Hutchings wrote:
>> On Sat, 2015-01-03 at 02:00 +0100, Sedat Dilek wrote:
>> > lsb_release command is a good choice to determine the distribution
>> > name for the changelog file in the generated Debian packages [1].
>> > Its installation is no precondition.
>> > In Debian it is still not essential or build-essential.
>> >
>> > Ben gave some helpful informations and detailed explanations in [2].
>> > There he also suggested to have an option to explicitly set the
>> > distribution name (see $KDEB_CHANGELOG_DIST variable).
>> >
>> > Embedded the improvement as suggested by Thorsten (see [3]):
>> >
>> > "This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
>> > lsb_release is not necessary. The following snippet
>> > also omits using its output if it fails but still
>> > produces any:"
>> >
>> > Dealing with this issue I learned about "The Colon in the Shell." and
>> > possible pitfalls in this area (see [4,5]). Furthermore, refreshed my
>> > knowledge about redirecting outputs with the echo command (see [5]).
>> > Special thanks to Thorsten, I enjoyed the IRC session with you.
>> >
>> > Cooked together the snippets of Ben and Thorsten (see [2,3]).
>> > Tested against Linux v3.19-rc2.
>> >
>> > Thanks goes to Alexander, Ben, maximilian and Thorsten for the very
>> > vital help.
>> >
>> > [1] https://lkml.org/lkml/2012/4/23/516
>> > [2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2
>> > [3] http://marc.info/?l=linux-kbuild&m=142023476825460&w=2
>> > [4] http://blog.brlink.eu/index.html#i70
>> > [5] https://www.mirbsd.org/permalinks/wlog-10_e20141209-tg.htm
>> > [6] http://stackoverflow.com/questions/23489934/echo-2-some-text-what-does-it-mean-in-shell-scripting
>> >
>> > CC: Ben Hutchings <ben@decadent.org.uk>
>>
>> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
> Acked-by: maximilian attems <max@stro.at>

Thanks Ben and maximilian.

I will send out a proper patch with your Reviewed-by and Acked-by,
also add a R-b for the snippet of Thorsten.

- Sedat -

>>
>> > CC: maximilian attems <max@stro.at>
>> > CC: Thorsten Glaser <tg@mirbsd.org>
>> > CC: Alexander Wirt <formorer@debian.org>
>> > CC: Michal Marek <mmarek@suse.cz>
>> > CC: linux-kbuild@vger.kernel.org
>> > Suggested-by: Ben Hutchings <ben@decadent.org.uk>
>> > Suggested-by: Thorsten Glaser <tg@mirbsd.org>
>> > Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
>> > ---
>> > v5: Improve commit-message and fix Thorsten's email-address
>> > v4: Embed improvements suggested by Thorsten
>> > v3: Massaged the commit-message
>> > v2: Suppress error messages when lsb_release is not installed.
>> >     (Thanks maximilian and Ben.)
>> >
>> >  scripts/package/builddeb | 13 ++++++++++++-
>> >  1 file changed, 12 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> > index 5972624..f631c77 100755
>> > --- a/scripts/package/builddeb
>> > +++ b/scripts/package/builddeb
>> > @@ -217,9 +217,20 @@ else
>> >  fi
>> >  maintainer="$name <$email>"
>> >
>> > +# Try to determine distribution
>> > +if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>> > +        distribution=$KDEB_CHANGELOG_DIST
>> > +elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ]; then
>> > +        : # nothing to do in this case
>> > +else
>> > +        distribution="unstable"
>> > +        echo >&2 "Using default distribution of 'unstable' in the changelog"
>> > +        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
>> > +fi
>> > +
>> >  # Generate a simple changelog template
>> >  cat <<EOF > debian/changelog
>> > -linux-upstream ($packageversion) unstable; urgency=low
>> > +linux-upstream ($packageversion) $distribution; urgency=low
>> >
>> >    * Custom built Linux kernel.
>> >
>>
>> --
>> Ben Hutchings
>> Theory and practice are closer in theory than in practice.
>>                                 - John Levine, moderator of comp.compilers
>
>
