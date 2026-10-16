Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1F8248893;
	Fri, 16 Oct 2026 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113150; cv=none; b=WcMx2RIzGomNl3l6/bUZ1ksPBn1YZJIhL2FPv4eAEb/iQoN/psZYi2k/xGgNrVhqLXhis8AOLOZmXk8q675AkQptAuJK1+f+V8Dn37xp3oJJ0aL22JXlO2AUrqoYy9kMda0AkqHqNBN+FUTTtl+bC0OgGBBrmk/J36buy6fHIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113150; c=relaxed/simple;
	bh=CLKAia77oaQ6WDi5H7SO/81OFWAEi9pDUJTQjEGy6Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWLoPeKlvbndh9JutAr+pPSdavCRii0TSv+zC/lGT2lZ+vcmVB0+Dq2x5uUESdrRTSYL8hlzkzxpkzVgOxQXeSY3s1HVh7VGQSixVD2A8ZFUmyg5kHH+afjpeROgL/nTfgOKPJPuWPRhL4svKAsv6fMpu1hicM4vCLdBxeq0LVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF4kt9T0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF4kt9T0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5283B1F000C4;
	Fri, 16 Oct 2026 01:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792113149;
	bh=euChcgVWNRizbQAuB4b2E0arVKlEMiysaHFTpcZkDNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nF4kt9T0cUzuwiVRD9lGun3MfoqKE0jrKGneQgYFSlqKLuGnhvYvT4B3vW4YCkFqo
	 dgh9qiRB0nCwyVE1QqifnzX+mI5QjlKQBH41399795zrmQNHWMXMfdk5nKoSdQR0jk
	 q0A1BM2sbEbHkWS4b1QQaQwSd5goXA7CvetfOHboV9iejKsZuNHTqPU7gMdDBqvIwE
	 UAN8T94TfrYPzFetjb3pGNvNcNdj9fOtsJMrIyzgNChRp+c0iFprgasV2KCkId6xJM
	 pFNFF2HKkKJZM9o/uz345+g9sM1CtZ4VrCSFJGa7udLok0ZWbsvYRHqf4njimbEfTI
	 3B6VTCLQPd0Yw==
Date: Thu, 15 Oct 2026 18:12:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: vngocvan <vngocvan@gmail.com>, nsc@kernel.org, morbo@google.com,
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for
 modules
Message-ID: <20261016011224.GC3329673@ax162>
References: <20261015135752.17028-1-vngocvan@gmail.com>
 <CAKwvOdnkS7AnuJkQr=5-TO6eRL+joSNUKGfqK-mbim9_y0NW=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnkS7AnuJkQr=5-TO6eRL+joSNUKGfqK-mbim9_y0NW=A@mail.gmail.com>

On Thu, Oct 15, 2026 at 08:33:11AM -0700, Nick Desaulniers wrote:
> Thanks for the patch. Can we avoid os.path in favor of Path from
> Pathlib? Here and throughout.

I would not mind seeing some modernization in this script such as
os.path -> pathlib.Path but it should definitely be done as a separate
patch.

-- 
Cheers,
Nathan
