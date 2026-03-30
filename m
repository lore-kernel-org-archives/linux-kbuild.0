Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87A3D88EE;
	Mon, 30 Mar 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880061; cv=none; b=rkzjZb7t2T4QI5tNirGbuEu43+Na4agR2xYhyRU+UeET1WUiWMPHu42vItP/ZME5ZGH7iDLK+o5R27n77l8PiNP4DD8/FeHcwZacdYDDpO68RFuHveKW36vSlG2n2tf/f4FPMEi/h0z9M+08fQjJeRy0M0tfo/+nXcALoaljnbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880061; c=relaxed/simple;
	bh=szOvm1kJhlFL9NGjAF3fzdrI1JLKN19UT5nTC/V5ZAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmzfdgpSK9dHHtqwePV2e6SFzyd1LyQ0juEYTL8VEMLZOPXQr+zoMHntnyzPKoMqnJ9ZQT17v6wCdPYLyc+PRX8QqYJUNTOJvYHS/li1GVoncTTWVZAOZW98xka+RUwaHr4KPXmlDU1pJWDy06a1LAPPi7IFRFjPD+kIbfbXM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3nU7uRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3nU7uRv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03B8C19423;
	Mon, 30 Mar 2026 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880061;
	bh=szOvm1kJhlFL9NGjAF3fzdrI1JLKN19UT5nTC/V5ZAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3nU7uRvysYzuAqIEb+i1tn6WVn5nLHH4yhF1NNO+8oajOiLx5stV9eMS/LCqQ9AE
	 IjRcZ3ktdP52ysxRetswvbDDLcNzTAkxRVe0UloejdkOGtjfcrlAPp8AollvKvGuP4
	 NbeLoeI4z+nG7wQV8JMfOhsFQIsIKexJJx2aHbrquEwqZ3PhsH9sPvfrF6FmaLv/j6
	 M1spnlmmfanWSFoF2FO/Q1DCszLjR9WzA7yEITItEF8Z5q/NcQ3evZkoFYX+ez6/Q8
	 tafxWy+IqXoh+jhGnfGMIuGbnFfHYt3zEwojy+INEQmwLuawO1stpWW6WQnDyoQGel
	 YIHFOnLEvSCOg==
Date: Mon, 30 Mar 2026 16:14:17 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: forbid multiple entries with the same symbol in
 a choice
Message-ID: <20260330141417.GA1990358@ax162>
References: <20260330115736.1559962-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330115736.1559962-1-masahiroy@kernel.org>

On Mon, Mar 30, 2026 at 08:57:35PM +0900, Masahiro Yamada wrote:
> Commit 6a859f1a19d1 ("powerpc: unify two CONFIG_POWERPC64_CPU entries
> in the same choice block") removed the only occurrence of this tricky
> use case.
> 
> Disallow this pattern in choice_check_sanity() and revert commit
> 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yeah, definitely seems like a reasonable restriction.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/kconfig/parser.y | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index 6d1bbee38f5d..5fb6f07b6ad2 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -159,14 +159,8 @@ config_stmt: config_entry_start config_option_list
>  			yynerrs++;
>  		}
>  
> -		/*
> -		 * If the same symbol appears twice in a choice block, the list
> -		 * node would be added twice, leading to a broken linked list.
> -		 * list_empty() ensures that this symbol has not yet added.
> -		 */
> -		if (list_empty(&current_entry->sym->choice_link))
> -			list_add_tail(&current_entry->sym->choice_link,
> -				      &current_choice->choice_members);
> +		list_add_tail(&current_entry->sym->choice_link,
> +			      &current_choice->choice_members);
>  	}
>  
>  	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
> @@ -546,11 +540,10 @@ static int choice_check_sanity(const struct menu *menu)
>  			ret = -1;
>  		}
>  
> -		if (prop->menu != menu && prop->type == P_PROMPT &&
> -		    prop->menu->parent != menu->parent) {
> +		if (prop->menu != menu && prop->type == P_PROMPT) {
>  			fprintf(stderr, "%s:%d: error: %s",
>  				prop->filename, prop->lineno,
> -				"choice value has a prompt outside its choice group\n");
> +				"choice value must not have a prompt in another entry\n");
>  			ret = -1;
>  		}
>  	}
> -- 
> 2.43.0
> 
