Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474BA35839C;
	Tue, 15 Sep 2026 22:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509731; cv=none; b=AN3bClEtWc5uIs/TVYEYN/c1wIPrgs8Kpm1XoBUp/L5Fypk/AQi+d3N4/MPPy3+hcllTH1AnMKGVHkcgnPKW7SvIJkJzOykILfU0S93LlPNrbkKa3us0xUsdm/rZLr6DgLTkQ4e2BuSe4buHc0HHzcKg2yawhyj3dS1q2G9AOgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509731; c=relaxed/simple;
	bh=GLZJu+ZNY9Xk/LATlKZ6lQE23AXTXhfnz25McRPlX8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/f5zeZaDoxk+QXAU6IvOLzW62HZ3E+yHy0NGND6whjZyRoYl4kYa6NF/afBPBjTvisaAy3fAFLoAT3HrBY9EG+jsMrmyCzHva0yGPUUIbtn9Fhd2jF4mY2mcxPSJlj2E2scnJ3s3WlCnOiSPr5Gsnsx6lldaD+utqVzQTdZ9g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhjFqyCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhjFqyCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2071F000FF;
	Tue, 15 Sep 2026 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789509730;
	bh=MYpcvYi0IhmOHWDTtKoEKyqBM/oTdTRBAh47Pzw1eLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhjFqyCuf8kyiZrL8wY656bZcNEMfDONA7ohqItUHpNPPG3RszZNsFe41LjXRURME
	 +Brcrgy3eDk7P+9HGc7hlLmQLDyVCZxm/ZfOiNjxYdojZGbHPo6VC4dvsNy/jQhp7S
	 4lRuGandHFa8e6bwRcRg8mt63DY7D/CByAtl8ts/+TTpqupT9obT+FWTWzs3EyXxLA
	 1q0NUyi8fe0j3UcQbLwqsGtRg0rS8wPA2VTTT05j4pQ0qScvUD3mVhM615/f3tAGUb
	 4uKhgbMFUacif9I6QmFR9+s5WA6WBmhGNWcj8przi9Qggqhx5QGvhJNwSESCb1R/WM
	 GicpUqzdPobjw==
Date: Tue, 15 Sep 2026 15:02:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
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
Message-ID: <20260915220204.GA1534234@ax162>
References: <20260907103739.23212-1-hexvalid@gmail.com>
 <20260915-pastel-industrious-rhino-8bddce@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-pastel-industrious-rhino-8bddce@l-nschier-aarch64>

On Tue, Sep 15, 2026 at 12:59:40PM +0200, Nicolas Schier wrote:
> On Mon, Sep 07, 2026 at 01:37:37PM +0300, Erkan Erdem wrote:
> > Kconfig separates a function name from its arguments with a comma, but
> > the caveats section uses Make-style whitespace in its shell calls.
> > These expressions expand as undefined variables rather than invoking
> > the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> > example fails to parse.
> > 
> > Add the missing commas to the shell calls in this section. Keep the
> > Make examples unchanged.
> > 
> > Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> > Assisted-by: LLM
> > Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> > ---
> > 
> > Changes in v2, addressing Julian Braha's review:
> > - Remove whitespace after the comma in the three remaining shell calls.
> > 
> > v1: https://lore.kernel.org/all/20260905124045.42713-1-hexvalid@gmail.com/
> > 
> > The issue, patch and changelog were prepared with an AI coding assistant.
> > The assistant also prepared the v2 revision and ran the checks below.
> > 
> > Validation:
> > - Re-ran the documented working CC_HAS_ENDIAN_FLAG example using the
> >   Kconfig conf tool built with Clang on macOS. With a test helper returning
> >   y for either endian flag, the original example fails to parse; v2
> >   executes both probes and sets CC_HAS_ENDIAN_FLAG=y for both endiannesses.
> > - Rebuilt the changed page alone with Sphinx, treating warnings as errors.
> > - The complete kernel documentation set and kernel were not built.
> > 
> >  Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> Thanks!  I'll queue it for kbuild-fixes, but it might be defered to v7.4 
> if no other build relevant fix will pop-up.

I am not opposed to this going via -fixes but given that it is just
documentation examples and there do not appear to be any problematic
instances in tree, I feel like this could very reasonably go through
-next. 316d55d55f49 is from 4.18, so the examples have been wrong for a
long time. With that, I would probably not classify it as urgent.

-- 
Cheers,
Nathan
