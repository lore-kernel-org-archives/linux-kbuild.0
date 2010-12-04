Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55855 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755692Ab0LDVni convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:43:38 -0500
Received: by iwn6 with SMTP id 6so1510778iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 13:43:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291482609.8025.57.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
Date: Sat, 4 Dec 2010 16:43:37 -0500
Message-ID: <AANLkTinez2Db1rFvLv-uf6koc+9JzHhkV8x8mFhrW5ER@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

[This message is a bit out-of-scope of this patch]

On Sat, Dec 4, 2010 at 12:10 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 184eb6a..b267933 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -108,6 +108,8 @@ struct symbol {
>  #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
>  #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
>
> +#define SYMBOL_NEW        0x100000 /* symbol is new (loaded config did not provide a value) */
> +
>  #define SYMBOL_MAXLENGTH       256
>  #define SYMBOL_HASHSIZE                9973
>
Just for the record, as long as I like this explicit flag, it does
only make sense for the S_DEF_USER case.

Kconfig seems to have been thought originally to support multiple
state of the tree (through the S_DEF_* flags). However, there has been
years after years more and more code written solely for the S_DEF_USER
case. Nowadays, making useful use of these S_DEF_* flags has became
pretty much impossible.

If the goal of this patch was just to provide a verbose
--listnewconfig, that should have been doable within check_conf().

Just a side note, using conf_write symbol() has the disadvantage to print:

# CONFIG_FOO is not set

instead of

CONFIG_FOO=n

or

CONFIG_FOO is not set

I've never been a big fan of having the format included in a generic
library. I guess the caller should specify a printer callback. That
would avoid also the `headerfile' fuss of conf_write_string.

I'd suggest the printer callback to be of the form:

struct conf_printer_callback {
    void (*print_set)(struct symbol *);
    void (*print_unset)(struct symbol *);
    void (*print_comment)(struct symbol *);
}

that way, conf_write() and conf_write_autoconf() would also share more code...

 - Arnaud, who had other plan for the day :/
