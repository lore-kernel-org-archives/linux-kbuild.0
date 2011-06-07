Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.212.179]:58284 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757041Ab1FGPwt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2011 11:52:49 -0400
Received: by pxi2 with SMTP id 2so3783411pxi.10
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jun 2011 08:52:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110607152950.GA4612@sepie.suse.cz>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
	<1307121412-6314-1-git-send-email-lacombar@gmail.com>
	<20110607152950.GA4612@sepie.suse.cz>
Date: Tue, 7 Jun 2011 11:52:48 -0400
Message-ID: <BANLkTikrH3PECOggKUN-u2hPY8zT3bUsOg@mail.gmail.com>
Subject: Re: [RFCv3] Kbuild: factor parser rules
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Tue, Jun 7, 2011 at 11:29 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Fri, Jun 03, 2011 at 01:16:52PM -0400, Arnaud Lacombe wrote:
>> Hi Michal,
>>
>> Here is some update concerning the parser generation merge. I do not repost the
>> whole serie as it may be overkill. You can find the latest branch at:
>>
>> git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule
>>
>> You'll find an updated diff between v2 [rebased on top of v3.0-rc1] and v3
>> below.
>>
>> Changes since v2:
>>  - allow a parser to specify the prefix to be used. This will allow for multiple
>>    parser to use the implicit rules, which was not previously possible, as it
>>    was using the `yy' default.
>>  - drop the zconf prefix changes
>>  - add a `baseprereq' global to kbuild, which mimics `basetarget'
>>  - rebase on top of v3.0-rc1
>
> Nice. But it still breaks the _shipped rule for files other than those
> handled explicitely. I guess the problem you are trying to solve is the
> double-colon in rule? That was added back in 2002 by
> http://git.kernel.org/?p=linux/kernel/git/tglx/history.git;a=commitdiff;h=2e8556ce
> and it looks to me like a hack to make the _shipped rule fire early
> enough.  Maybe it's not needed nowadays at all, because 53c700.o is a
> normal object file and not the final module. Nevertheless, if I change
> it to a normal rule and delete the ones added by you, it all works fine
> except for genksyms:
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index f76d9ba..520f958 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -192,20 +192,10 @@ endif
>  quiet_cmd_shipped = SHIPPED $@
>  cmd_shipped = cat $< > $@
>
> -$(obj)/%.tab.c: $(src)/%.tab.c_shipped
> -       $(call cmd,shipped)
> -
> -$(obj)/%.tab.h: $(src)/%.tab.h_shipped
> -       $(call cmd,shipped)
>
> -$(obj)/%.lex.c: $(src)/%.lex.c_shipped
> +$(obj)/%: $(src)/%_shipped
>        $(call cmd,shipped)
>
> -$(obj)/%.hash.c: $(src)/%.hash.c_shipped
> -       $(call cmd,shipped)
> -
> -$(obj)/%:: $(src)/%_shipped
> -
Do'h! This is why the _shipped stuff is broken, it was missing a
"$(call cmd,shipped)" here. I'll address that issue today. Eventually
without duplicating targets.

 - Arnaud

>  # Commands useful for building a boot image
>  # ===========================================================================
>  #
>
> I'll look into the problem with genksyms later today.
>
> Michal
>
