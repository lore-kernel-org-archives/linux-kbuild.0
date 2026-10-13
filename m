Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F413AFCE6
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=HaBXVS0NPwiS0QlVKdcBRnOqs5jPa+htJ/28x/MB7Y7baGwlr7DJSPravR5N6YUlLEgT1sExE8dP8pbyUM4nB9Mfcy0SJLa5KM5Yj0UywJFo0shaNBk3rb8toM2PT/16gY6amWUKhHBN4XiXH4XkZ02a4rt67anRjJTeuuSmG8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUe1p8Js; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUe1p8Js"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4222231eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=Amdh/mzTmsVbrL4I5YavpBMi+pwTGY5BjooHRH6ZXVj5sd6A66r6pF8jgMGliW4yyX
         6SiD7lPJ9B9y57GsFCtB9vwMC/8WqvMRMkfP5J0hFSdOwNSRrNdBEKm3hGCDlVCCGXXr
         SJ8LqS+3JiRaMTbPsYexb9mZsZWNFbAPWg0POtzmINOgcR911qrtIN1lgsCRDMh3O2/2
         pofq+gacMJMx0FGEednWierMYxkWZwHJn/DEueazrS7L9sriwOOcM1MQljzNsuLBfK5+
         ctS4WlnJB/ViV9kRqL9gmzpFDz45to0zSxU3ZvAfLJqqubf0DZZ0shDalJEI/5iO8/1P
         YBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=eF6p7IOM/7tJgj82K398vO3HgtsceGkOgt3V/RTFEjg=;
        b=Hz3pIyqaDN0vp/ss78oXULWAMP1ne675HCXwv4c2Rsznmde+fjMQSu37SCrFWge4O2
         lg++Pr9bZr/7aXpqFqRvbl/FgyIe6+K4/ze2eH/Qv/8z6C+u8enJL/1NZUmy4qfpiT/y
         XItoO81cTASrCtijLHyXNwkPVWlz7S2zonLjaXfDJ1JQA1kRnyB3iEAFoApOeyNqFQkn
         f0KpUCXMGrZ5fsdJ0IXMRG7hlJHT0gGp1WEbjmvUaMfiS8m+l3TLDDCw7m0lhqkEm9ls
         GrYpeHAOugHuUOkZQxpM7XSVpVl9g+GyR5VsCQhALzqXwUwoiCGAJUjZh3aQMtn5HHqd
         ZRBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=OUe1p8JsbeOEmdidmgAwZjuQYWObCln0UY6mN2eUEQlLo8RQwV3Wez4R6Toconn+2u
         SwPGP8b+GpqrAeyfYZLM692dVCl8k5vn4xCfNuGKRAfvfdLW4KGBVya1t4RWLKH6ELWD
         9A6WuTcdLUTdhNf/MuIce3PoimcZODZ0HtnvYu+7q5io1IQl6ksS99sdaHam2o+3ZYqL
         niW9YVjN+cw91gOGKi1XQJ3scIcybviJt/gxM/9I12iEZMz/64ksZfQ8QV7Zh7qg+gew
         8cSgZD1M0cXsfyOnBJpvjsn9WE/cAIIzU57mjE7HVw0PwvaLRqH0Jo+eujidbn8w+Y/Z
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=oQS50Ff6jir72YprEsQGVLBE7J8MBLKHg02P9HM2O90mDGBQC7P9d2yrqop/1GA07U
         fP1CiUbyTkUPng47LaIoPIXLyDbZBlzp6JXfz7gowFogivUXcp+DcYFJpO5lMlo3/Q2V
         4UIwj+tsXJ5SB0Pwe7aVhlB9TvcTcz0mWEJ8HR9ehB++Gx4Gmh6//n7bC3pEHPfGDjHU
         BXUiJ57d3CWPbLl83u4zwbfqOAYKfi++Hl5t/pH+tXJlzAfxTTM1wHbe0E4Z1x/h9d9R
         nFWuXsYY9T+Ucm6zTeznU5VOe8J0b4GPTaUa4e9QBdpBCZlZvx7/GywjQQ2cZuigIU2L
         WETQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyNlKZs7eg9LWRBLphiIZHlTJMJwZcZYs4MT1/oiw48MD/afLSUru+iJVZYsCZz/rzmIOAhvSt95likfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1sbRWp5bMTMMrd7edA1MQSs/EZxiwxto6E7nAPuEbDaZ53cgx
	+E1fpjilLMLezOtRAMxtwd7Fn42hP6HgKyMjKPpCRUJQvjR5mXnxUD0tS22a/qpVFfyb+uAwQeG
	bEoc+HVppWDhT4K96e9tndscFRrHrWHt/WpENk+uS
X-Gm-Gg: AYBFou1bU96DhAIv0GJ0nvZGMYtrD9RtFO4rfc7TxEBOwQe+lbaoMalhlR8LG05Y3Y+
	buifcmSKwoWMcQSLsdnkHdPXHzrM//spTEdZ7v8EcFilL8+4sJsOWM5QaWpKz+BlE+pn1j0T5Oi
	LeEpPQupCJXf0wBaK8/5YWVf5SZYr/NFSWbeWu6I8FadiIoN10s5QnsQ6JZohzJdVlHldLhkRwm
	hwALvean46z8Z0mii98/OAWjdnzCcfp9QZ6M4yG59Ozx0Xt56sHbv3+Qyk3i0jR1xh7bf99x9nw
	S1h5N6sAd/6YawkGAdYFZ/ih7937zpKC2EruwgmI5yRtcqbhA/OQCij4hG4e2q88Jj2YTFMAMG5
	9W48LKRo3Hg==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.
