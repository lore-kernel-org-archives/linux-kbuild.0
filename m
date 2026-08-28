Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C17531D39A;
	Fri, 28 Aug 2026 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944881; cv=none; b=RAahQUaxHkXQO++jYMPz7NDzi+Tq92c3TihQe2sOAKXkjtBDAabbAaoYtyRYffuJ6m/VyROhAvRxAnl3WuZWIZg7HEP3+rySVolf1Rnpx8WKFBGxtkk+UHyPgpdHE8lFs1i5K9WfXpTwcL9tgV4qnNPj/X11CAvOnbe/BwNMWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944881; c=relaxed/simple;
	bh=MTGSNXk/KeeCWl4z5xOL+w2W+zJDFyHnS/UGvVPON4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DndhSfAIY0GmW+HorWZWNNCnFP5wHDr91xgvM5y3S/9wGqW5aIfSc+ZnaUgmfVPWdSVB5twFr4zt0r3Eis4UaS1vIlzel4HT+VTV3VLVtd4XmDxWvsQEc4J1M6dTQWi8kxavLAAtmZDftb29TXnUgHKHbNQIRuid8uzYob9PEKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuPsSYQB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuPsSYQB"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C6FB11F000E9;
	Fri, 28 Aug 2026 19:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787944880;
	bh=+pC9pfKkgZde38rA1x41lZq10E6fInu+DStbCtLBNtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NuPsSYQBvf26u0P/q6K3dtc0+Qpl5LEF18SoNBkqHd35yqFpParmpEW5OJaAFfMZg
	 nIMRvP3dpIN0sCi3H6z2usuk1FaUkD00V6+Yh73x8vASAtj+OO8GwkbUv0ilrKEmQg
	 mUJlb/SpY0hrnRc8eI7lDJ/dW6nvqya/YycIFVjV053GtP0eJY7Gp5kVIVyjEI6fSi
	 +c3A2nJ61wn84ZMeWawcL9Am6UB9g0f8rJC4/2iPD1sILuqig3Xa71smYExm56v8kQ
	 duzjI1rwF8kXrNf/GjkOfisAjRBOfumgKGVqHfYVNKTKGWlHTJNCQxe72qhNEa8QR1
	 CWq640sdjuzjg==
Date: Fri, 28 Aug 2026 21:20:36 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Julian Braha <julianbraha@gmail.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] erofs: Fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default
 logic
Message-ID: <apHfhILRL0-lFOEh@levanger>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nathan Chancellor <nathan@kernel.org>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Julian Braha <julianbraha@gmail.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild <linux-kbuild@vger.kernel.org>
References: <c480ed6b8bf38822263e2c5b7cf32b28600f212d.1787219898.git.geert+renesas@glider.be>
 <CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com>
 <apGqg5a5I9g1CoF_@levanger>
 <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXwmCrzLZiPnQejJ+dTvVNf2zTzgKwTWEFEkfKRkZQpPQ@mail.gmail.com>

Cc: Julian

On Fri, Aug 28, 2026 at 07:21:07PM +0200, Geert Uytterhoeven wrote:
> Hi Nicolas,
> 
> On Fri, 28 Aug 2026 at 17:47, Nicolas Schier <nsc@kernel.org> wrote:
> > On Thu, Aug 20, 2026 at 12:15:33PM +0200, Geert Uytterhoeven wrote:
> > > On Thu, 20 Aug 2026 at 12:01, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > When NR_CPUS is less than 16, or when SMP is disabled, the default value
> > > > of 16 is invalid.
> > > >
> > > > While actual configuration picks up a sensible and valid default
> > > > (NR_CPUS or 1), "make savedefconfig" will still write a line like
> > > >
> > > >     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=1
> > > >
> > > > to the defconfig file, even if that matches the sensible default.
> > >
> > > Is this a bug in kconfig?
> >
> > I am not able to reproduce that; this is what I see with ARCH=arm64
> > (arm64 always has SMP=y):
> 
> [...]
> 
> > Thus, to me it looks as expected.  Do you still see the behaviour you
> > described above?
> 
> Perhaps you cannot reproduce this because this fix is already
> upstream as commit ab74edaeb1ae7c71 ("erofs: Fix
> EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic")?
> 

oh sure, thanks.  Yes, it really looks like a bug to me: if the range is
defined as 1 to 1, the default 16 should not cause a savedefconfig to
write the config set to 1.

-- 
Nicolas
