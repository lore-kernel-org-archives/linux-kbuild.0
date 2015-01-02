Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:33031 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbbABPSw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 10:18:52 -0500
Received: by mail-we0-f170.google.com with SMTP id w61so4629622wes.29
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jan 2015 07:18:50 -0800 (PST)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20150102151227.GA2658@sepie.suse.cz>
References: <1420210672-12712-1-git-send-email-sedat.dilek@gmail.com>
	<20150102151227.GA2658@sepie.suse.cz>
Date: Fri, 2 Jan 2015 16:18:50 +0100
Message-ID: <CA+icZUUpxLS6B2RNGdkvEzmmPRi8TtJ6ySO3N0uLQgkuEPahEQ@mail.gmail.com>
Subject: Re: [3.19-rc2] builddeb: Update year and git repository URL in debian/copyright
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org

On Fri, Jan 2, 2015 at 4:12 PM, Michal Marek <mmarek@suse.cz> wrote:
> On Fri, Jan 02, 2015 at 03:57:52PM +0100, Sedat Dilek wrote:
>> Happy new 2015!
>>
>> I have combined two patches which I had already sent to linux-kbuild ML.
>
> Applied to kbuild.git#misc, thanks.
>

/o\

Just FYI...
I will send out the 3rd in the original triple as "[RFC RESEND]
builddeb: Try to determine distribution" against kbuild-next.
From the discussion:
max had some concerns and if I remember correctly I got no alternativ
proposal from him.
Today, I asked friends on #grml on how to do it better.
I will try to find out if I can ensure lsb_release binary is available
in all supported Debian/Ubuntu release.
Not sure if this really necessary.

- Sedat -
