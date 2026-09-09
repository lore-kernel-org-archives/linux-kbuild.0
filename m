Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EFA3D9DDE
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982709; cv=pass; b=owIgX6cgvYYG0Qx0biihbZhLqlL03isY0PLCeDEnnMlDKVMJeYX+ZryakyaV81ZVnmLMdx6TOfCZ5SuU+AgXdBd7FYH7uwLQFekoC7/eZRoxA9q2QId1Zv3gq8cBLmyFTuce0z5c+A+RKpOzs67Xp5uDBjGD2LuwDGA681Llx/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982709; c=relaxed/simple;
	bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROnuLeTdhT4niFNo/yqVejEEZH56SiM/RHE50LnksSn69sZMX75KxJSfstwZbvDGU/uLtUQiNJpeFSp9XljhaX5E+1G7uFedbdtKtZ4Kuz5djYXb874Xqzqz2vhh5UKf2vu4X7cvyTrW4WUJIndK3MQ88EYMb4M1FtAE16gbqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9V1mn82; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9V1mn82"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed442so1074844a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 12:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788982705; cv=none;
        d=google.com; s=arc-20260327;
        b=T75uS6OkJG4uFho6oCgiDvpKQ5qCNFATx+dwI+OWksAYKZbMxPD2tsuirSo6l5/Nvt
         rMQzT3SmEvWDzB3SsWWA7/cMes57Wi/ixEoUkyELB2HjNXxgnhWZDT3V+HSX/liImUPR
         aXmZi/Dju72Owz40Y/U/g1bWsvrLZ5pQhCKvz+H6QAbV3UfQBOId4uJEh8raHX+VRWtM
         vFqGueP0Ev7A62bDJzzsyeYVXOJEQ6MjSznm+lMrvDj3t7ipQwvtBJLDvRDszysNGCA+
         CkhT0fklg5reBBAXVxpPav8k75pMN4zAArxTBj3OytRIxJjYEagA3KUamt9hxbSYgFmf
         ihUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        fh=CbXH5E/P1G+gg5+h2Wb0OuMJi6E1XB0pYRRgTgHBprM=;
        b=YNUFUQNJiPl10n5R0+uMRqldStHXjJ8W+UfEGLiG/2umC/X5Z47NdPpJdC+khhbU7w
         VLtVSlssYiiKwbUT5rlKx6B7hGz9uQ3S9u2MnctsN7OOsDpzcQI4cRrl6IAsGRTp/cLQ
         OKIUkT9/tZGq0+rbJHu50MRFz8WKNnvZL6t1kgXuqCQpMYeE/2ww1XW49sCwL7BaWTaq
         94khcCgS3QexBeYGXqYwI0f5Ds6MbAwgCz9Oj1XcB3a7h5PmQ+QBOreZ4ptcaT44CR43
         qDLNFfe3XqHgaUNjm2W1OmtmjODAy+sGRTt3PiwR1TpBKeWgt/ViFoQxP5tGUtzuI7U7
         /HFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982705; x=1789587505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=O9V1mn82dLJDJpoWkpJ3uIqIF6FnMmw8HKITWUuf0+5gF9tsWFQvJeqtuvXWVufZ6M
         WV9sS6d8PY3FlMamLDg2/HWYu2ToFT5hITdCpWxDuCc+cL4fMdLCp5VGqvUOnJ6dXJ8C
         8hPDf0onGOvKjlaqh834XmZcICJPaGL6gkNzUTEND5TaAJdRp8B3DRjO8U5MgUy+VG/i
         vNUxzIuRGbgs/dQsoZjiOkN7PDRGh1JoMmOGgnGAj/YKMASmOnNmAK7yaZfExInbXu5a
         EyCvSXz88ovLxnHrYgc7y7jmMl60j4R55wVeecNSwYBDDPcZ8AeLU6oDoA0MRQqGMd3d
         95Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982705; x=1789587505;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ydOjuoTgA1JS+qa07cHIVSm0i9RHzfwwnuAwNBt4m4=;
        b=X9zMyg6pNnkNDxSeGrK7B/jjaGCpZnw7wsLDab9ko0qRQKGOTdz2NR2kcQZZaEYoxh
         SERj53kjPJeaXaxciko+d9hs4fsToI1N4HukuIxzI5BmTM0HAjYhDSzJltVGfDQH84Q7
         CTqFmaEdeUich7wbVrYUxWxGevfCqFx4XPmHCx9sscQOQNKxFEEfWbgmG/7/AlFl3umJ
         nr6avu7SUtQ0RvlhOW9xM09L0L6Txo1/t/sDiW616ATOihEvWVwiwWeoZ1GjQaTJjZ7q
         ZCX5gnLLC8FmQY1HOFofMWZtHt5Q0/NX14PhTrU5tYWhNRKIgP8X5eESbkT4ywJZ5+wi
         5EsA==
