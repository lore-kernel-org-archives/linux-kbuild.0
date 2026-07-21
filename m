Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A918E3B47E2;
	Tue, 21 Jul 2026 20:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667301; cv=none; b=GBqae27S5DeEc2/3+hYVBVA46gPszxB0caQQjDLsHXpRBrVjb9lOHqRiJraJ4Jw+Y49jpadGINOUB2hvhCtY08rB6ZN2XtQziHVvbD2swZngPY3QNA74P2NGu78wvhl1C2kFDDpx0XwBe16l59udUhh2u5X5BusGUD4kKEmYKJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667301; c=relaxed/simple;
	bh=A2yz0pqFyrVYbUMB+6DJRF86yzqPFoXcWBSaaTXEqWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIFMbBBuC3i8diH2DLw6/U9FW+Vcqtr8QcTRdk9sneiApb6kfr1zgPLzdZKCz92XEjDTk8Qf87K98UbHqCyaBxewWclLL9idp2IVYtcqYhaejPYYuiSr0kFPaO1Q5TzYgvo2neIBzk/++19FJsJuqtLFEM8xVyXJrfasROTEd9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrbeRGj1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrbeRGj1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B84B1F00A3A;
	Tue, 21 Jul 2026 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784667299;
	bh=IO5nFBhI8AE6JXs3WUotMWvvUHjJC0X533cjOqryd1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FrbeRGj14kpRCqs2Op9l/9CP0262oeHMNDTLEdMnjPhhB8dEJZI3JH5g0d0E4uXNz
	 KSdB7T535/lP8l5UcLs0/fs1TxedmsH4rvfNrY16szA+YZ1gw2oHHCqy0tmNV31udo
	 mMcQjgHynb/fyoNL2fS58WJ03r+qbxbPXsdQXnDIEFXTsJXNqfyL3JHSVmUIjP9Apr
	 2FQYRSwqlkMgvK6CMr/PWJQR7DjGIHNhrCa6vGEiSlVYX7G652y82E7GnMePxCWbDN
	 NyzjWeQiu6HFomTLzQeerK+xgcBLSuKs4YdNzrI9Nm3bhAY+HOBgKHX8B8qE/UnQG0
	 CKlLp0UascLzg==
Date: Tue, 21 Jul 2026 13:54:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>, Nick Huang <sef1548@gmail.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <20260721205455.GA91346@ax162>
References: <20260720101025.355623-1-thuth@redhat.com>
 <178463249517.1439086.5460375188993284761.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178463249517.1439086.5460375188993284761.b4-review@b4>

On Tue, Jul 21, 2026 at 01:14:55PM +0200, Nicolas Schier wrote:
> > A previous patch to headers_install.sh normalized the usage of
> > __ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to the
> > assumption that older versions of GCC might not define __ASSEMBLER__
> > automatically and thus using __ASSEMBLER__ in the UAPI headers might
> > break compilation with very old versions of GCC. However, as we now
> > reassured, even GCC 2.95 still defines __ASSEMBLER__ automatically
> > (and even older versions are hopefully not in use with the current
> > Linux UAPI headers anymore).
> > __ASSEMBLER__ is also set automatically by other C compilers like PCC
> > (see https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
> > and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
> > so using __ASSEMBLER__ in UAPI header files should really be fine.
> > 
> > Thus let's head forwards and standardize on __ASSEMBLER__ instead
> > of __ASSEMBLY__ in the UAPI header files now.
> > 
> > Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > Link: https://lore.kernel.org/all/2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com/
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> >
> > diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> > index 83e447596878..2f1d1767ca26 100755
> > --- a/scripts/headers_install.sh
> > +++ b/scripts/headers_install.sh
> > @@ -36,7 +36,7 @@ sed -E -e '
> >  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
> >  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
> >  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> > -	s/__ASSEMBLER__/__ASSEMBLY__/g
> > +	s/__ASSEMBLY__/__ASSEMBLER__/g
> >  ' $INFILE > $TMPFILE || exit 1
> >  
> >  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
> 
> Thanks!
> 
> Reviewed-by: Nicolas Schier <n.schier@fritz.com>
> Tested-by: Nicolas Schier <n.schier@fritz.com>
> 
> Even though squashing both commits sounds good to me on the first hand,
> I don't want to do that right now, to simplify a possible revert in case
> of reported regressions.

Given the additional information provided in this commit message, I
think it is fine to keep them separate, even aside from the regressions
concern.

-- 
Cheers,
Nathan
