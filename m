Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E433C09F3;
	Sat, 17 Oct 2026 21:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792273294; cv=none; b=j/6wo+QxRxrtt0eKWy3PIASle0tLY6/V04IrIwO5L4BTpY5VHI60ikQEvwoOt1d9Nr4Ai68akUAo69nyRR6OKTwOrVPWIoEDWSh5IkdpU958AmWXEKOJyE5I0lORvoF9a6Pnm/ib/HP/3hWJcfDaDbMdLcS+bAiGc45ZL6GPbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792273294; c=relaxed/simple;
	bh=yrFSkbmPM7KZ/xxHynh2ZC9G2eYqjOtBq3kwOJx4aG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gzz/HD8wlGl9QFUrP2CdbApTsLu1gfFgWST2SrIuZZdMVEDi6DWAOOyygDLRSABQoisHKmr77PzMncpYZC6kjFdbZZ213UjN8y53UEzxWFV/toDNj+5Y+tetXbZIAe6jxnFAWD4+UZSO2zpo5NcXfL/pUbfVPoxo1EgFx3sBp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMg0czHU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMg0czHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BCB1F000C4;
	Sat, 17 Oct 2026 21:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792273292;
	bh=OR6Niz5MdiTpwquqWCuq8lOuPJ4np8jeybekBLPpFBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMg0czHUw/tZLrUsVEjuvV4z8PrCnDr6JKMIzfdNnNJlMUlK6YRkJe9Tw/V1GYX9+
	 cdlX9iF/2mP7GsZkHq1t14Q5G8nChq5BXrogtk1HVWdpFn9chcS2eh33/LJyYF+Tyz
	 CWr3barbTgLWRXP6GW4mxd+X7dy+3rybs39w3vo3WaswfB4geyzq2rFp5yZTB3BkWW
	 IlJKgfIXeI+tm0MvWVG2aMr1Pw4DNEtop0dZtQ9B0m5UPO0oxlealZiKYY/ycohtK3
	 iy8hyg2Hfvhl9J9CADva+MI133m+AYBPcUer6SptcmxFeXmxO/eZpaot3tL0v0ULdr
	 uNnVolbeHbftQ==
Date: Sat, 17 Oct 2026 14:41:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Dmitry Kandybka <d.kandybka@gmail.com>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with
 debug info
Message-ID: <20261017214129.GA404142@ax162>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
 <20261015210149.78470-1-d.kandybka@gmail.com>
 <sashiko-outbox-174936@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174936@kernel.org>

On Fri, Oct 16, 2026 at 09:02:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] kbuild: unanchored sed substitutions in sed-offsets can break build
> --
> 
> commit 48672ceb9d59753178f125f7c16956dd57252dcd
> Author: Dmitry Kandybka <d.kandybka@gmail.com>
> 
> kbuild: Makefile.lib: fix offsets generation with debug info
> 
> This commit fixes offset generation when debug information is enabled by
> making the sed pattern matching stricter and adding a BLANK() macro for
> readability. It prevents debug metadata from leaking into generated header
> files and breaking the build.
> 
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 19e96b30a122f..173bc3aa4247f 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -493,9 +493,9 @@ quiet_cmd_zstd22_with_size = ZSTD22  $@
> >  # the .ascii directive whereas GCC keeps the <space> as-is.
> >  define sed-offsets
> >  	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; \
> > -	/^->/{s:->#\(.*\):/* \1 */:; \
> > -	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
> > -	s:->::; p;}'
> > +	/^->/{s:->#\(.*\):/* \1 */:p; \
> > +	s:^->\([[:alnum:]_]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:p; \
> > +	s:->BLANK()::p;}'
> 
> [Severity: Low]
> Could this unanchored sed substitution break the build under certain
> conditions?
> 
> If the kernel is built with debug info (e.g., -ggdb3), the compiler may emit
> .ascii directives containing debug strings from source code. If a string
> literal from an included header starts with -> and contains -># or ->BLANK()
> mid-string (for example, ->foo ->BLANK()), the unanchored sed substitution
> will match mid-string.
> 
> Because of the :p flag, wouldn't it print the partially modified pattern space
> (e.g., ->foo ), resulting in invalid C code being written to
> include/generated/asm-offsets.h?
> 
> Should the pattern be anchored (e.g., s:^->BLANK()$::p;) to ensure it only
> matches the intended kbuild macros?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015210149.78470-1-d.kandybka@gmail.com?part=1

This definitely feels a little contrived but anchoring at the beginning
would avoid this and seems to match the rest of the macro.

  s:^->BLANK()::p;}'

-- 
Cheers,
Nathan
