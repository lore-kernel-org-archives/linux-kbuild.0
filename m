Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:48384 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728Ab0HRC2q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 22:28:46 -0400
Received: by wwi17 with SMTP id 17so92946wwi.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2010 19:28:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100817202630.GB11592@merkur.ravnborg.org>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com>
	<1282023725-20428-1-git-send-email-lacombar@gmail.com>
	<4C6A7167.3060608@suse.cz>
	<20100817202630.GB11592@merkur.ravnborg.org>
Date: Tue, 17 Aug 2010 22:28:45 -0400
Message-ID: <AANLkTikKUO=t7tw14b+0bMBVzEq3QVXwmKdfifNavQ5w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi,

On Tue, Aug 17, 2010 at 4:26 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Aug 17, 2010 at 01:24:23PM +0200, Michal Marek wrote:
>> On 17.8.2010 07:42, Arnaud Lacombe wrote:
>> > +   if (isspace(*prompt)) {
>> > +           fprintf(stderr, "%s:%d:warning: leading whitespace ignored\n",
>> > +               current_file->name, zconf_lineno());
>> > +           while (isspace(*prompt))
>> > +                   prompt++;
>> > +   }
>>
>> The lexer already eats whitespace I think, so this might not be necessary.
>
> menu_add_prop() does something similar so I think not.
> But I did not check.
>
The leading whitespace removal have been added explicitly by Roman Zippel:

commit f001f7f89689d3226678ab3986f3a486f54aa069
Author: Roman Zippel <zippel@linux-m68k.org>
Date:   Thu Jun 8 22:12:48 2006 -0700
    kconfig: warn about leading whitespace for menu prompts

    Kconfig does its own indentation of menu prompts, so warn about and ignore
    leading whitespace.  Remove also a few unnecessary newlines after other
    warning prints.

    Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
    Signed-off-by: Andrew Morton <akpm@osdl.org>
    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Not sure if that would still apply for the mainmenu.

 - Arnaud
