Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:53837 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754334Ab1HQXsU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Aug 2011 19:48:20 -0400
Received: by pzk37 with SMTP id 37so1940912pzk.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2011 16:48:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313525801.15704.29.camel@gandalf.stny.rr.com>
References: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
	<1313508664.15704.28.camel@gandalf.stny.rr.com>
	<CACqU3MXuF8J7088XpfMu4gBeBgSKqrKLz-1pVKA295UidKfDNQ@mail.gmail.com>
	<1313525801.15704.29.camel@gandalf.stny.rr.com>
Date: Wed, 17 Aug 2011 19:48:19 -0400
Message-ID: <CACqU3MWTpwgjm0M0nRdkK0tAVQKrrtKv2Vh2GG71kKEVaWSWVQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kconfig/streamline_config.pl: directly access LSMOD
 from the environment
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

Hi Michal,

On Tue, Aug 16, 2011 at 4:16 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> On Tue, 2011-08-16 at 11:44 -0400, Arnaud Lacombe wrote:
>> Hi,
>>
>> On Tue, Aug 16, 2011 at 11:31 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
>> > On Tue, 2011-08-16 at 01:23 -0400, Arnaud Lacombe wrote:
>> >> Cc: Steven Rostedt <rostedt@goodmis.org>
>> >> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>> >> ---
>> >>  scripts/kconfig/Makefile             |   12 ++----------
>> >>  scripts/kconfig/streamline_config.pl |    8 ++++++--
>> >>  2 files changed, 8 insertions(+), 12 deletions(-)
>> >
>> > Hi Arnaud,
>> >
>> > I like these versions better. Yeah, using the LSMOD environment is the
>> > better way to go.
>> >
>> > I'll do some tests on them and then push them up.
>> >
>> If you ACK them, I think this would be better if they go through the
>> kconfig tree. I have other patches pending touching
>> `scripts/kconfig/Makefile' which might create conflicts.
>
> Fine with me. You can add my:
>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>
> on all three patches.
>
If you want, you can directly pull the patches from the git repository at:

 git@github.com:lacombar/linux-2.6.git master/kconfig-localmodconfig

Thanks
 - Arnaud
