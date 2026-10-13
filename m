Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2880417BD2
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887543; cv=pass; b=D6p6tkP5Im0c4bD3qPvoee1FZP5DJkTUikz8bojMTG9d7tET9a4RbWfJWYh31BwPVzVK3VygcBc0mZ9bqC7gcWVzalpdxNNdkgTGvMNO7x+XKnoolw1gCdznM4J1Psb8wxSGeXyw51Ev9yEEeJwNkKbhUFdYqjMwt0bGLOK6X+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887543; c=relaxed/simple;
	bh=IAfkKA0U+QL1NU6vVqFogpbTbIovJwScmPrSbAdsIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFikFp3gGAXvQmvdxOOI60BnDxx7yeKhyvEtRivJi0MQoXGn3l/tVZA2Fa59NiI+dZtOY/kOLAqLcEPhbwx1K4YrOJ++N1hpIKotphmfHKqKLFTdm8Vu9yIaeTUZHDewBuTD9rXMq9sPaGgYsV3LAQei0PrPLvb0N/VujohOM/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/tLEpBd; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/tLEpBd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33c10faf6easo276988eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 03:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887540; cv=none;
        d=google.com; s=arc-20260327;
        b=VEer8wxslNP1YfBiGRzoKAIThMyWXbzHI75QR494btSJD/i+1hR1Lluxxt4PRlmhS8
         VgC/FXbnhRrzb9ggcDpojZh1VRuYf55f1ziBkfQJH8KkYbDMu+Zzee9Vm76sB+WvnxT0
         28jCtT4ZnyeNZ5GxsBVBP8PLU/lBtkA38KbYC0KX2nShnmZv7vcuNR7ZDj/a4zeNKgmB
         0jHRKc9Deo8U2tiQE/jff1fyIEVVLKQQZ8SaNrUAYXoyPJ/2UtKZrKHHQ3wN0r2vbL8q
         tkpNa0F4VCy5LFAoqRmm3r4xIof9IX+A+WyotP0ZfUl1zs2UGxvbjLu9ZD6V7Ul5RbXT
         sKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        fh=p4Kp6Th0jbG93xG0Dsng2Iat+o24c6McKFH2ABcNZsw=;
        b=lfjoMGr3wrcSDfupJZzSbdHomkRNi8iXDEGQtbioc5lUcLPcG35hJjbtDCInv01SCT
         OAEaBAG0FyMOGSOW2k6swYxI1DxiPkRmoLRSX0pKLU7amtr4QOPP6RAdNbWO0/Il+7Lp
         HD/I0AQgtQP4KEYNQn0IVKrFgC6lmNHd3EEoWQH6V70Gd1+kzM2t2ib2yiDW8Pylhkj7
         Vah+dPgcwVinJeqTbH+4ee8vHgCjzK5JtrWJ2sUyexkvWXJFeJY2Y5V2mMBzsvc6xWq/
         abvqHket+Haf/z2oBqE5mnoPeIqzdlVRJVYZfC+7/QCrgUSZdsYoAxCCb5/PSiMGPXtD
         VjIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887540; x=1792492340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=Y/tLEpBdP24lKTF7jvb/dKv6TxqZVNFs2Pj2CuqXfO5HRD5Aw3vsmFxQcyBhBQqIYR
         6VD893zgvpKQyC6jITbu+iO/lTmW2wNinSIm3iwrbo9Bzh+Jy7pf8SLCtAkmC8UO/2rj
         1WfajpWd1PMk08oyfSh/2BRM1CLPz9VY8hyxJi+v/GzeH1q4XQ81JbnU4WwZwMMC8IvA
         s5799Wvbj8ILnxG54laGxLd7PtbjP+1QgTjRr1yMdxJAVLbyKa9Lp95VhByaHTuAZSOV
         pYSN3xFzmqHDUpvJx4c84viFlMPH8qAK71b7LVrKoNeyNqe03FpwDiPelUrxVEvFuBRQ
         jG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887540; x=1792492340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=ks9Dla7ULj4uqUdtptH2KeItzYvg9ALXbu/CPxoclblSxWS2tdBX89SLbmO5pX0UPU
         QP6ETYsqaHaqRp9ZHUUuICrpsmWyJSlRGH3wD65Dmy3RYMPwGR1oz6S8noVpcNYu2sa0
         H5vV3XtT5pmgWHVOP14ks5RSJ8tpPEuWDXNP40WWVIxSSMsC3LCVs7KCHuZq0GK4xvex
         vo9bzALHIMnh4wX1YLlUCc+zBNsU9Npn4mBu3HKKiz+36mzJ50v6e5vytEZ+fctiA/F6
         tpNTYT84fI9zl5Jb5g8mPGv/CrkhN/h8H+JhPHICZFtuTtGf7Ol1xXwtzPq0hOLNRjPW
         he5g==
