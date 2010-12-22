Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:33572 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122Ab0LVFj7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Dec 2010 00:39:59 -0500
Received: by iyi12 with SMTP id 12so3758802iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2010 21:39:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1292993068.2874.31.camel@localhost>
References: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
	<1291530919-5601-2-git-send-email-lacombar@gmail.com>
	<4D10DA09.6070009@suse.cz>
	<1292993068.2874.31.camel@localhost>
Date: Wed, 22 Dec 2010 00:39:58 -0500
Message-ID: <AANLkTi=p9FTocTTg903Ca=PA3q3iM5bnMnxHFEWRuq=i@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] kconfig/listnewconfig: show default value of
 new symbel
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Tue, Dec 21, 2010 at 11:44 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Tue, 2010-12-21 at 17:47 +0100, Michal Marek wrote:
>> On 5.12.2010 07:35, Arnaud Lacombe wrote:
>> > note: I would not mind adding the KCONFIG_VERBOSE logic.
>> >
>> > Original idea and implementation by Bastian Blank <waldi@debian.org>,
>> > Maximilian Attems <max@stro.at> and Ben Hutchings <ben@decadent.org.uk>
>> >
>> > CC: Ben Hutchings <ben@decadent.org.uk>
>> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>> > ---
>> >  scripts/kconfig/conf.c     |   14 +++++++++++++-
>> >  scripts/kconfig/confdata.c |    4 ++--
>> >  2 files changed, 15 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
>> > index 5459a38..1b58129 100644
>> > --- a/scripts/kconfig/conf.c
>> > +++ b/scripts/kconfig/conf.c
>> > @@ -411,6 +411,17 @@ conf_childs:
>> >             indent -= 2;
>> >  }
>> >
>> > +
>> > +static void
>> > +listnewconfig_print_symbol(FILE *fp, struct symbol *sym, const char *val, void *arg)
>> > +{
>> > +   fprintf(fp, "%s%s (default: %s)\n", CONFIG_, sym->name, val);
>> > +}
>>
>> Ben, do you have an opinion on this format versus the standard .config
>> produced by your patch?
> [...]
>
> The .config format is more useful as it is then possible to copy lines
> directly into a .config file.  If you're going to apply Arnaud's
> preceding patch (1/2) then please let me rewrite mine to apply on top of
> that, rather than applying this second patch.
>
I'm fine if you do so, I do not really care about any specific
formatting. However, I'd like to avoid the SYMBOL_NEW part, which is
broken and not needed.

I did not had the time to address Michal's comment on [1/2] this
evening because of some rush @WORK, hope to do that tomorrow :/.

 - Arnaud
