Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B274E36074F
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818356; cv=none; b=SUAi9Xs+KXGZsoofxJN/W7AeyF3r92XcyLqv/lDo83+ZoLbFFRsf9uNpbZRyH41yLMwdzECqRdiCtP1q/WvoXEUfBtCodXEW+Rv+VRsclYJgqUNFE3krKojBpNyUi9rUgX1ulA+5GH9KB+m5WyA+9spBOqO2TIkawEPpv7RY+xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818356; c=relaxed/simple;
	bh=bIxrx4KoLTRQn4XRd5Efn4xp/evATyJ+zwU3/uVKTz4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=czY4+ve6oe6NEbSczcNd9kyLyF0u+iJSwX6NMm2g6mK58l62pH1vUL3YlqB+i7MyQwkx22el+qeLP4QkqsBTpHAcosHKAUS4wflrdFx5VclEtwXsTftdDfPELdl2+A+DhG2sQtTdE0xw2Y3ia1L6ViDM5SI6i7b2yjq+HzlqaIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lJnLJBIc; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lJnLJBIc"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837907ec88so109032715e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Mar 2026 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772818354; x=1773423154; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vcQthuk1eWzIx9SkfXAplSVF+zzfp3bHB4lRD3w+Jw=;
        b=lJnLJBIc1ZBH86wfUNtyAfhXTbL94Kt2oQrsHurvUN2KFu8IXpFusZKKorF0e8v3fX
         aXqwJAL9RufrR4jNwJKB/KphH5EFn90w34anqjhWi8COeq6GuM2frgKyHOSt+xHBGXMe
         f7HTA3Pk7HzldbyQxam2WeZ3zusng+1aMPgOnRp5q1yc4i69hiaMrnaMb7/xHZU3mdXR
         9csfD9J/EBfzrcjlgCOxTwzU2TZo1g+YVQmDlqVR5SnXljND3AdKhnshaG7gbJzjLkG9
         9bsdkX5Ab4c3svjr9n/Na7AHK04hon7W3bQL0gm3Jm3pjXdPKa3aDLBf7KMvtj45MAI0
         jhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818354; x=1773423154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vcQthuk1eWzIx9SkfXAplSVF+zzfp3bHB4lRD3w+Jw=;
        b=QS1bVca2/TXu9M+pvpj69Z8xA81NCxDRgbs++vTIxJrFY25Y0G3Xfnes+Ebp1UgjxR
         dPDK78xPn74HmarW2OQSwPRMK69RknqvwqBIC/R8e8CaqrZ8LSjcl3bRXxwy+nhk7gDd
         aQRKDH/3Z/MYup4awj0+Xmrk+sVTfnxuT3QOJtshF7M8PpY5ufnVC4pga/YpI4K8b8Q3
         uSjYcp8vezdQ1oUTyDAp3Ll7cUkMlLoogZ8CyNNp0dkIj4L5UUPJwTHbHb/CQ40Oc1zS
         ADhZn+SHnsOpfI27/7EHLYar/xnhHlcmnZyjP9W63pKCneZq3bcht00wS5zYt21UXI6F
         Cotw==
X-Forwarded-Encrypted: i=1; AJvYcCWpgUK1wPlxc6VdlgcHMVAKLXLOMsLZb9uvvVqq3sI7t4ygVkONWhju2Bvq4tJlVEawidGovCKVyIKgnAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbMd0/pfQzsYA/SFpUKCE0ohJR87YG8gPK0Cw7bIKQ2blTI9O3
	juf6eJcRxuNOsB1wDBU9cNrz1CgwpEeh76304l8a0BPQmpbS4pOxheqBnAOWJHRKV3hFG2D4YtP
	FG97S3+EnEf2jus7GSw==
X-Received: from wmc2.prod.google.com ([2002:a05:600c:6002:b0:483:43e2:3e67])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4710:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48526978dc0mr46728455e9.31.1772818354024;
 Fri, 06 Mar 2026 09:32:34 -0800 (PST)
Date: Fri, 6 Mar 2026 17:32:33 +0000
In-Reply-To: <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com> <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Message-ID: <aasPsbMEsX6iGUl8@google.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 11:34:10AM +0000, Alice Ryhl wrote:
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
>  	$(call if_changed_dep,bindgen)
>  
> +quiet_cmd_rust_helper = HELPER  $@
> +      cmd_rust_helper = \
> +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
> +		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
> +	+$(call if_changed_dep,rust_helper)

I think this needs:

$(obj)/helpers/helpers.bc: private part-of-builtin := y
$(obj)/helpers/helpers_module.bc: private part-of-module := y

at least it seems to make a difference for AutoFDO.

Alice
