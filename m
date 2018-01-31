Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:33467 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751435AbeAaJwK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jan 2018 04:52:10 -0500
MIME-Version: 1.0
In-Reply-To: <20180131084620.kkok5rpfbqakhyps@mwanda>
References: <20180130190555.6577-1-ulfalizer@gmail.com> <20180130190555.6577-6-ulfalizer@gmail.com>
 <20180131080622.z6yf2h27m4ea3fkx@mwanda> <CAFkk2KS0KQtnVB42tg1M3d1hR+APT7H99dZuzMPoCO63emO3hg@mail.gmail.com>
 <20180131084620.kkok5rpfbqakhyps@mwanda>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 31 Jan 2018 10:52:08 +0100
Message-ID: <CAFkk2KTWkSh0zzK5aXx+FtH1RHBKkwSGr=-Ri1U9d=KbUGXSDA@mail.gmail.com>
Subject: Re: [PATCH 05/10] Staging: rtl8192e: kconfig: Remove empty help text
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Paul Bolle <pebolle@tiscali.nl>

On Wed, Jan 31, 2018 at 9:46 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Jan 31, 2018 at 09:41:24AM +0100, Ulf Magnusson wrote:
>> On Wed, Jan 31, 2018 at 9:06 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> > On Tue, Jan 30, 2018 at 08:05:27PM +0100, Ulf Magnusson wrote:
>> >> In preparation for adding a warning ("kconfig: Warn if help text is
>> >> blank"): https://lkml.org/lkml/2018/1/30/516
>> >>
>> >
>> > Please don't start the boddy of the email in the middle of a sentence.
>> >
>> > It looks like this:
>> >
>> > https://marc.info/?l=linux-driver-devel&m=151733925532413&w=2
>> >
>> > Notice how the subject is up above the From, Date, and Message-id email
>> > headers?  It's totally disconnected from the body of the email.
>> >
>> > regards,
>> > dan carpenter
>>
>> The 'this is in...' was implied. I'll try to be less of a sloppy bastard.
>>
>
> I do feel that patch descriptions should say what the patch does as well
> as why.  Right now the subject says what but I normally read either the
> body or the subject but not both.
>
> regards,
> dan carpenter
>

I fleshed out the individual commit messages and rolled a new
patchset, which adds the warning at the end:
https://lkml.org/lkml/2018/1/31/137

I wonder why that one doesn't display with proper threading on LKML.
It does show the entire thread once you click on one of the later
messages.

Cheers,
Ulf
