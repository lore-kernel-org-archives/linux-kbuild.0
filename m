Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:33419 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750783AbbABU3E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 15:29:04 -0500
Received: by mail-we0-f179.google.com with SMTP id q59so4919093wes.38
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 12:29:03 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20150102202151.GA3519@gluino>
References: <1420229669-5550-1-git-send-email-sedat.dilek@gmail.com>
	<20150102202151.GA3519@gluino>
Date: Fri, 2 Jan 2015 21:29:02 +0100
Message-ID: <CA+icZUWkHnXvRT4b2UVitScHJqPJsSb2j6DJVL4wJcJFBhocoQ@mail.gmail.com>
Subject: Re: [RFC] builddeb: Try to determine distribution
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: Ben Hutchings <ben@decadent.org.uk>, Thorsten Glaser <tg@debian.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, Jan 2, 2015 at 9:21 PM, maximilian attems <max@stro.at> wrote:
>
>
> On Fri, Jan 02, 2015 at 09:14:29PM +0100, Sedat Dilek wrote:
>> This is based on ideas of me and Ben.
>> Thanks goes to Thorsten and Alexander for the vital help in 2012.
>>
>> Like in my initial patch [1] lsb_release is used to determine
>> the short codename as distribution name for debian/changelog.
>
> In contrast to the code snippet from Ben, you assume lsb_release
> to be installed, which is a wrong assumption.
>

So I should change that line?

+codename=$(lsb_release --codename --short)
-codename=$(lsb_release --codename --short 2>/dev/null)

- Sedat -

>> Ben gave some helpful and detailed information in [2].
>> There he also suggested to have an option to explicitly set the
>> distribution (see $KDEB_CHANGELOG_DIST variable).
>>
>> I have hardcoded the script-name when the default distribution
>> is used. This is a bit ugly.
>>
>> This patch is based on the snippet of Ben in [2] and tested
>> against Linux v3.19-rc2.
>>
>> [1] https://lkml.org/lkml/2012/4/23/516
>> [2] http://marc.info/?l=linux-kbuild&m=142022188322321&w=2
>>
