Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd26914.kasserver.com ([85.13.145.202]:53762 "EHLO
	dd26914.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478Ab1JTJZn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Oct 2011 05:25:43 -0400
Message-ID: <4E9FE911.9050909@Kriegisch.name>
Date: Thu, 20 Oct 2011 11:25:37 +0200
From: Alexander Kriegisch <Alexander@Kriegisch.name>
MIME-Version: 1.0
Subject: Re: randconfig broken on choice
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux kbuild list <linux-kbuild@vger.kernel.org>
Cc: Freetz Developers <developers-freetz-org@freetz.org>

Matthieu, Arnaud,

I wrote a shell script [1] which creates thousands or random configs in 
order to find and eliminate warnings in our configuration (missing 
dependencies etc.). We use this as a way of fuzzing, i.e. to perform 
heuristic tests because it is impossible to cover all combinations.

We use kconfig 3.1-rc9 in our project. First we had the problem Matthieu 
described for rc4, because the randconfigs only covered a small subset 
of possibilities due to its buggy handling of "choice" entries.

The good news is that Mattheiu's patch [2] effectively eliminated the 
problems, and we could successfully remove all inconsistencies in our 
configuration.

So I would like to push this patch. We would be happy to see it 
integrated upstream. Thanks! :-)

[1] http://freetz.org/browser/trunk/tools/developer/create-kconfig-warnings
[2] 
http://freetz.org/browser/trunk/tools/make/patches/340-fix_randconfig_choice.kconfig.patch
-- 
Alexander Kriegisch
http://freetz.org


> I am using v3.1-rc4 and make randconfig look broken for choice.
> The choice config is always the same or choice entry can have more than one entry.
>
> After some debugging, it seems in randomize_choice_values, we don't clean
> SYMBOL_VALID for choice entry.
> And we don't take "sym->def[S_DEF_USER].tri" but the "default sym->cur.tri".
>
> The following patch seems to fix the problem.
>
> Matthieu
>
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 59b667c..08331f8 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1045,6 +1045,10 @@ static void randomize_choice_values(struct symbol *csym)
>  		else {
>  			sym->def[S_DEF_USER].tri = no;
>  		}
> +		sym->flags |= SYMBOL_DEF_USER;
> +		/* clear VALID to get value calculated */
> +		sym->flags &= ~(SYMBOL_VALID);
> +
>  	}
>  	csym->flags |= SYMBOL_DEF_USER;
>  	/* clear VALID to get value calculated */
