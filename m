Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6802ECEAE;
	Mon, 30 Mar 2026 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897001; cv=none; b=IApK2+t2slaBpFmMk2GReyNS8H5O6zKTdef2+R8ZmLmz6twIVpagKgQ48N5SVDElMki2V0bhFMfpqeyvl5wgou3TBT8kDLMJRy0W/DnetkAsjc6xqIrr41+MJtlup2pqYwl822vqXROaPaHaQriJxCjBkbS0k8pA9yOaEuHbsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897001; c=relaxed/simple;
	bh=ZvQPbkTiK1wJRYR4Ham2fQ5leT7rvAHFzuEbd4nGT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNbOcxnKy9Z76mqN2TcYWGT8TUTnSD7J4y9KhzQxKCNZgH/o7zwXFlUyGFFyqRNQuKWy2H5i0kaDXZ561aZCS9RYPxBOcZJph4d9R26FzljNo3FouuYjqQMUarIEj7+LPio+4u2Gx9+tZi+7NiOgt69s8MNxa892SZHizk/yyzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2XsZXfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2XsZXfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B9C4CEF7;
	Mon, 30 Mar 2026 18:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774897000;
	bh=ZvQPbkTiK1wJRYR4Ham2fQ5leT7rvAHFzuEbd4nGT50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2XsZXfI5ERyRjaxi0wdgIvTuxX1NkR2UV83UfxprGYtHGjE901ynn1mxddHLfoeG
	 4m95GZ+Bud8WZRmeKiRldoPaE6daEXC4aOacMFQBtgaEZPHugrMcvS8HM4sif6g9i1
	 KWUWyfbFK5CNpuB2MN709I3GxBRohIXz8RZDcpNG68zLFt+RaWG/h+Jg9EKbtOrJl5
	 ArHB+NWb1oDePBRjJ+GuDustGq4tnC5NS5/Tuoof2B+iu1X33/eO/VA6lnMiVOJw/F
	 v/yr5DdqY2HzRHHGyfctRp9a88jvTmH0LIaaZJYrqP50HvsFhMq7g+YMX/C93NnbMw
	 m1ELmNKkTNuPA==
Date: Mon, 30 Mar 2026 11:56:40 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for
 FORTIFY_SOURCE
Message-ID: <202603301156.19EEEBE@keescook>
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
 <20260327221837.GA3622500@ax162>
 <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
 <202603292059.01A4CB14F2@keescook>
 <20260330053604.GA879042@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330053604.GA879042@ax162>

On Mon, Mar 30, 2026 at 07:36:04AM +0200, Nathan Chancellor wrote:
> On Sun, Mar 29, 2026 at 08:59:51PM -0700, Kees Cook wrote:
> > On Fri, Mar 27, 2026 at 03:29:18PM -0700, Justin Stitt wrote:
> > > On Fri, Mar 27, 2026 at 3:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > The compile time impact is not measurable (within expected noise). The
> > > peak memory usage may increase by somewhere in the 0.5% to 1.5% range
> > > depending on build configuration.
> > > 
> > > I bundled this under fortify to limit initial impact as its had
> > > virtually no real-world testing and may produce unhelpful diagnostic
> > > notes under its heuristic mode. I don't expect folks to use `-g1` in
> > > the kernel (which would enable full-proof diagnostic notes).
> > > 
> > > > If not, maybe worth adding a Kconfig option that is force selected by FORTIFY_SOURCE with
> > > > clang or can be optionally enabled by a user?
> > > 
> > > I'll defer to you on this one. We could add
> > > CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?
> > 
> > I would prefer to just unconditionally enable this when it is supported.
> 
> Agreed. It cannot possibly be worse than the status quo, right? :) This
> feels very similar to -fdiagnostics-show-context=2, so maybe add it near
> there?

Yeah, similar. That'd be a good place for it. :)

-- 
Kees Cook
