Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C58F496D36
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817455; cv=pass; b=P83fh5LDt6dV+Murf/FGiLdbIZa4t+x7YO0y8mL62IMhQCqabU6A/XvCRJteXLqxWOFPGgVjTqUuD/d/vdpte2xIP8ApRCzhIv9j0WODbE7st8mbFynIpqTjklhqE7a0xtnd66fHJobGsOMqA8F/+Hrms6Emoe/QchHVL58gKnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817455; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrJO2JywRsBTv+wutKXF4IcS4PlkBfT1YiF5CDWe/nzESSb7voK4bo1W013mmd6Oj9JdAIAcWuMkAP7EYRomK6vdnbRnnbg5KOxqSS+bmPTBPywzxO3CP2GU8dhG0hLWdJqXPPwDj3bhWCq5RRK6yiahLZ3npHKA1d/jsfNlkW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKw0COGX; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKw0COGX"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-141395927feso3522150c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817453; cv=none;
        d=google.com; s=arc-20260327;
        b=Fda8IwBK3dhGVKtPLuXUFs35WgyYXwbH3DvbXn+vfjvzkJw6luNnAf57VhxphQhW/Z
         S7dnEArTDrFEt7Ad0Y5Iv1H/574yKEDrNdFeHtp8Egp6+4huljz5d0bm/upFc5V0qj6j
         zg00lOuaJOFINk+teHnKhV2Ire0NMvV+LplBjRi/yOWRTRwHHZB6DZ3f7SYbUN31n39L
         VqR/fgHyg+lssllwAce6earkJznLtHy4kCsGK8gqGRtndeMs2tGCcC1xv64sy1jc74nT
         Db+T39Nv5zlKxZ/aFptYZfrkRA02vyIUNlnIdAwQNXuVrnCT14cwY9RJld+KYjoXMLYW
         ufdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=qw0Nk5gavqdw2BwvWF21x7ZHPhSLX+qBfohCOBjvbV8=;
        b=GUtIVbboNelcnqsauxtbEu3v4n8cqI/ndndpZS8h9AfCg7ILNpOQJCXRZShUXg3abB
         L64j6pPqsqC4Otbv/x2t8ab7xhf+RW4p06gxzkGQZz6OwpzTIZ5eYZ/58/4KvtPjlJiE
         SUSqnTD9M3aOqOQ8ShMlBBHoJHP2pkJtAOMLLHtVIAPAGW67DivqswxDu5uHm+r2PjiS
         iVArMs0ds2NlGCKmSL45fkhFcObhXi+Zkc/DZN5SpcO94TIOSIvW8PDaJDh+KrAPwtnx
         d44JmZxFMXRlbSk27IdbJlb+RwxLdi/ynwmILrKR2XfXCMMyiY9sOEzibvHjApH9ty75
         yS2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817452; x=1792422252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=HKw0COGX9Ot2fd1g2rSqSxW9WorjwKzFbnZBPRmuYheEoiNNqEeriMmw16r4lieTfb
         Sal9x/w7lL7N+4n1RjZM4lfzI1mTypDafCvVTrmlz9u5fztU64oxznlBDZk9t9H6+NPa
         jjDWxMeqWrT9i3wksytlwMPNdzo25VCkqTHq2xFzBLeHthnCG4jY0M2+rtTvCiK9T/KQ
         17+OOu4pmHQZa4qCYCiEwlFCQH5Oz5mdAOCUdi5RuvuQTigFNKygGiDIh3QMpyULNw3N
         JeKmUAOjn6qiEL+8h6CXLKoRJXjzdp3mqCzhPYnsSF4BcacUqlOUuftE31fqu+/WUOKT
         N3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817452; x=1792422252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=VmIuX3fERgT7WV3DdoNPRy1onifVMNFSt3ruBW9G/AaoU3JoLnMn38LaUCV9gB6GQv
         0Zes1oNP8lS0embUO8vaxEHEipn26DLO3CzODPdutMG/D9a+w5Rbgw3Dfq6sxpBz7Pg7
         W6UO/acuTtJ6srJ8dW8x633vgsbO48IYaZ2stc8qnbUqHQ16gqNE7gsKfCvEPefGpli/
         JgA/s7OFEZ+LcC2jfRsnHDlx+GAyAJXBwUaI9eA4bsclgdJVJeDsSlX+qD/Vzsq/qz1p
         BWHorjxQGdW56J+8ySeDpAda8paukiDC3Wv5/MgSphgVA3qM6VfnOXqb0t2DY6a9SUPx
         mPqA==
X-Forwarded-Encrypted: i=1; AKwUvBzUgkznPiStuKkbWt9osKD8VBGVSmb1LRcNk7JLKrUMPPEjOutEP4hLIwWZWLcvbLpyYb8vJSzammqVbtY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoonU40xwQ9T3Ozu9BRxOEETj52BUQ/FEWrunfBzAiR4pSgNJX
	fbxkcB6g8xNrNPEPOqnATbpo31I53+QYbsn15Mg5+nGtPqUarEhzyItDkEaRiNEgntZgssH5g4G
	L9JXeRP/GZ+lz24a60pnbVb6Ze2O5BxLirfeXdkzq
X-Gm-Gg: AYBFou1I+aOIhQXMWdV+nxyLwwmGhUDyv9MASrkvZYMnyrvkbUmMGS20IZOTth8Sfpv
	Czc41U31bJDZpkr5LMo4Fkjv9hVVmbEKxM/YHY2GzvSKXBUVBkqRRErtlJ2YfbPo1/aRlHndkrm
	sxFMaSzjqW/g7bLNRNR3cdbArZHlggPmTRL7E3Ucc09+RiAoPkZqPouh3Dmy6BFzpLD2CzruAQw
	C68Qs3i3516UouGXnzyuPTyojv2BcLYho86FybFukv6+DneSI3ltSjSAo5XfP+iyTyyARg0Nl2Q
	YZtFH3E9ET4hhYsBoEBUTb3bebkvtzhuWiAXNpoM8yk1JyemQYn+kIJFl1oacEhcINS0YVbEwQm
	w/NTjeHsoeQ==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
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

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs
