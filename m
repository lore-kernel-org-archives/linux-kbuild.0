Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DA2D249B;
	Mon,  5 Oct 2026 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214257; cv=none; b=Hqv70KqVbdK2ib4gkyuFZQm9rqVR/TOZVnTecj4uhpm2s/qAVxuxPS1NOaiJnwqtcCgW6BTI5bhhzOm0VtuJQnbqpVzZIvyz1WrUP8pOZGObzO+INptKb7Ene1JDIbzK1+fdlKVZJgUjfsTLelN96tmcEjmzLYImdOxwz3BW8Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214257; c=relaxed/simple;
	bh=X6nLDttfxdsAcVhT7coDh+6wfCWnYIcEbY55a9HRL4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxBo+mJdvdq7A8oCTqzCu1N8+ofxlExgh/2irFlmmR3FdhCO+YcW0N538RbGPeoSp39yEVwpnRqDbgzk11bic08JRM3nwWTT3ejbdHZzuyYfGsFySOkxfuTVc+W3b6PU89TyfO/t5Kc219bBtjbc0AXCSM9ifCACeGlaosgmbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ifu7KvfQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ifu7KvfQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EB41F000FF;
	Mon,  5 Oct 2026 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214256;
	bh=x7kHCI/Oi3qjwgCINk1s5Ev19iGxrv4eQUNBFls+4pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ifu7KvfQfk0qp6OpvyHAk/Gy1XuJipIAcYsAubvFyujcCmW3hQ/B8FpUEEL3WYnRx
	 R6wQXk5aOwHGiU8qtjVNyqBaM9l65npTRUgw0Zf4HmPvxNh2BsfBC0gdOMyEANmw/2
	 0gxATULKprVSeaJLlOMHKlX2nv8nZvFxRZrpHQhqlhprBzFHOXXUuiroCpZKXF1kx8
	 7NSjNh256R6pElGDe3aERe7bmIYwWR4ci/VBFpH7oIh9kV5Yc7fTR+IvaZOle1Tg0X
	 HeqIEQbico/3z2W9VAUN/POuRKf5MB2D3iO5NvA94wuZh33N0uG23oxGmzliZhyfEX
	 /PMFCTxLvsMxg==
Date: Mon, 5 Oct 2026 17:30:52 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: nsc@kernel.org, julianbraha@gmail.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] localmodconfig: Explicitly report boolean configs during
 integrity check
Message-ID: <20261005153052.GA2537651@ax162>
References: <20260925181230.130525-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925181230.130525-1-atomlin@atomlin.com>

Hi Aaron,

+ Steven

On Fri, Sep 25, 2026 at 02:12:30PM -0400, Aaron Tomlin wrote:
> When running make localmodconfig, streamline_config.pl reads loaded
> modules and maps each module object to its corresponding Kconfig
> symbol(s) using repository Makefiles.
> 
> In several instances, a loaded module corresponds to an object
> controlled by a boolean symbol (e.g. config FOO declared as bool), or is
> a composite module that depends on a boolean configuration. Because
> boolean options only accept "=y" or disabled, they cannot be configured
> as loadable modules ("=m").
> 
> Previously, if such a symbol was not already built-in ("=y") in the
> baseline configuration, the final integrity check emitted an ambiguous
> diagnostic. For example
> 
>     foo did not have configs CONFIG_FOO
> 
> Further investigation is required by developers to determine whether the
> module was out-of-tree, its dependencies were unmet, or it failed due to
> a type constraint. Address this by:
>     1.  Tracking symbol types in a %types hash during Kconfig parsing.
> 
>     2.  Enhancing the final integrity check when running localmodconfig
>         (!$localyesconfig) to explicitly annotate boolean symbols.
> 
> For example:
> 
>     module cec did not have configs CONFIG_CEC_CORE (tristate) CONFIG_RAS_CEC (boolean, not supported with =m)
> 
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>

My Perl is quite weak, so I would love Steven's ack or review before
taking this since he is the original author/maintainer. I've left the
full patch for context.

> ---
>  scripts/kconfig/streamline_config.pl | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 8677d1ca06a7..6a52a98eb40e 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -145,6 +145,7 @@ my %prompts;
>  my %objects;
>  my %config2kfile;
>  my %defaults;
> +my %types;
>  my $var;
>  my $iflevel = 0;
>  my @ifdeps;
> @@ -224,6 +225,7 @@ sub read_kconfig {
>  	} elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
>  	    my $dep = $3;
>              $defaults{$config} = 1;
> +	    $types{$config} = $2 if (defined($2));
>  	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
>  		$dep =~ s/.*\sif\s+//;
>  		$depends{$config} .= " " . $dep;
> @@ -240,7 +242,13 @@ sub read_kconfig {
>  	    }
>  
>  	# configs without prompts must be selected
> -	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
> +	} elsif ($state ne "NONE" && /^\s*(bool|boolean)(\s+\S.*)?$/) {
> +	    $types{$config} = "bool";
> +	    $prompts{$config} = 1 if (defined($2));
> +	} elsif ($state ne "NONE" && /^\s*tristate(\s+\S.*)?$/) {
> +	    $types{$config} = "tristate";
> +	    $prompts{$config} = 1 if (defined($1));
> +	} elsif ($state ne "NONE" && /^\s*prompt\b/) {
>  	    # note if the config has a prompt
>  	    $prompts{$config} = 1;
>  
> @@ -707,7 +715,15 @@ foreach my $module (keys(%modules)) {
>  	}
>  	print STDERR "module $module did not have configs";
>  	foreach my $conf (@arr) {
> -	    print STDERR " " , $conf;
> +	    my $c = $conf;
> +	    $c =~ s/^CONFIG_//;
> +	    if (!$localyesconfig && defined($types{$c}) && $types{$c} eq "bool") {
> +		print STDERR " $conf (boolean, not supported with =m)";
> +	    } elsif (defined($types{$c})) {
> +		print STDERR " $conf ($types{$c})";
> +	    } else {
> +		print STDERR " " , $conf;
> +	    }
>  	}
>  	print STDERR "\n";
>      }
> -- 
> 2.55.0
> 
> 

-- 
Cheers,
Nathan
