Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=3EQspypdUVqI9jI3itZHess/bAwNu4hM93MUOBCH2s8IjIMwvIakbwuCkswRoFiVPtkQ
	 qyDo1O5yP3gy6OvqtxG8qOCKP3QDa23fvedyT0PaM2BE/04kQAKZwo9JoB1B264QXncg8
	 /VV3AXU+s/fp2oqu5L6KQzLFckrm8mcPLLqF1m/DXR3m6lW4EMGUnTpENF0s25cXAvwDv
	 8n8wZ0PJq15AzUYh/KOmesg6yHYKr1g4judUfm8Ab7S6BCoG0ITU2tTd6w8WApZYxMb3h
	 nH57TvcgRf3E0C2uHX1vx1xrl5i9XJ50kVyG3joPIIYzD4+3ZJtXz8Xx7dIPHmjtXcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=kt2sZHUH4x61GN6qHScvl4fXq9z/KtPB6Ux7CY4XKa2ureAEqwbr4sp5MUn3RnvkxKKl
	 ErsKaLRmBJiIcU8yT6fb0SQ2UpKWDcYJMYLtgEs6Amimvo2fzicy0bOZKWbcFrMlVWF++
	 N15YYgCIrNkY7OEtzQD2HcQOcZD9x5+NjBH789Qs5s0Li/GTzDwcmteQiUwZFGDLHv5OV
	 jG7TPjyUffteEsq46qHzoKUxvBSRYU0hWiGZspV/QF9CBmsOWeSnqbfrApfcb50mfypKX
	 lE32zNSbzEgB8yaaKmkPaiyfWkIvrDRVVMWErVsolVNFcUskI1h4yvCURpzWUr3rRNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A778606A328
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A778606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36661f953e4so604871eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=FaHt29oGqwTFofzT4UdYqptMFGiBf0CsYc35pWSfl48964XSRLV3KC5/yxyl0kPJZX
         qI/jDbOS+4Be7TwOQWGpq7EgLlNL5iUVybZsp2JZKaIdUOSG6pbbf8kwSAph4zmAkvyZ
         zDbun2IaEDVjOGlW9cHlMHzHaGuGanpU7UN5kupEJm3JCcmOou4h8nZKG4I8BSUGHeMZ
         JTpvX6ujunyw+5Uw54s7wzbIke0khyE7HjGV1Fx/D56Nxs+ESntHhoxVBdVZUJxFhcQw
         MIMceG7U4tP9D3b5gLCbyKI6hCfGLYLAMnU8DrdtPDLsQ5yh4ClHTDbYE1/525ob2BRb
         EnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=BRCwLmfVCzODRwjjUSjEiiLb54mRzllzdV8M+f7jisk=;
        b=mQPU/RXGUfLcw+H9FzpNtmz9LqYVnFluwqKk7fHITi6bQ8LCTPAhMakL4lzh9Qupvh
         x3oDgc0ZEAHeLIldce2Irk7hbVuOU+GcEIywUyMrCvY1HW3stS59cPdjl+2YB6Z1wApy
         9PXUEKjqdB1aNiZ6UP0neRzHPokhHPaxHDlYMn0WfVXfMFv0oDXE56kPIgCs71avgiSN
         3SkWUeZV6/bdV9orY9TupJdHRLLVm3rNSNfsGmug5TzrxPZ5qR2ZmnWngmM4KJUWJOa1
         Uux6CVZYqa/WM/+EIBacInXnhaCmOdhy/7NRzO+f6HjXgGTkxiNQYbfFFJPw/Jti08vw
         Cmcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=cI4IJybIWAFbUhFgiqBGwhfqjgpLGre5R3ot79Ke3zI83Rv8hsE7zK5rQQywe4d1ep
         r23usjXDN6ONg5MR+VjsdgsKNHxDDg0RrsGtvGgLLY7pBHRzQC8h3/H7kxTnExzE6Qmo
         QpZbMR5D5TDURKfX9iAKFDKoEOuHC/IePb6qiP33yxaGOZL4qmuyU3HaaGQSjnc/0vAN
         VhzGtkVCEK9aZxDzOsE877SK4MI9vgdKQQaC/5Oj8b/f1ETaawk5swZ6s8fSIdJzKSFn
         lbaG7dr3LzHW2i+qbB5nZmgclId/Y+2MInJaqBdwT014/GtR7t3ednJvS8omieNK8REW
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=NF6vcb6MssJ9qqo98MIKztLE39BdApzP/rYE7+1pTLWlgRIcPVc4WccbbUp0MBbbR6
         d9tzexROmsaO0fzYwUKpQ2aqwwkgl31+T7MOpEawQLM6A75iRXqcPmPYm3LIASdlwGSk
         eQlwYYb92vycW4Z+uQbaYcHsFqNMZiN159z4r44kz23TfwlBomyj9PJ09ZKMGHPNjvMg
         +2Y0Ezoeq9Egc4SH0gd8L734lH2mf76ENUnKLRjHFHJiy9fQY6cVpROJri1blT2ZGaU6
         AYmB8K+AqfT6oQgVUtsCdGMmBlQ43X1+ZulWPMFMHwfZC553OIqht1Sm1UALlJw4pvVQ
         r1DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUWA9LNjlM6SghcGojqpGZSp2PvaUu2Ri2Ed7/cDwaGD/6lyep8ap5umh7dWke3cFBFJOHVTtDbnOQVGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOZuSrCMdpTl/HTmH+Em/15tSLYocfgEaBkNhuVH7/bR5DHTpN
	tnHXcGU3ao6ZYkgHr7Zm65F3IgN14nPicjoOfUBrqnWU+gNLfgeKpfThbM7qs3nyxH4Y84P8x0V
	lLTY+iDzsJ/rpkUvyP6bdaFte/XosqzHpoxp0v396
X-Gm-Gg: AYBFou2IgNGJWIXxcsrUHilhy63TWR0gjMRC0BpqU0rWjrp6lzhQtM82ll57VQjyw+R
	Pve5M9Yi1rKKUNr4s1CGe6ArKGbMkol1+x298gYW4PY/sT777l1S6PzMVZZ8F64ecguTbJkZiVA
	wE2XZ1uKv01I+JgQaGoEUFLilPw25yLWOaUQHQvjVxKSJyz+KGnvGisN6oNAYwLvwuWIiZjK9zg
	SwK2fHbhlf+A/nfEJPtpHnuHcS4yNMZBUm95PYEJ0uhfkEDM6mwUPJNP5b8SV/t46/lAIcxigD4
	vjdSlVcuF3jKuXHaeTFQZxzzcf4NIETio37cx/4MqOQzs7qg25EIljbCqnH06yKrbexFJhSTPQw
	cEDyHvwiiAHak0HBv2kEYEw==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco
