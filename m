Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D37365A00
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470910; cv=pass; b=srMJxo3jxj0aY0P3F8dSmgbZfliT7Ipqyut+wET+PvQdbDBKPHsh/zx6Mi7va9XM43i5F5xoZ6ehUeYmzGDSzxH+/SLgsu9UAkH91X7ytt/vN04mPdzYfClUJfX2g1Ppt+NyRscXF+uDIzuHNM6XjQYuPDqA57iIOwNdHhV7FMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470910; c=relaxed/simple;
	bh=fk3cj3bj08mSlvA6SO698MI0UqKOknXv52CFioKh+/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQPgrJu8t9AM76f7/uAfDsC97H+FpAQ6q3x207Vvd29RH7w+uheHzhHqktCpfif3h1jKymdn0QESlkgNBTOkkw9DKttU2tw0eISygUAmL3MX+nRUdfqNEsZD+T3/jxrPVl9PktTKjXwjdlOfOe/6UNI0hW6+B9AGVkU34+/UrKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIfgB4eG; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIfgB4eG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a1b51723a9so188542a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 10:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786470906; cv=none;
        d=google.com; s=arc-20260327;
        b=ULTybocHa2ZWjw4ZF6MgxEoXrrTpMLGyy5PGbCMCjZ2uLlx28OoLdIJW3BQP7koXtM
         YUwvF2WHYJ+OAT0kKGGKMLs2i1mzX7S5R+5LEOMVx79FV2kdZ9NmBOChLPaxvt6fwAE5
         8UiINOBTELqoG23v0oBdOXtTodTqGFqoHd0E5U3BCVRAmeYe+AHaIf6ekGIQBWQM1nep
         rBxy2aTIIg9adbNsZLgNyR4X+aJ9B24zcI2uhi+i5iwwxJUJQ7ni0CZDzmQv8AT7vCK8
         JDE5SyQj7w/pnCF18uqfHvFknTbIIrQDTvXijO/2b3cCcPJwXBOFFw/hmHuD+hZX6fME
         b9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        fh=LMfXNEHxp4KTl3W0t7FG++ztcWYtg2nLzhgVHV/pPMg=;
        b=BDKvMEisRjKquBp6dzCo4uOaVcDiriHZjEM5oDtitQkBw7JsQqZWlOquHII13TOx68
         waSSRG36vv+Eb6MvL8kQ5Cazl+BV9e1hWSOolg7BiobuN8HWnOXq+TyO14YLxsmO7EYw
         pdV4OTi9PHSAyNMsM20spEapsh+lLa7MLlolPJ4PItw/oriuZYtypJMmOXRtO/bPQGWe
         xSkvIo7n3YiCrSiK6RE21kK5zLumLRtFe2bU52FpV0FHbVkUbAsPQFl1+zUl3EAmZmCU
         xmWKIjti0OG78xEOtAuvxKG5qET5wrNuHuYc2M8uMzdGH/OGuxMOFbXUbSNpLnxguK9U
         khLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786470906; x=1787075706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=iIfgB4eGzmPL4YMa1RafxDhLHkGiI9xpYXtJSARmAN9W6+kbMmd9f0m0lnaTIK6hYm
         lSeIX2c94pxN9nzHpTOXPmgQKI2qf9xURPaEyUGKixA3GqaY8k3HanNpMWYWgiYk7Tc1
         jLpDjVipPuC4EfJrFOPKRvAgpB3wv6njv617BXKMflEQLOzUfY0GmUZ3pHWBffihdvbP
         mAcE/Ky4AwvEXX3/vjFhrn+vUYAJ5/25BzJ6juQFyrwHPIejsIrH0mH+bJr0jThCk/wX
         qsfqgh8tXHFF/lJFd6gUjVyQIXBb9yT1qIUli4pbNWFVakOoZQGxIvLBuz14AUGhs+Oo
         Xoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786470906; x=1787075706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=KdrisSWWN98oBoVwtcyn3Rinx0uGe/9TyiWqIRV2KHMhqc7Opdprzjsv/o0j0S1AC2
         qhfACDdDhKzGQKWdQrTOXkKN+8JwTr7A9z8+vkDwyQxcTWewSJGVnPsf03yDfa8C+CEX
         17iuNdpgqGO80W4sSlldjgnK8h1YmuANPoJdgFQ7ZX4KjXKX3b65fxrDcOQQSlV6W0W3
         uivbHcYhzhPJOKhdIfb7Dr1iurpNq+YXFCdJK3Cu1YTADuPQJC8oU3ihtkYhL5Jnv7NG
         vb66JJOh843/q2wgZsZg3O5bfGNLXH/8bfYVeheVysAputQAbazgjSYIS+ELpzpeFPBc
         GUvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoaLgsRZ+mBFqBXWMl/0fxU7sUTMUYDSvq/dqNFdp/vO7lYKWYmR9yXMLNdcOTET4umSYKRPgqKNCiN4Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGd47xhw/VUofokPm7KXaxMt6wERB/qvDe4pTaR64bTTzoGoJV
	v16RGGgnsV9tl8QcR+PSvCtyfrOSIVrs1iHRbS73bB730AzX7KgcPT9N6Pt19nBdMjE596NTdGs
	0jcP4Kj7s23zJbGriPFSdi/QxX/LPJOY=
X-Gm-Gg: AR+sD1181EJa3s11f8yYW0VZ7Slbiwl35ndAdM/Yzc0ZbYKaZTKt32uGBJBD2xX2oP9
	8hHGKd8AC9k4AML2jitg18IHyVp5cfzmTk20NvYmNhokQOrzK6ot9j7feExh8R06UJd+CCiONE1
	xuY9V7ZOiYzJk/3YYWiVS59aVgPcLP+Kg5K6b0oIMBaYbouCuUHt9gGU7GsDcilPEpRZXk6uK11
	640KUCbvEl/lVdTGKGyc/Y8Q2NtOB08UZdt7ItoKagmDlM7+ms2EPkslTsFkcPS8PpXSN7BZf0F
	nXuSAL6ectzJRb13tdQYXXzQgkivrZc9C9X4QjLzR1CWEZDYh3XxXViw1Mtm5/RCC5m0nrTyp/Q
	19O6DixzGuqrrJFZ7nf281bS6K3X5wA==
X-Received: by 2002:a17:906:99d2:b0:c16:29eb:e81a with SMTP id
 a640c23a62f3a-c20e62ab2fbmr267443266b.29.1786470905900; Tue, 11 Aug 2026
 10:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 11 Aug 2026 19:54:53 +0200
X-Gm-Features: AUfX_mwmYRsPi8HwxaB-iZ7wFAEzdikDqU9IB7Vfrv62aJ3SgXEP-mOrafoo-HM
Message-ID: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Mon, 3 Aug 2026, Magnus Lindholm wrote:
>
> > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > index 7631129ac914..5b4f1ae2b74b 100644
> > > --- a/arch/alpha/kernel/traps.c
> > > +++ b/arch/alpha/kernel/traps.c
> > > @@ -925,7 +925,9 @@ void
> > >  trap_init(void)
> > >  {
> > >         /* Tell PAL-code what global pointer we want in the kernel.  =
*/
> > > -       register unsigned long gptr __asm__("$29");
> > > +       unsigned long gptr;
> > > +
> > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > >         wrkgp(gptr);
> > >
> > >         wrent(entArith, 1);
> >
> > This looks good to me. The explicit $gp read and use of
> > current_stack_pointer avoid relying on the unsupported local
> > register-asm behavior.
>
>  It could have been worth mentioning in the change description that no
> code quality regression results here with GCC:
>
> --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +01=
00
> +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +01=
00
> @@ -2223,8 +2223,8 @@
>                         1b70: GPDISP    .text+0x4
>      1b74:      00 00 bd 23     lda     gp,0(gp)
>      1b78:      f0 ff de 23     lda     sp,-16(sp)
> -    1b7c:      10 04 fd 47     mov     gp,a0
> -    1b80:      00 00 5e b7     stq     ra,0(sp)
> +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> +    1b80:      10 04 fd 47     mov     gp,a0
>      1b84:      37 00 00 00     call_pal        0x37
>      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
>      1b8c:      08 00 1e a6     ldq     a0,8(sp)
>
>  Also I think our coding style would rather see the asm written as:
>
>         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
>
>  Otherwise:
>
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
>
>   Maciej

Hi Matt,

Given Maciej's comment on the inline asm style, do you want to send a v2
of this patch, or are you happy for me to fold the

__asm__ volatile(...)

to

__asm__ __volatile__(...)

style change in when I apply it to the Alpha tree?

Either is fine with me.

Thanks,
Magnus
