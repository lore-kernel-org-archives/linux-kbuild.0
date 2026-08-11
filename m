Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F1342FCD3;
	Tue, 11 Aug 2026 21:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786485405; cv=none; b=NZ5x1VODQsRd3mniVuNdYy6PdUXdUecPCjnPmVTXBspDy/noDB0Q9zGneTV2tP8dooiR8UXqX1mJp98Z6hfyT0hgvNwT0N+CtsWQvBivPFpAnoJFTfu0OIOchTlxusVhA5BuiHe55KwmejxjLB1+ykyejL9TXZMJm+XwAWUKffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786485405; c=relaxed/simple;
	bh=DFh4pT7sRpZIacXDi7lJU5sEpNXuQ6gNgK0k8Tv8/+A=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aCfCshCWgAmP3E3JOXPVssu4yMm190uTMX2EiRM4wWsBmfMwbf+zzFRBsKXWUZUuvKBYk9NnsbYIEv/Ro7aGdL1VOl6GGOJAMVK5DBcg83R1HaikhU3o2XF1JQeZ35Ebw9/a1m23rmgniaHr/2GD89X8qkUndPf4yn4iHeAFiws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2C93892009C; Tue, 11 Aug 2026 23:56:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 25DD692009B;
	Tue, 11 Aug 2026 22:56:40 +0100 (BST)
Date: Tue, 11 Aug 2026 22:56:40 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Magnus Lindholm <linmag7@gmail.com>
cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
In-Reply-To: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com> <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
 <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Aug 2026, Magnus Lindholm wrote:

> >  Also I think our coding style would rather see the asm written as:
> >
> >         __asm__ __volatile__("mov $29, %0" : "=r" (gptr));
> 
> Given Maciej's comment on the inline asm style, do you want to send a v2
> of this patch, or are you happy for me to fold the
> 
> __asm__ volatile(...)
> 
> to
> 
> __asm__ __volatile__(...)
> 
> style change in when I apply it to the Alpha tree?

 FAOD it's also the space in `"=r" (gptr)'.

  Maciej
