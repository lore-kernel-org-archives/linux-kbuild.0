Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6903937B018
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707920; cv=none; b=H5pK8sOEUyDnT99wAyhvVfsyplVtVYy3g+Tw9DrJQM0MWTLEJ0/j8sXvDFAxnvr0rxS09iGvoe7AzV2JOs7KIlYjX5wxGYfZAy27p5jeVbsNNSmS8XevuUlV+DgtMZ6Ds67yPbjxnOVA2gUgyiR/llmjCFls136vrNXfE/NV0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707920; c=relaxed/simple;
	bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdyq++jO1xJ5cnTy22Ptfe34OU8RKtACBkRYI0z6qptuVnY6amQ8qUNsDbUAKP4vO9iyF+hcemP/QmgBfYHo2JnXFw55JPCdkWnSXSSmHA5XkBTavOwa0ASt6nZmiYMnZetoSD5wgHlfWfL7HQ3mqbnaaSe8yPDW/cAnr3nQ23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCKbRVmP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCKbRVmP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836b7c302fso80530775e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 02:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772707918; x=1773312718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=gCKbRVmPQJUQsCwGNNf+wn+JtMZnx5jEiMbfOmtImosRGBdtp+670FuqDi0rAwAaSD
         Xr575kpJe+K1Dv4YxniU4cdqXarKXL+ZKl4zNg79U/W6kNLekXwMMuAC/IY8CrGEq4aF
         r9UzaB6QXJcShgk42gSSvXNLSBB92qqHkDegEVfaF26I+ockWO6goiuneqhOGVV7UYXx
         MfjWCXByJI17nYKNG4/sJLIxgXoi33Lxk7C22+lWNQNL5v+Sk/x2TT7gYywA8d8GgAyS
         SfQtE5bQ9wQqgRCZtbT5HChpg8r8MnJ1+hYEoCjq4ll5LqoFMCOtVe7UdsCJ8c4TBlsl
         48MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707918; x=1773312718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=f640IfCsswdxGvnvtR9sthBSpKtwzT+JAtV3GMI8Ix3EZQLG2Df8Hn/8HoTvhG2Ucy
         H7L1ANRlevSQRdrHq1z+Mszm1Snh3eHvy27Xp2ldVTd4Ji6oJxVCqUxxQbvDJ9ybuxKs
         o2Ek5ZSYvEXgZ0iEPV0+EhKK/I5PnYVp5wXyXlNFCG9nxXPh+kzQQKNBPjsoirmEzs7n
         lpciUGeVenJz2vBwCecdKXlS4QmdpJnC609t7137cZNfKYYTAG/pRk6S5hEDSZXWo/96
         /Lt7Tud7FRkofPxF4eD80jC/fGHXJcTkhcPMC5Szdl2PMdH4O3nF2Pl7ad7MWYvQ9wGk
         e/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUCmb+sXZB3xDqjIrTWDFo0+OWeKo9fDJfBCIh3dTh7ExJiVbT44cgNXcsJ7gmY/cd/7jFvDG8ogigW92o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL1tfJDVrAo3JB2iNtCJ7ux8n9cmS7lfQ079T0yBNJxxxBkbwe
	RHIscsyVjAdsFFhJkgoutrJo5SKXhDNxyS1hV7E0XEtyTl6oZtgEWFZMLZSUslzHE8LMQqlG7rQ
	NHTiWaWvQyRNZRsctPg==
X-Received: from wmpb29.prod.google.com ([2002:a05:600c:4a9d:b0:480:4be7:3f3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8a:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4851989fc75mr80019835e9.25.1772707917693;
 Thu, 05 Mar 2026 02:51:57 -0800 (PST)
Date: Thu, 5 Mar 2026 10:51:33 +0000
In-Reply-To: <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com> <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Message-ID: <aalgNO1gRJdrWm4p@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Thu, Mar 05, 2026 at 11:12:59AM +0100, Nicolas Schier wrote:
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Tested-by: Nicolas Schier <nsc@kernel.org>

Thanks!
