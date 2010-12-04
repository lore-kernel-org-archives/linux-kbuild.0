Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:56111 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754998Ab0LDTTH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 14:19:07 -0500
Received: by iwn6 with SMTP id 6so1399261iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 11:19:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291487421.8025.69.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
	<AANLkTikjmWJ1+NFTHWGRBrZ2jKGs4r3O_tv+9yfCBEWC@mail.gmail.com>
	<1291487421.8025.69.camel@localhost>
Date: Sat, 4 Dec 2010 14:19:06 -0500
Message-ID: <AANLkTi=jw6PsDZCG7hO+6M=PptneOeT03Zwkw-=gN=Mc@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Sat, Dec 4, 2010 at 1:30 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> [...]
>> > +       sym = menu->sym;
>> > +       if (sym && (sym->flags & SYMBOL_NEW) &&
>> > +           sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
>> > +               if (verbose)
>> > +                       conf_write_symbol(sym, sym->type, stdout, true);
>> > +               else
>> > +                       printf("CONFIG_%s\n", sym->name);
>> Please don't hardcode the prefix string. This should be:
>>
>>                        printf("%s%s\n", CONFIG_, sym->name);
>
> OK, but I don't understand why it would change.
>
the Linux kernel is not the only user of kconfig.

 - Arnaud
