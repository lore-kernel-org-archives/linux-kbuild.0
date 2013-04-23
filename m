Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36687 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754933Ab3DWIpA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Apr 2013 04:45:00 -0400
Message-ID: <51764A0A.9000506@suse.cz>
Date: Tue, 23 Apr 2013 10:44:58 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] kconfig: implement KCONFIG_PROBABILITY for randconfig
References: <cover.1366665921.git.yann.morin.1998@free.fr> <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
In-Reply-To: <e5fafd7ae13357e3d5cc604c89022982022a8909.1366665922.git.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Peter Korsgaard <jacmet@uclibc.org>

On 22.4.2013 23:31, Yann E. MORIN wrote:
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 13ddf11..8d8d853 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1106,7 +1106,16 @@ static void set_all_choice_values(struct symbol *csym)
>  void conf_set_all_new_symbols(enum conf_def_mode mode)
>  {
>  	struct symbol *sym, *csym;
> -	int i, cnt;
> +	int i, cnt, prob = 50;
> +
[...]
>  			case def_random:
> -				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
> -				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
> +				cnt = (rand() % 100) - (100 - prob);
> +				if (cnt < 0)
> +					sym->def[S_DEF_USER].tri = no;
> +				else
> +					if ((sym_get_type(sym) == S_TRISTATE)
> +					    && (cnt > prob/2))
> +						sym->def[S_DEF_USER].tri = mod;
> +					else
> +						sym->def[S_DEF_USER].tri = yes;

Previously, the distribution was 50%-50% for boolean options and
33%-33%-33% for tristate options. Now the default for tristate options
changed to 50%-25%-25% (no-mod-yes). Wouldn't it make more sense to have
a special case for KCONFIG_PROBABILITY not set, that would use the same
distribution as before. I.e.

if (prob == -1) {
	cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
	sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
} else {
	/* new math */
}

Not building half of all drivers is rather boring :)

Thanks,
Michal
