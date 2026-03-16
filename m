Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C775933468C;
	Mon, 16 Mar 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684000; cv=none; b=g4PehNGRD134+PFkuX/6c4xiTfvgOwmC7oBBHM4+yv/OCE+kPq8Cb84lJEpph2R0MXy9Om6iY9bE1K9FNwtdDPR1c4c//RKSvEPG9+kGRxt0Ts5TwZbkRy9lo6nP6VauyZ+CwFxSWjs3VzHwSEH5I3t1g5GIYpvDFi9MaPw6egQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684000; c=relaxed/simple;
	bh=WJ+7NOHIyo2AVqHU3Hy1mS4mauWLaZ+ucROLTZVcQC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLLJIVokGRecXa5nXK6NuxixL0zLPBZ/lhzHDYp+eWRNWzxMDo7cxEijFsjvHRyvYsXaUUPXcL3DRCWrKlIpFY0CEkzdT6Mcs/bz/xWcy1w6YJzduT1yuQEkuDCVz5Vr6fQxWOurBC0s4Tub+Z/0PMJbLzk8cCCH6qAriKwu09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYncrS59; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYncrS59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2E7C19425;
	Mon, 16 Mar 2026 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773684000;
	bh=WJ+7NOHIyo2AVqHU3Hy1mS4mauWLaZ+ucROLTZVcQC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYncrS59AK4UsZU2csYt2ANYL3lyicT0Hy5yyHRd0lo++mh/6TD6tG2+i7KLjHojv
	 qdNdN7NzJuSpXFLrg3F79VuxnpgU+zByUq+8joUfhNk/b0ZJiSTXKfeyD1zvtjJlKK
	 pIy87vt+9kMoktxmjSBMu/LRWXNnFtozLQuqNaVlY4Em8/l2NkEFrL8ndSc8G3+ht1
	 Se7J1/uhDR4QM3ixGNB3tvI/C/4EihEWqBr/gh5RnwIOvPlxWSVaXhwsKBjDcZpHq/
	 Ktl70c7q/ldBkBsqHTgh7FFcPLCKttED/UIK4tjx+tPW67uCzwyhUjvnKdziOzk7BI
	 pewnKCN843IGw==
Date: Mon, 16 Mar 2026 10:59:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
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
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to
 scripts/Makefile.vmlinux_a
Message-ID: <20260316175953.GA1910339@ax162>
References: <20251028182822.3210436-1-xur@google.com>
 <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger>
 <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>

On Mon, Mar 16, 2026 at 05:27:01PM +0000, Rong Xu wrote:
> I think the problem was $(AR) mPi and llvm-ar <= 14 do work correctly
> in preserving the orders for "thin" archives without --thin.
> 
> We can either
> (1) Bump the LLVM version to 15 and remove the --thin flag, or

The minimum supported version of LLVM for building the kernel was
bumped to 15 in 6.18 with commit 20c098928356 ("kbuild: Bump minimum
version of LLVM for building the kernel to 15.0.0"), so it seems like we
can just do this?

Cheers,
Nathan