X-Forwarded-Encrypted: i=1; AKwUvBxJpOHHKB5X00RBItqhV6WuKQUIeaWte68bR0otD5nOG5hWc1/jtARtADkFqNQcRSONDwhZICU2dWhv7U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfHvQsgWnK544RLyKEpM3NxLroMcgqwE6703WZfef01snhCoNm
	hpA77zwoVhVFvLEWiI9VFCU1d7plVemvfflzgQtLfzv2IvBIL8lmZHVSXckuFy+2cz0Tx0sIehy
	DzihYlNrdraba4ACembpjH+VABcKVygU=
X-Gm-Gg: AYBFou1jWMQsxnVWfKVTxbfLJQl4wAb+kvyUKlJadyMNUj827AVSAb+YlPD6YpJTdpo
	Lwiyz7wvv/Wma8CAiw/QOZKMwjTPgD/JvfG330KYJ3Sz3w2F88m3WYQfnnkWE8hz6FcNytGSob8
	IQxHgIUf9sFXx4BAWyr/ZyTPoYGcQrzDmHu6IPtvoDGuKkVr5tiP8fftVNE92/P1VxlYA/IuEqd
	8pbuitXBYTR7XCLqLxIP1udDgHx//kaQBVMhx2ZcmsYdqZlPE21HsaP2AUvORhsI9XdoBceCZRS
	CYZvyarDUJRsbxosG7C2/27T/rwQVGRo2ACCdKKmONB3/dAj6xFaSXJ4r9tUPZSyjixCvX4wSzo
	TQv8kMbbRklfStzU4hg83v1Xm5sVCkMNA+aI2dpyr5OGlO5Qq31OAXqPbHqpmMo9pyPq78aQetw
	IO88y26e7e+nZYgAQ2SmcMu5zHR/wMpqgKjTeu7XAlG2qVzVvSQCrybkChS1dhYA==
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr25702764eec.0.1791887539654; Tue, 13 Oct 2026
 03:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com> <as4DdRqFKxuJNDnS@elver.google.com>
In-Reply-To: <as4DdRqFKxuJNDnS@elver.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 12:32:07 +0200
X-Gm-Features: AclHuK-e9pojF-4-sUhcctzSu2Lj9dg88Qjibnm7E2u4bDLqEx7YvHBlJNvxTnE
Message-ID: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Looks like it, and we need this patch to use system_dfl_wq:
>
>
> From: Marco Elver <elver@google.com>
> Date: Tue, 13 Oct 2026 10:05:52 +0000
> Subject: [PATCH] rust: workqueue: add system_dfl()
>
> The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> system_{unbound}_wq is used")).
>
> Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  rust/kernel/workqueue.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..e46d3acf903d 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>
> +/// Returns the system default work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}
> +
>  /// Returns the system freezable work queue (`system_freezable_wq`).
>  ///
>  /// It is equivalent to the one returned by [`system`] except that it's =
freezable.
> --
> 2.56.0.385.gd3acb90ef8-goog

This is:

  https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@kern=
el.org/

i.e. we have had a warning like that in one of our current tests for a
while, it would be nice to clean it up:

    workqueue: work func
    _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtNtN=
tBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
    enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Cc'ing workqueue: Tejun and Lai.

Cheers,
Miguel
