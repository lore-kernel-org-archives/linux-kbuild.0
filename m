Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33C54399F8;
	Wed, 16 Sep 2026 19:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587381; cv=none; b=M4imxS86sG9nqmO6ohr4HFWOxI2r4xzef1tsNLy6pxfXbJ4mR2XvFVWV3L9Ip/OQAIcKSJC4358j/tCDrWAVXzF6IcmqCGE5rseBT8sictgTznTKtp6L65YmKZQ783CSV5UnjhQgld02/qpfWRzME+REpLxoZc2E8jF2R1JZQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587381; c=relaxed/simple;
	bh=Z+/v5ZvQxTAIhTm5UnkTj1pc64mja/Nm31YHHxX/MoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdpKcRd578ySICMIXGCUAqZ9T84/sWTAOBiTGEoZEwjOsHOqmxHYy9bc24RhCbxbmGJ6UCa3c6P3NQRBOnSQjfCy0uW0FTLPIf0DXmRwOWYFSDMaw861wBRM/AV6VeS38sM9izi0tj8KaKqLz8bS9FVqmqorb9dKumv3bFyIEEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OriqFoPi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OriqFoPi"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D54D51F000FF;
	Wed, 16 Sep 2026 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789587377;
	bh=sEcF2cWTN4Jv3NbQK8dlJ8vphUjD9iBgPDLykWsl6B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OriqFoPikw3LHat0jwRVwGEDdwcxBp3iWcpigdy2uvaFfYcMRgQM4sVLrWvg5/gbH
	 b4d8ldp8PI+hd+yefLZlE+nA5bF3pVOmJQgUyscKScxcxBTe2GIqA6HykXTHGb05Pc
	 euKV5A+i3pZk31axUJfOrDqP1YcFK+FOYnnONuKAVB2MwxZEx3MSbXdht1YCFHrEv9
	 meoLaGDriNO60qSInyNcBCQB5XcZKaTvH5qKwZ+nDgCRSP6pwO5uN4weuL+cEiMcq2
	 nR6gb3BgUyIK7fUf4Lz5tJEwSKstXqvMsGNSh/tEivwga9P9HH7lC1Q+/ZRbvJxXcg
	 qtVZPxY9LURBw==
Date: Wed, 16 Sep 2026 21:35:51 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>, Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
Message-ID: <aqrvl49cvt0ReUKa@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev
References: <20260907103739.23212-1-hexvalid@gmail.com>
 <20260915-pastel-industrious-rhino-8bddce@l-nschier-aarch64>
 <20260915220204.GA1534234@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915220204.GA1534234@ax162>

On Tue, Sep 15, 2026 at 03:02:04PM -0700, Nathan Chancellor wrote:
> On Tue, Sep 15, 2026 at 12:59:40PM +0200, Nicolas Schier wrote:
> > On Mon, Sep 07, 2026 at 01:37:37PM +0300, Erkan Erdem wrote:
> > > Kconfig separates a function name from its arguments with a comma, but
> > > the caveats section uses Make-style whitespace in its shell calls.
> > > These expressions expand as undefined variables rather than invoking
> > > the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> > > example fails to parse.
> > > 
> > > Add the missing commas to the shell calls in this section. Keep the
> > > Make examples unchanged.
> > > 
> > > Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> > > Assisted-by: LLM
> > > Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> > > ---
> > > 
> > > Changes in v2, addressing Julian Braha's review:
> > > - Remove whitespace after the comma in the three remaining shell calls.
> > > 
> > > v1: https://lore.kernel.org/all/20260905124045.42713-1-hexvalid@gmail.com/
> > > 
> > > The issue, patch and changelog were prepared with an AI coding assistant.
> > > The assistant also prepared the v2 revision and ran the checks below.
> > > 
> > > Validation:
> > > - Re-ran the documented working CC_HAS_ENDIAN_FLAG example using the
> > >   Kconfig conf tool built with Clang on macOS. With a test helper returning
> > >   y for either endian flag, the original example fails to parse; v2
> > >   executes both probes and sets CC_HAS_ENDIAN_FLAG=y for both endiannesses.
> > > - Rebuilt the changed page alone with Sphinx, treating warnings as errors.
> > > - The complete kernel documentation set and kernel were not built.
> > > 
> > >  Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > 
> > Thanks!  I'll queue it for kbuild-fixes, but it might be defered to v7.4 
> > if no other build relevant fix will pop-up.
> 
> I am not opposed to this going via -fixes but given that it is just
> documentation examples and there do not appear to be any problematic
> instances in tree, I feel like this could very reasonably go through
> -next. 316d55d55f49 is from 4.18, so the examples have been wrong for a
> long time. With that, I would probably not classify it as urgent.

Ack.  I remove the patch from kbuild-fixes-unstable again, thanks.


-- 
Nicolas
