Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526B50C2A2;
	Thu, 15 Oct 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059327; cv=none; b=TjwkEf84nL7OXwsOeli+FcRgwQyZPqW4hMNavClgsssUHlquPNzf03TFKIqsfoXtK5YxMD/bUcQ2qYjEFVcHjAoMbtAvB2RKlgdGXH3dzVa4OLtZa+KcpZ1/BYzrDSOuXFvLz8HIPtIoVpI9n/aq6lLQuVf2ScVkfm1t34+siSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059327; c=relaxed/simple;
	bh=YJ+lMSfz+Na0v+XqxGwiHemFdnImyasHxeYKkQlTLZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPJ+N6dIXhtmyDHlMxGz6++glSjZQnRrOScStHx7BDiXUAtfd45U6LOpMTg8MYnT1LCU0vJ0pD+l0SHEYpHU+cn7q4D6EGOxJjk+wSJeAHDNNJgGU0AZAkTn4gSq38/n2OIF5Zf3fATNKyjHwl7MOw9c2RWaIALr5hMrX+/zwG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dok2U3K5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9x6S7aXQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dok2U3K5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9x6S7aXQ"
Date: Thu, 15 Oct 2026 12:15:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld+pBBthNQg39ooDg5wk85U8UONFogCbliZyyBq75hs=;
	b=dok2U3K5w+hWDg9bCs8vM8E8Qj+vuweGWmPUaPNamy2QNev05Nlfe2aSMnm9fxIaLFE7Jr
	DCnVdRjUhDHJedHKbiYenxSVZI1lzF/nCwSQiK6+kjB/sgLGG1uy2FT0lh5vmCgDPLWWGF
	mKlWC8Dbb+JhKggeoNcMNlWKWd2J6/5EyGUTzhWDmlwnsFCMabjzx3jIMSF4e4Pmfra54x
	sGabrMry4Y4LugT3OQenWUEqFMibhNQao007Dk1OTkX7V0UUlZsMl31eAA8qZFGT/ORcAI
	ro6IvN6BnyWG4zlXqz24uti4LvGwKuuKBEHdIxUkCUeBKL7GIfRwhEZ2tc+9eg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld+pBBthNQg39ooDg5wk85U8UONFogCbliZyyBq75hs=;
	b=9x6S7aXQw+EVXyHCopKeNwwT+tp2tIstwz5b4asurITSogFULd7el34qJmQbvVFuZIzKnr
	k/ZPxFSwiaG3h9AQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] kbuild: enable pipefail for commands where possible
Message-ID: <20261015121210-dbee14b9-538f-4069-8934-153456b3ccd3@linutronix.de>
References: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
 <20261014214043.GA3380464@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014214043.GA3380464@ax162>

On Wed, Oct 14, 2026 at 02:40:43PM -0700, Nathan Chancellor wrote:
> On Wed, Oct 14, 2026 at 10:30:30AM +0200, Thomas Weiﬂschuh wrote:
> > The exit status of a shell pipeline by default only depends on the exit
> > status of its last command. If an earlier command fails this is silently
> > ignored. In this case the build continues operating on intermediate
> > state, potentially leading to confusing follow-up failures.
> > 
> > The 'pipefail' option can be used to exit the pipeline with an error as
> > soon as a single of its command fails which 'set -e' will elevate to
> > error exit of the whole command.
> > 
> > 'pipefail' has been only standardized in POSIX 2024, but it is supported
> > by many shells anyways, including bash and dash. To avoid issues with
> > shells not implementing it, ignore failures silently.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel.com/
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> This is probably the right thing to do but it makes me nervous. pipefail
> is very easy to hold wrong mainly because of SIGPIPE:
> 
>   $ cat test.sh
>   set -o pipefail
> 
>   yes | head -n +50
> 
>   $ bash test.sh
>   ...
> 
>   $ echo $?
>   141
> 
> and debugging that is unlikely to be obvious (but maybe it will because
> the error would be 141).

It actually breaks modversions quite badly. And it is not obvious to debug
as that uses the pipe in an `if` statement which swallows the 141 silently.

Not sure what to do here.

Maybe we just provide `try-pipefail` so users can opt-in where it makes sense.


Also

try-pipefail = set -o pipefail || true 2>/dev/null

should have been

try-pipefail = set -o pipefail 2>/dev/null || true

> > ---
> >  scripts/Kbuild.include | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > index 8c311b997e24..1975d2739cdb 100644
> > --- a/scripts/Kbuild.include
> > +++ b/scripts/Kbuild.include
> > @@ -149,8 +149,11 @@ delete-on-interrupt = \
> >  		$(foreach sig, HUP INT QUIT TERM PIPE, \
> >  			trap 'rm -f $@; trap - $(sig); kill -s $(sig) $$$$' $(sig);))
> >  
> > +# try to enable pipefail
> > +try-pipefail = set -o pipefail || true 2>/dev/null
> > +
> >  # print and execute commands
> > -cmd = @$(if $(cmd_$(1)),set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
> > +cmd = @$(if $(cmd_$(1)),$(try-pipefail); set -e; $($(quiet)log_print) $(delete-on-interrupt) $(cmd_$(1)),:)
> >  
> >  ###
> >  # if_changed      - execute command if any prerequisite is newer than
