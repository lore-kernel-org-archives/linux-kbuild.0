Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F63B1009
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Aug 2026 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791767; cv=pass; b=ZtD5VKUm9iqlwyjJ3nOWEj8KR/ghE0Owbr+e/JaOqVUmjvvM32wFeXOfkwE+sTWa0xhRPjKEMPHmIdY7t14n5YMBFkIrYg52uqgCT/I9kkyquHYFaefp7KR3hMMTMCqmd/HhZoiEsMTWF+mwicl93sIVixdbBcT7xrabHkoKuFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791767; c=relaxed/simple;
	bh=y5qiPvD/on6DO4GW0krQNBl6dSDpG8n+mCfX4z92gGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZmhyy9xPwsfFIO5Ka+79UIgEUALXhOMZ4J3n4FYz+F+pCFDOW00HIc/Kitw5vXqWwUVnTzbG2NzGKg/v7uKkdMFz8wcaECExXp6vXBKYPnqD4C1mgyb6YCUVtkS6o/RSeKdFrqtK0mT9vaCMIwSGFVGMSdZeLtVBaaqAt2xLyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeYwGDYy; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeYwGDYy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0ddef4e35so2451236a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Aug 2026 14:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785791763; cv=none;
        d=google.com; s=arc-20260327;
        b=qjnPGJnL5J8H9ttALrDXFwXiyPve/FjZqJ2mY4u/RbEGZu18XtdQN8HUJGYWMHvajJ
         V2z17YXinSrHC9YtAwyqCUaLcfPQS3FTXhEexCymKGFCj8uOS9/ekpSwec/M8dccCEpN
         mHp7drJB0mnFfLBhRJx/13mKjavcICptvy7GdIX9WMqtQivCEwBqu5AG5KXaAiE3OlpD
         scwSgtTNLWQ5aTL/Ed1y7xe41RIpk0FED1Su9FfE5//4Mi5EKKEoxkDSol2J8hXKjHKu
         AaN7eayBFK4YXDiI6XVrGi1n26ziANxmuP183Oq835pRDaPNTu+qVaLEgE4CEMkRs+nq
         dJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        fh=cVD1ldrTd2hfJiDsqXETHhIquUtaYQ5SGSZebOmBAsE=;
        b=nqdqnfQZVYZH1edqyuPy2ul/RTZpBMFr5XxSxvINCeBpNISYXa4dOigUIVwtscl8VZ
         HVLRooly0P8prvF05sDpLzA6yXkxdD16ykguwBnyyn+9z8OzzRxqhtbw8yHT0RtiIihZ
         hehhtI7rAq6O01AQHBO1OxQkf7NNFf3EW3f3OJmJTdaNsUUkC3L16wI7jn2iY08X/RBh
         DXl2SO49wUu2aY7bb0+UvSmSAPUUJGV/sxUhztwWTSXicffy5/VsNdmDFor9FK92ZaBh
         MI7NG7BfJlTKoSf0ep/atb8R53IA6pOFZEi8WdfaHXj1KQJbgdeyT/AjMx+a0mCRncef
         7/Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785791763; x=1786396563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=AeYwGDYy75kdO6XiGzJbb+/yIRXmyt5HRThCDbNWJSqfvSZeErFZtXK3ZqmGvRBPzQ
         41lcKutGjpG1n4IAMG9VKToAbECAI569GpeD57WT2A61l7UX/bd4eKS4CFVEHXH2dX+F
         OA8e1wuo3lhDzKwU2bdy1/joF3owlNJgGTSNuOoCjXkiw6vaVkSUyeQr84YyThHWFyxy
         75E3bdHnOL1HoF/ZXTp/EIeqf2fPHcvYR++d/0zlKmUdQp0nNlEvDiNMY2snFTjHPHLi
         e3iDReFwLZwdlVHDfSL9MLadzE3RSGZeqKcQxeZT6o+LAgqPZG2VbzSwKiBy8fzHryMM
         NGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785791763; x=1786396563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONA6u0gWcMYpm9YSgR6BXB8HOfOJ6IJqSr2+VzPiqIU=;
        b=tN917iLE+9T8WchgiFoYxXCaY6cCtn5jgGncinbOrcuSCx19t8zDecvTzmSscnGxYQ
         RfSbRByawgt37FkAPmXgkMbPcWu5I+1hEFh8m0mh6/uYUXNPZqy58GC2amSfJMIYtEd5
         yHgylcLOzIfF7OIaN+QC1zfpcMyLkZRrEBIHTdoo0FMDP7ckRha6rr1JjCf0oM/YdhGH
         I3D1876IoZeIegKHOv/DE73HJy/RmGWZvrb496jHqjpIzFguIrRmJZMQgvwKhS4X5BH1
         KKWwxZ+y4SRjhSddAAoCWZjmxdFCsZy99qPUMlHv2wb2Nl3TJShof5GM/wy1CdaEbej6
         KusA==
