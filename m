Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f65.google.com ([209.85.166.65]:39827 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728372AbfEQJZs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:25:48 -0400
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com> <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
In-Reply-To: <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Fri, 17 May 2019 12:25:10 +0300
Message-ID: <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, May 17, 2019 at 11:58 AM Bernd Petrovitsch
<bernd@petrovitsch.priv.at> wrote:
>
> On 17/05/2019 10:16, Alexander Kapshuk wrote:
> [...]
> > The 'xargs' '-r' flag is a GNU extension.
> > If POSIX compliance is important here, the use of 'cat', 'xargs' and
> > 'basename' may be substituted with that of 'sed' to initialise
> > same_name_modules:
> > sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d
>
> 's!' is TTBOMK also a GNU-extension:
> sed 's/.*\///' modules.order modules.builtin | sort | uniq -d

It isn't.
Here's an excerpt from the POSIX manpage for 'sed',
http://pubs.opengroup.org/onlinepubs/009695399/utilities/sed.html:
[2addr]s/BRE/replacement/flags
...  Any character other than backslash or <newline> can be used
instead of a slash to delimit the BRE and the replacement....

>
> > 'Sed' may also be used on its own in the 'for' loop instead of as part
> > of a pipeline along with 'grep' to generate the desired output:
> > sed '/\/'$m'/!d;s:^kernel/:  :' modules.order modules.builtin
>
> sed "/\/${m}/!d;s/^kernel\//  /" modules.order modules.builtin

The parameter expansion syntax is redundant here.
See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02:
The parameter name or symbol can be enclosed in braces, which are
optional except for positional parameters with more than one digit or
when parameter is a name and is followed by a character that could be
interpreted as part of the name.

Here's an alternative version using double quotes.
sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin

>
> MfG,
>         Bernd
> --
> Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
>                      LUGA : http://www.luga.at
