Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:42713 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbaFJIPZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 04:15:25 -0400
Received: by mail-lb0-f169.google.com with SMTP id s7so3744567lbd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 01:15:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1402272928.23860.55.camel@deadeye.wl.decadent.org.uk>
References: <1397307186-3977-1-git-send-email-fathi.boudra@linaro.org>
	<1397307186-3977-2-git-send-email-fathi.boudra@linaro.org>
	<1397395563.10849.79.camel@deadeye.wl.decadent.org.uk>
	<1402272928.23860.55.camel@deadeye.wl.decadent.org.uk>
Date: Tue, 10 Jun 2014 11:15:23 +0300
Message-ID: <CAGNsrLAiK88Lfz1nhZgB8FUgCDO88g462uJG+yKZ139_AZymeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] builddeb: add arm64 in the supported architectures
From: Fathi Boudra <fathi.boudra@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Maximilian Attems <maks@debian.org>, Ian Campbell <ijc@hellion.org.uk>

On 9 June 2014 03:15, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Sun, 2014-04-13 at 14:26 +0100, Ben Hutchings wrote:
>> On Sat, 2014-04-12 at 15:53 +0300, Fathi Boudra wrote:
>> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>>
>> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
>>
>> > ---
>> >  scripts/package/builddeb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> > index f46e4dd..0bf29a6 100644
>> > --- a/scripts/package/builddeb
>> > +++ b/scripts/package/builddeb
>> > @@ -42,6 +42,8 @@ create_package() {
>> >             debarch=hppa ;;
>> >     mips*)
>> >             debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
>> > +   arm64)
>
> Now I'm not so sure.  As we are comparing with the 'machine' name
> ($UTS_MACHINE, not $ARCH or $SRCARCH), shouldn't this actually check for
> aarch64?

not sure. I've seen Ian comment (added to the cc list). He's proposing:

[...]
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -28,7 +28,7 @@ create_package() {
        # Attempt to find the correct Debian architecture
        local forcearch="" debarch=""
        case "$UTS_MACHINE" in
-       i386|ia64|alpha)
+       i386|ia64|alpha|arm64)
                debarch="$UTS_MACHINE" ;;
        x86_64)
                debarch=amd64 ;;
[...]

I'm taking a closer look now.

> Ben.
>
>> > +           debarch=arm64 ;;
>> >     arm*)
>> >             debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
>> >     *)
>>
>
> --
> Ben Hutchings
> One of the nice things about standards is that there are so many of them.
