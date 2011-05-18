Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:38690 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754159Ab1ERG1V convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 May 2011 02:27:21 -0400
MIME-Version: 1.0
In-Reply-To: <20110518061919.GA18763@merkur.ravnborg.org>
References: <1305646532-29114-1-git-send-email-mmarek@suse.cz>
	<20110517195310.GA17003@merkur.ravnborg.org>
	<20110518051645.GB15292@game.jcrosoft.org>
	<20110518061919.GA18763@merkur.ravnborg.org>
Date: Wed, 18 May 2011 02:27:21 -0400
Message-ID: <BANLkTikJhjZeALwwRyaozQZp0=k8xcocog@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Only generate config_is_xxx for bool and
 tristate options
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Wed, May 18, 2011 at 2:19 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, May 18, 2011 at 07:16:45AM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> On 21:53 Tue 17 May     , Sam Ravnborg wrote:
>> > On Tue, May 17, 2011 at 05:35:32PM +0200, Michal Marek wrote:
>> > > For strings and integers, the config_is_xxx macros are useless and
>> > > sometimes misleading:
>> > >
>> > >   #define CONFIG_INITRAMFS_SOURCE ""
>> > >   #define config_is_initramfs_source() 1
>> >
>> > I'm late with this comment....
>> > Could we introduce "config_is_foo" using a syntax that
>> > does not break grepability?
>> >
>> > Maybe a syntax like this?
>> >
>> >     #ifdef CONFIG_FOO
>> >
>> > and
>> >
>> >     if (KCONFIG_FOO())
>> >
>> > Grepping for the use of a symbol is a very typical thing,
>> > so we should try to keep this.
>> > And with the suggested syntax above I expect fixdep to
>> > catch up both usage types.
>> I'll prefer kconfig_foo()
>> not uppercase
>>
>> but if we use KCONFIG_FOO no need to touch fixdep
>
> fixdep is easy to fix - albeit it may cost a bit of processing time.
> wht I worry much more about is users that miss uses of CONFIG_ symbols, because
> they do not show up in "git grep CONFIG_FOO".
>
agree.

> Using "if (KCONFIG_FOO()) users are also awre this is a configuration
> decided condition - which is nice to stand out.
>
this will not work if you do $(git -w CONFIG_FOO) to avoid getting all
kind of noise in your search.

 - Arnaud