X-Forwarded-Encrypted: i=1; AKwUvBwoVy+MOEgV/PpuMNVAPvR3tekW5Zo7zy0hDa37TYuBZhyEOpJJG9X0l87QECf3KX3NPjgUSa0VaXPor3w=@vger.kernel.org
X-Gm-Message-State: AFuF++l7DdEUy8+/intPKlo7b6hwUYi8k7jd9Fvc1vLPqXABhUXbn2Rp
	ni9YepiB+RCmBi7OgjEqNGeBzK1b0ZTR80qEjZlWrD3nktM4ru3d90a5uxnhInsNMkFT8kjaUfU
	ertijsXdW2s+FarFjnCo+KlsYlXeVa88=
X-Gm-Gg: AYBFou0tFyJzXYZ4eU22zXqSMvgLvf6cvgTmrr4jUFjxx4BIBSssotR8wDqk7OOd3Gl
	YLas0FADe4CiZ7N9RnzmZiSAW35/2S7c5DGZUzqYNEgTRMCtnIEBnDx2OSbNLw+I5K00ofxUnEu
	14YUlOvPsG03MlWsU+K3wsWF+HHwR0q+scQ3e2AZJFjvL+MAvoe3LPFuQGOSidZYLzWGFFWk0vA
	lTx5VinGxIRBTtE5AiW+jSlZV7ETOYRP+8t2s3GvsFkYJ2TG8xZcu1RQ6FwIIM1ckPBcJrLXig0
	+yOzUTTjQybBhTtB2LfHK8xCJKi8T37rqPYeOnW0QOvKmLAyTPQwYrRKNzx6lgBJUig4r2zbuVB
	mWN6XcQMHuqRAucu4yYNFIzoNQ6EuFUdGyCPQh57TLlHsBegcgIg6FfB3uRTThVA8aPS6+Ns+sp
	6Y77ixEar7f2YfytsWkWY6O13bmEE9YHtJlicHrYeHlpIVu34hAPA=
X-Received: by 2002:a17:90b:3fcc:b0:39b:3505:c72f with SMTP id
 98e67ed59e1d1-39d77b83048mr824934a91.6.1788982705356; Wed, 09 Sep 2026
 12:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-vdso-absolute-reloc-v5-0-3a93791af1cf@linutronix.de>
 <20260908-vdso-absolute-reloc-v5-12-3a93791af1cf@linutronix.de>
 <20260908071911.GU4120091@noisy.programming.kicks-ass.net> <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
In-Reply-To: <ABBC0C50-847F-406A-B426-55D0C2BE15EA@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 21:38:11 +0200
X-Gm-Features: AcwNN1V9A4D3jn7pum7crGv8bcA9jfLyy60O95H9hOe-jZGhQ7AzCwKSAv7z5Dg
Message-ID: <CANiq72=T1487Y7TpAa4c2eTJFMLHoe5Qc7+tRkbkmvrDjfmuvw@mail.gmail.com>
Subject: Re: [PATCH v5 12/24] vdso: Add the vdsocheck tool
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jan Stancek <jstancek@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 9:33=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> It was going to happen, and now we'll have to suffer the instability of r=
ust...

What instability?

Cheers,
Miguel
