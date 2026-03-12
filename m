Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1733E351;
	Thu, 12 Mar 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303909; cv=none; b=GPsa9/bceYnB6hnGWZShNj03MkQORYy8IgifJe74yxP6WMzwOoLDyMs1Y/shyr6Tf41XjZJdPezxYDeKhJ8NfkE0G74FsaDJKG7Z7k8FctVfWzqm3tygSJApgzegVCI/j6c6Q9sQZgkahRCZxJBX/k58prvAsU1kl3Eu7DXpMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303909; c=relaxed/simple;
	bh=krsSaZQoxVDPijdnqneCk2OGuHBceT+FCIVCzqCubqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekpVgBv/OKt/N9QM5rtOCG6d2FbJya2IlbYQ64kTz+zMA+u6iqRIX8id+6CfmQ4jX5delWb+bXHTk08zd90jVm5+AEVLZ5qQdCzDRCq0twUTJ4gBS5u1xxHBmk8egwHos1t7SPZgB5ELNtt9nn2aFHyvzk5bjJ9QsShh93i8wTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeSjpQOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeSjpQOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F43AC116C6;
	Thu, 12 Mar 2026 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303909;
	bh=krsSaZQoxVDPijdnqneCk2OGuHBceT+FCIVCzqCubqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SeSjpQOrGP3Q25B5C9HjBCxKtKnQzbQnQ2xeBnd8YtKGTBh1yuW5M0ad44SjYVy3H
	 rNFcfdiMnoBRxBDN+S9u83qTb0E2gcA5rc4cQa7NXQqmLNvSp3xCyWN48X7Twz58+5
	 LsrPAAwz62P85axb+2pPOuhnjlAZuFLsKLSUJBrE88s/x9cHEQfH3qwqYAU2hlPrdM
	 qjbpQVOtP4XJPe10/4sPbd5gSrJbO/rFViWLO7yIZC0s53+s65Zsvhz3+Z1ga/m2cq
	 ulOKEPxz4q4fREe6iWzoYqr3YmQNFad7AO5yeXtAeiiAcSczMqiZAvwhpKNBfX10d+
	 YdsHIjhdBaZYA==
Date: Thu, 12 Mar 2026 01:25:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com, Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260312082502.GA790897@ax162>
References: <20251028182822.3210436-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028182822.3210436-1-xur@google.com>

Hi Nicolas,

On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
> From: Rong Xu <xur@google.com>
> 
> ChangeLog:
> 
> V5: Handle single quote escaping in echo _c_flags to fix
>     Piotr Gorski's reported error.
> 
> V4: This is based on the reimplementation provided by Masahiro Yamada
> on May 26. The difference is that this version now saves the compiler
> flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> for the subsequent Back-End (BE) compilation.
>  
> Rong Xu (2):
>   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
>   kbuild: distributed build support for Clang ThinLTO
> 
>  .gitignore                 |  2 +
>  Makefile                   | 25 +++++-------
>  arch/Kconfig               | 19 +++++++++
>  scripts/Makefile.lib       |  7 ++++
>  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
>  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
>  scripts/mod/modpost.c      | 15 +++++--
>  7 files changed, 174 insertions(+), 17 deletions(-)
>  create mode 100644 scripts/Makefile.thinlto
>  create mode 100644 scripts/Makefile.vmlinux_a

I have been running this for a few months locally and I have not noticed
any problems with it (at least for the two distribution configurations I
regularly test). I think this looks good overall and seems fairly well
contained thanks to Masahiro's work on the earlier revisions. Could this
be picked up in kbuild-next-unstable so it can bake in -next for a
little bit? It should still be applicable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
