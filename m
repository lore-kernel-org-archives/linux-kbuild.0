Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE80199949;
	Tue, 27 Jan 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769547464; cv=none; b=WTjqzWkWC6jeYiqTSpIjmjdAyTYDmEQgySt+a3MSXk8FHQMVCTVeMrTgm8xMN5Mjc3KkWI53EvYQSsyJ7HfLFkDxa5tRMFrKZZUt2/XUT+/I79gBSvfhEWaL5XcX8Jqxg8EvXdslVQad1gOl8N1jdC/CupjB4IEtxLwJwAxi1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769547464; c=relaxed/simple;
	bh=cmjdEPiuJ79Jte59ZTtNhVL6Y+xDId8DcPmc95XyRk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvAQpCT5gKGBUZ4P4t2Faeofxb4mAORJs5g/0Pe9q5OUPYzoSe6yqkT9LxL9+GPqVfz5JtLp95oc+cARW4FbiKjMr8ufjQz90bgt+ajaSn44N2aa4la6Y13vZh3eR+le4vXsQt6gCo6Vj+KNMipooR01v4oEqfcFN1IFDIuTOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6/XtGDY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6/XtGDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD292C116C6;
	Tue, 27 Jan 2026 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547464;
	bh=cmjdEPiuJ79Jte59ZTtNhVL6Y+xDId8DcPmc95XyRk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6/XtGDYplbq+mTzHXjamxwk3buhZszIzNkUdkvmLnV6h5exMY6O/T9dJVY/q0V+o
	 UJm9zx9RVSscgD/xH7iXpTlxMnEabNXrHpsWYezd9tiabqT8kLuzYayUssOQvRcsgb
	 FhZ9J/lKJwRIPk/ElmzaXsPrHBtWG5ZqpyCr+7MbOrnFzo5UbP6rIVTwBF92Yh/y9u
	 6gANy67fENNrsiW0gq0gXalgVhU7nRX3PdW36diRiMuIJe48gNBThnUIiLgRms7VnZ
	 6jHl5hahTxbFNEejmUeRHknOwv0GjUYnmep0NTzvxlGtrSwQhqehzTA5/PMhVqDj8p
	 /8dlu5nPJ7ztA==
Date: Tue, 27 Jan 2026 21:13:44 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <aXkceKDeYxUGHLQh@levanger>
Mail-Followup-To: Guillaume Tucker <gtucker@gtucker.io>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
 <56209dbc-2dbe-4f52-a703-bcbd9ed3e712@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56209dbc-2dbe-4f52-a703-bcbd9ed3e712@gtucker.io>

On Thu, Jan 22, 2026 at 03:12:36PM +0100, Guillaume Tucker wrote:
> Hi Nicolas,
> 
> On 20/01/2026 14:54, Nicolas Schier wrote:
> > Out-of-source builds do not work on my system with podman.  If this is
> > expected, I think it would be great to mention that somewhere in the
> > documentation.
> 
> The v4 now mentions this and also includes a trick using bind-mount:
> 
>   mkdir -p $HOME/tmp/my-kernel-build
>   mkdir -p build
>   sudo mount --bind $HOME/tmp/my-kernel-build build
>   scripts/container -i kernel.org/gcc -- make mrproper
>   scripts/container -i kernel.org/gcc -- make O=build defconfig
>   scripts/container -i kernel.org/gcc -- make O=build -j$(nproc)
> 
> Would this work for your use-case?  Directory names are entirely
> arbitrary.  It's not ideal but might be good enough as a workaround
> until this gets properly supported by the tool in a future version.

sorry for the long delay.  Yes, thanks for the follow-up!

Kind regards,
Nicolas
