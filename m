Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973ED378D7B;
	Wed, 19 Aug 2026 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787100482; cv=none; b=lh5yS14TCCOsTBbqq9XArGUB5v1qCDQ+kXCG1nHykWywITA0UgZVi16+/59rbMSMzLIF8ZSANTtWIdZ6ykOATKcEme1Lp9fyG9WK9tWMLTSQL2uQ1TnWQyV1ccm0MoHFw81POiUAWDZh4JPmEsZARlp/RragSXrcx1yQ3Mw3Gg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787100482; c=relaxed/simple;
	bh=Kxgm452VQp+wyYxHjcnLvvvr90x+w1jszljdzWFr2ls=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MQgGADnK/ljLHGj5m1KEAC/eE8OdCp/5o+eI4z04OF30hXigeO/nQGBa2zrx7Em35i1xBng4men8rgmdfB7g+hNE5vS351kAYE8QmgP1T2XS9Ju+bEHR54zP4v/y6u5NgSW5o47Wk+fGUQfyi/toe8uyBKexQhQiGQ8beVq3J5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BACFA92009C; Wed, 19 Aug 2026 02:47:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B84F092009B;
	Wed, 19 Aug 2026 01:47:48 +0100 (BST)
Date: Wed, 19 Aug 2026 01:47:48 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Desaulniers <ndesaulniers@google.com>
cc: Matt Turner <mattst88@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Magnus Lindholm <linmag7@gmail.com>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, 
    linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
    llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
    Nathan Chancellor <nathan@kernel.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2608190129040.14132@angie.orcam.me.uk>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com> <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
 <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Aug 2026, Nick Desaulniers wrote:

> > It builds a kernel that boots in qemu and on real hardware.
> 
> Wild.  Where did you even get real hardware? I know very little about Alpha.

 Of course Matt has hardware, he's been an Alpha/Linux port maintainer for 
some 16 years now!  And several of us have some too.  I've got mine since 
2005, and previously ran and worked on Alpha/Linux as early as back in 
1998 while the port was still supported by DEC (and the company existed in 
the first place).

  Maciej
