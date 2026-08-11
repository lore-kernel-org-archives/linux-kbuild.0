Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A1430BB80;
	Tue, 11 Aug 2026 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786446607; cv=none; b=qjimRrHbNnNWDfuDLJ4JDr5fzs7LDpgeOEQRu6g2T0Z7VxXgdE8cytFAYH5DntGNxh0iTDmK+9ifFjT2m4swGwZBYqr7qTJuYmUugsgQt8jaR+RNxlkjxPOf7caAvlituBqnEpM+/bhgTAUAkMqVsMfg+RyPsfNZjrt43sGtLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786446607; c=relaxed/simple;
	bh=UxWeefAb6krFvq7Fg9Ob9zIpY3o8Sn9GV7JIMzZAUVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZoC1ubmUPbwJiHEhHnDmV8z6eGdn+wlOqieP/hjJr+eL2DpYf09O7jazLANVa5J32JFKTmChyJgYlq1tWJm1GoWiXwNVC/Qa0REaCrMU2jPOWaVPHchstkXh8OgYidJVWDNKjuaLbJsGCsInr3EEltZxLqT0QYU76hkhOIB4Qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 901AE92009C; Tue, 11 Aug 2026 13:09:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 81B6B92009B;
	Tue, 11 Aug 2026 12:09:55 +0100 (BST)
Date: Tue, 11 Aug 2026 12:09:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Magnus Lindholm <linmag7@gmail.com>, Magnus Lindholm <lindholm@kernel.org>
cc: Matt Turner <mattst88@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
In-Reply-To: <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Aug 2026, Magnus Lindholm wrote:

> > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > index 7631129ac914..5b4f1ae2b74b 100644
> > --- a/arch/alpha/kernel/traps.c
> > +++ b/arch/alpha/kernel/traps.c
> > @@ -925,7 +925,9 @@ void
> >  trap_init(void)
> >  {
> >         /* Tell PAL-code what global pointer we want in the kernel.  */
> > -       register unsigned long gptr __asm__("$29");
> > +       unsigned long gptr;
> > +
> > +       __asm__ volatile("mov $29, %0" : "=r"(gptr));
> >         wrkgp(gptr);
> >
> >         wrent(entArith, 1);
> 
> This looks good to me. The explicit $gp read and use of
> current_stack_pointer avoid relying on the unsupported local
> register-asm behavior.

 It could have been worth mentioning in the change description that no 
code quality regression results here with GCC:

--- arch/alpha/kernel/traps-0.dump	2026-08-11 11:57:59.895247441 +0100
+++ arch/alpha/kernel/traps-1.dump	2026-08-11 11:56:31.788713285 +0100
@@ -2223,8 +2223,8 @@
 			1b70: GPDISP	.text+0x4
     1b74:	00 00 bd 23 	lda	gp,0(gp)
     1b78:	f0 ff de 23 	lda	sp,-16(sp)
-    1b7c:	10 04 fd 47 	mov	gp,a0
-    1b80:	00 00 5e b7 	stq	ra,0(sp)
+    1b7c:	00 00 5e b7 	stq	ra,0(sp)
+    1b80:	10 04 fd 47 	mov	gp,a0
     1b84:	37 00 00 00 	call_pal	0x37
     1b88:	04 00 00 c2 	br	a0,1b9c <trap_init+0x2c>
     1b8c:	08 00 1e a6 	ldq	a0,8(sp)

 Also I think our coding style would rather see the asm written as:

	__asm__ __volatile__("mov $29, %0" : "=r" (gptr));

 Otherwise:

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