X-Forwarded-Encrypted: i=1; AHgh+RofyQgYw3WiB+I8tMLHEN4uZV24P/tZDavOHkB6Mq7e7/Izh2FW08BSpmpyN1umU6RcvI/pIKXIcA91aG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9bXLVzA+7PaC3bMv87fhdjXCHYeLU6UVfUfuQPPijtCMlk0A
	gsvQmzBmUcDUMZENv2r1HhwVuAYpp0dxsR4v5ZFMtc66UhtbuSoGzewpUJIKFsYtDn35BPzj2P4
	ArscPaI9Ic2SNyDhoCnEJfS12SaMzSlk=
X-Gm-Gg: AR+sD114ZDnM+XGvfHaeKfDFpOYEut09vBn47j/O5ARSnj0ROZn4mmfCTScg3o5g5W1
	zOmExkYluNEohR22VmgBwSv8mFedeec+fLxc0XAPSUlsrllDc6u62hrw8Gye+nfijrZrdNZ/+VA
	0HXqf4c5NFKoIxfaaffn0li2zAM40p34oSjI3gc38DIQRmtZVrYk6Ewi0RAJ8ssqrxIGG03ZgqM
	nhxUfqQswGFgcvf01cp9H2XLDEAP9W1e1ni5HwPDB0oRhIQcHtmBZ2FeCFqtnutZFwdHZs80oIM
	NALn7c8SsM5D78gP/w57EG0/htMSuqQCsohZfeRy22rU6j9KJ4SPnYlfG8EAHiQvZ+SHI6pM8Kk
	SH87OTArTuBe3fm7LDoiAa/w+HrBDDUs=
X-Received: by 2002:a05:6402:3241:b0:6a0:8885:e6ea with SMTP id
 4fb4d7f45d1cf-6a0a7c60fafmr7359384a12.6.1785791763033; Mon, 03 Aug 2026
 14:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 3 Aug 2026 23:15:51 +0200
X-Gm-Features: AUfX_mynwyTXbGl2r5A9Ln_10BtSjIBSkDIfhjkE2mzRhJnUG3o0f9IhUJu7p4s
Message-ID: <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Mon, Aug 3, 2026 at 7:08=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> clang honors a local `register unsigned long x __asm__("$N")` variable
> only where it appears as an inline-asm operand; merely reading it does
> not produce the contents of that register.  So trap_init() passed an
> undefined global pointer to PAL_wrkgp, and load_PCB() stored an undefined
> stack pointer into the PCB that swpctx then loaded.  Either one wedges an
> early boot.
>
> Read the registers explicitly instead: an inline mov for $gp in
> trap_init(), and the file-scope current_stack_pointer for $sp in
> load_PCB().  A file-scope register-asm variable is the form clang does
> support.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/traps.c | 4 +++-
>  arch/alpha/mm/init.c      | 3 +--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 7631129ac914..5b4f1ae2b74b 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -925,7 +925,9 @@ void
>  trap_init(void)
>  {
>         /* Tell PAL-code what global pointer we want in the kernel.  */
> -       register unsigned long gptr __asm__("$29");
> +       unsigned long gptr;
> +
> +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
>         wrkgp(gptr);
>
>         wrent(entArith, 1);
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 9531cbc761c0..f4d65a60c869 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -63,8 +63,7 @@ pgd_alloc(struct mm_struct *mm)
>  static inline unsigned long
>  load_PCB(struct pcb_struct *pcb)
>  {
> -       register unsigned long sp __asm__("$30");
> -       pcb->ksp =3D sp;
> +       pcb->ksp =3D (unsigned long)current_stack_pointer;
>         return __reload_thread(pcb);
>  }
>
>
> --
> 2.54.0
>

This looks good to me. The explicit $gp read and use of
current_stack_pointer avoid relying on the unsupported local
register-asm behavior.

I also built and booted the patched kernel successfully with GCC on an
AlphaStation DS10.

Reviewed-by: Magnus Lindholm linmag7@gmail.com
Tested-by: Magnus Lindholm linmag7@gmail.com

I am happy to take this through the Alpha tree.

Thanks,
Magnus
