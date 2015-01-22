Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:45133 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbbAVKY5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 05:24:57 -0500
Received: by mail-lb0-f178.google.com with SMTP id u10so706480lbd.9
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2015 02:24:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1421769898.31046.194.camel@decadent.org.uk>
References: <20150114123201.434698327@rtp-net.org>
	<20150114123658.185884720@rtp-net.org>
	<1421239885.19708.82.camel@decadent.org.uk>
	<87lhkyictc.fsf@lebrac.rtp-net.org>
	<1421769898.31046.194.camel@decadent.org.uk>
Date: Thu, 22 Jan 2015 12:24:56 +0200
Message-ID: <CAGNsrLD97yDkUxsNPb9Ni2JNuwxLEamtBxyT9A8VSDwNfZ8BWg@mail.gmail.com>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Arnaud Patard <arnaud.patard@rtp-net.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>

Hi,

On 20 January 2015 at 18:04, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
>> Ben Hutchings <ben@decadent.org.uk> writes:
>>
>> > [Please submit patches inline.]
>>
>> I've no way to control the way quilt is sending mails.
>>
>> >
>> > On Wed, 2015-01-14 at 13:32 +0100, Arnaud Patard wrote:
>> >> When building a package with make deb-pkg (say, for arm), the dtb files are
>> >> not added to the package. Given that things are still evolving on arm, it
>> >> make sense to have them along with the kernel and modules.
>> >>
>> >> v2: make use of dtbs_install
>> >>
>> >> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
>> >> ---
>> >>
>> >> Index: linux-next/scripts/package/builddeb
>> >> ===================================================================
>> >> --- linux-next.orig/scripts/package/builddeb    2015-01-14 13:04:45.845922441 +0100
>> >> +++ linux-next/scripts/package/builddeb 2015-01-14 13:19:26.121883720 +0100
>> >> @@ -143,6 +143,10 @@ else
>> >>         cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
>> >>  fi
>> >>
>> >> +if grep -q "^CONFIG_OF=y" .config ; then
>> >> +       make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
>> >> +fi
>> >
>> > Only arm and arm64 support that target.  You should maybe run something
>> > like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
>> > target is defined.
>>
>> There's a 'set -e' on top of the script so using make -n will likely
>> result in the script failing, which wouldn't be so nice imho.
> [...]
>
> That's why you use it with the if statement:
>
> # Only some architectures with OF support have this target
> if make -n dtbs_install >/dev/null 2>&1; then
>         make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
> fi

Would it be acceptable to have a fallback when dtbs_install isn't available?
It will allow to cover e.g. LTS 3.10 kernel which don't have the target

for example (i.e. can't be upstreamed as-is), I'm using this hack locally:
https://git.linaro.org/kernel/linux-linaro-tracking.git/blob/HEAD:/scripts/package/builddeb#l334

> Ben.

Cheers,
Fathi
