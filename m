Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:50636 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036AbbABTUG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 14:20:06 -0500
Received: by mail-wg0-f50.google.com with SMTP id a1so24694315wgh.9
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 11:20:04 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <1420221867.5686.117.camel@decadent.org.uk>
References: <1420210672-12712-1-git-send-email-sedat.dilek@gmail.com>
	<20150102151227.GA2658@sepie.suse.cz>
	<CA+icZUUpxLS6B2RNGdkvEzmmPRi8TtJ6ySO3N0uLQgkuEPahEQ@mail.gmail.com>
	<1420221867.5686.117.camel@decadent.org.uk>
Date: Fri, 2 Jan 2015 20:20:04 +0100
Message-ID: <CA+icZUWvmL6Taa2Qpr2y-V7pcfT+4w2xUjvMU6Hiy-L6LY-zVw@mail.gmail.com>
Subject: Re: [3.19-rc2] builddeb: Update year and git repository URL in debian/copyright
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org

On Fri, Jan 2, 2015 at 7:04 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Fri, 2015-01-02 at 16:18 +0100, Sedat Dilek wrote:
>> On Fri, Jan 2, 2015 at 4:12 PM, Michal Marek <mmarek@suse.cz> wrote:
>> > On Fri, Jan 02, 2015 at 03:57:52PM +0100, Sedat Dilek wrote:
>> >> Happy new 2015!
>> >>
>> >> I have combined two patches which I had already sent to linux-kbuild ML.
>> >
>> > Applied to kbuild.git#misc, thanks.
>> >
>>
>> /o\
>>
>> Just FYI...
>> I will send out the 3rd in the original triple as "[RFC RESEND]
>> builddeb: Try to determine distribution" against kbuild-next.
>> From the discussion:
>> max had some concerns and if I remember correctly I got no alternativ
>> proposal from him.
>> Today, I asked friends on #grml on how to do it better.
>> I will try to find out if I can ensure lsb_release binary is available
>> in all supported Debian/Ubuntu release.
>> Not sure if this really necessary.
>
> lsb-release is still not essential or build-essential in Debian.
>
> The distribution (queue) name in the changelog only matters when
> uploading to a distribution's package repository, and a builddeb-
> generated binary package generally won't be accepted into such a
> repository as there is no corresponding Debian-format source package.
>
> In case some Debian derivative or private repository does accept
> builddeb-generated binary packages, perhaps it is useful to allow
> changing the distribution name from 'unstable'.  But the distribution
> (queue) name doesn't necessarily match the codename of the running
> release, so we would need to provide some way to set it explicitly.
> (E.g. even the official Debian repositories for wheezy have some
> different queue names: wheezy-proposed-updates, wheezy-security,
> wheezy-backports.)
>
> Apparently this is not needed by most users of builddeb, so we shouldn't
> warn very loudly if lsb_release fails.
>
> So how about something like:
>
> if [ -n "$KDEB_CHANGELOG_DIST" ]; then
>         distribution="$KDEB_CHANGELOG_DIST"
> elif ! distribution="$(lsb_release --codename --short 2>/dev/null)"; then
>         distribution=unstable
>         echo "I: Using default distribution of 'unstable' in the changelog"
>         echo "I: Install lsb-release or set \$KDEB_CHANGELOG_DIST to change this"
> fi
>

Hi Ben

Cool, thanks for your feedback even before I resent my own patch.

OK, the idea of setting $KDEB_CHANGELOG_DIST explicitly is excellent

I tested with the attached snippet which is more readable to me and
all 3 options work.
...
# Try to determine distribution
codename=$(lsb_release --codename --short)
##codename=""
if [ -n "$KDEB_CHANGELOG_DIST" ]; then
        distribution=$KDEB_CHANGELOG_DIST
        ##echo "builddeb: Using \$KDEB_CHANGELOG_DIST"
elif [ -n "$codename" ]; then
        distribution=$codename
        ##echo "builddeb: Using \$codename"
else
        distribution="unstable"
        echo "builddeb: Using default distribution of 'unstable' in
the changelog"
        echo "builddeb: Install lsb-release or set
\$KDEB_CHANGELOG_DIST to change this"
fi
...

How can I pass the script-name (builddeb) into the echo line without
hardcoding it...
...
  INSTALL debian/headertmp/usr/include/asm/ (65 files)
builddeb: Using default distribution of 'unstable' in the changelog
builddeb: Install lsb-release or set $KDEB_CHANGELOG_DIST to change this
dpkg-deb: building package `linux-headers-3.19.0-rc2-3-loopmq-small'
in `../linux-headers-3.19.0-rc2-3-loopmq-small_3.19.0~rc2-3~precise+dileks1_amd64.deb'.
dpkg-deb: building package `linux-libc-dev' in
`../linux-libc-dev_3.19.0~rc2-3~precise+dileks1_amd64.deb'.
dpkg-deb: building package `linux-image-3.19.0-rc2-3-loopmq-small' in
`../linux-image-3.19.0-rc2-3-loopmq-small_3.19.0~rc2-3~precise+dileks1_amd64.deb'.

...or "deb-pkg: ..." like above.

- Sedat -
