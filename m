Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2C13FBB55
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780422766; cv=pass; b=Y4tIQx9OapU2vOy8EWz3QbFb3I+qpQQEbcIpDDVdWM0VvCv3n50R+Uz/zyKQA5e9z0Ox64ITJ4nQzXul00sE9WCxwdWWiCCTMEy1wIK6ILDlX8IW03xvJDzf6RdVQxLbR1b5Rf/cq8Nbm2AzDTBv90xCEQDxIt0w42BDpwCeypQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780422766; c=relaxed/simple;
	bh=CSjbsG1fL/PgbsG1N0Mtjl/zPUSdMXGU2WzSOKo2J7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNs+MSXkVEesddysB6H7UVM3d+kk8GrZfRcCVO5IG2OcIROgb66WN5x4rlrNz/nygDmJCkiXtKyxlJr/AOzu2vR43IqW62ylr8VvuH6n52RCygjZPtJx6QNSKn0U5L/NLYcq247cAcrG+qI7/G+uI3sQe8SrCJPxKGtXslULTgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Ls5Fbo; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Ls5Fbo"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304e86ecebfso451946eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 10:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780422765; cv=none;
        d=google.com; s=arc-20240605;
        b=cSqFI76NEPR3xrisNAtqiTT81B/uSe7VdNaSjz9Zw+V5xkPrtKIYhcVACwybsAfts1
         6vjtjv2+Tc6mxttvvJqhPC7NY9mthbYpXd+CalrqXccvNuME8IXt2RO5R/MUp7SuLHFZ
         YwWX5mp2S+EUYE9YO4JWJ+lgHn1/BaHa50LI8qiT9WmlrAT9XZv+0+K+MtagYgUESjP9
         IsH3h6YENZI3m4kmrAoi90EVXE7VFqt7LNVUGq01yM8aqsI6SzNJPNFGgzEuqrCXAOA/
         D2u/ys1A48dNExQymSx38BHKct6fEhiJcZuFkoJgEVsBxF/olXdTSa/QR2SlsokYrDi1
         I+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        fh=o8YGEqmoT6FzL56Iuge8Cr0in/ZJ4Vjnv1bQVVq2FAw=;
        b=kKjECnZmpWCoQvIOP4cCdHCryqlLVQaLYHNnmtlaSz0dZ8v/bjhlomX41tKtJuPFur
         naTOdhmeHZcxB2GQi0cJcJ68LPVeN+XHOfbgLLYJUoVTBerG1AiyhNQDPmC0+h45Xn+g
         QE6q7L7JxRZyYZ5ytT/EjhxtJGBFvca37/6+YXRB5yX3CR9etQckLVjzzOdGSIZrmdTJ
         FLPpeIySzJT9OyZ8QxgbIw6rKN1SWX/9KqNqNPL8K9p6lEcUDgLGR1MFNSlYl6dl0k7j
         l1iq44J08UUowxzyNbUxylFgoUf6hayQNFxj5rQ5KOtMOperrnmQoputJrutDfEHKpwf
         JtGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780422765; x=1781027565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        b=D7Ls5Fbo1sjkCE8xCNBaobRcIAtQFkmJWJEhRt/h0zMKuSl33fnr7J7GloFATmEZOA
         kauJsEvIK4mz2G+XEbtFbQJSfLwX2gcdJvBFprqDjtJkPmXY8b9lmUP1mvxoCS3lioOz
         PWlqZnfpC8NapLe1OyOYdcYvMvcc431uTswK4sXsIUyacvlUpiYJoLtpZNuFHA1JGJYK
         vvJRt+06cKHWg3CalVkE/VfBrTIyocqbwxM6jqMLCrxwBJbrt6h0BJXD7uLON7PsyhLM
         zKv07JdHQJX66qYvk4MwK5oCfIhaVK+9rMiHsoEpCWizY6UzrZfsmY3hj3B/+OHZD2S1
         /+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780422765; x=1781027565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlN2MYt/Xq58i+3PbQ5jhol0T2l5a8oP24lTOtS8Zn8=;
        b=Ehg7TBjO9Gxh+QwRaBe9AfZyIM49ZwlfYJFZZvSCg1sFqlyZRORmwHmXuLeHnj1iPj
         MEoL/5FWqEXOZK/JK9TT6INEJ7JpykG4VogYtMWFCHEp0YCzR4scxTU1Z5HY8SctIefK
         ds5JHK/M32KJn+iXGuNqwSwFulxQiE0ScDDTH+JM6n9fBuENxijG2Xar7HmIo578JCZF
         ov/SbZOQoJH0j9qcLIZaYNhMibBLrHAt7xBeZaUj3QpBunFyquLiE2YQFaa+YjG0AITw
         Eeu3HHlpNmKMbr5I6eIadq83dkKGd0EXpJv7e1l5zpeRIAzo/vYyeJmESsCxuvJDvrO/
         7u9A==
X-Forwarded-Encrypted: i=1; AFNElJ8w0MY0q6W5JfP7x7iU3qp2+1lHaPKLMHdByyjdxWe5OC+cdJ52NUVTpctvM5x8eDE6SEP4TQM5Hnihn2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Er8UdQFDPVAOjMziOgkvMfS9h6O+SXnwmWAUIE5Cd4zQz0d9
	/8DW5C3myMowznLowN2o+3XKZRwoIb/5pyXrSVbNkdv2vcwxfqDJmPgDi2rZEQh0xUi1B9EMgfB
	R/kLfLRcUcBsxoCkSOzasu5tm4SY0iJg=
X-Gm-Gg: Acq92OFIj654hn/1Cvbxe9yQZhEpasAXpdKHIOuAxRkyTxlRk5goG9QxRahfg29guQ1
	WZCljG27fl0yRaJWo9LMa+shMCFKhy/NIGBbIvjiiPBgvEzfZZ+JFRMBH1p0pGtHWm4Z9YUe7HY
	Eang8leyua37WAjc9cwr8uUQufolwnBj17SHCGY6OoBpu0sw3VX6p8yJpqtvs8fxvYZAu1YIsbD
	+wJxrCROQMn9nOjRoreKwdOmaOWquKNIrSqz1rNKhyAM5PVmRe8t8fMQeykMITJoFZPVT8Bzo06
	8UGriI/ke04818QJ558E3F5xQmyqzqHgO58EAUDBzFf7myxM6RA32xF7LLtVuj0bbBTq3OvKW93
	u73puOLeMX5Wzweu4OphpJ3n+6nLuFQaXm/WhN9BuZHK3
X-Received: by 2002:a05:693c:2d83:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-3073604172cmr1269109eec.6.1780422764866; Tue, 02 Jun 2026
 10:52:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
 <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m-Gt3qiBRMq7HiMDjRVHmyL7wrsm+3JHOoPFC2Lz2BDQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:52:29 +0200
X-Gm-Features: AVHnY4IAHuSd4UweE0a1If4wlViuevvCPjqmPviNlQB9eP7vMw3AbUe9EB3DRbY
Message-ID: <CANiq72=+f_139RtP37FSHkZ+9wuATgf-9KzvSUfwqO949iqT5w@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:47=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This can be
>
> crate_env =3D {
>   "RUST_MODFILE": "This is only for rust-analyzer",
>   **crates_envs.get(display_name, {}),
> }

Sounds good.

> Acked-by: Tamir Duberstein <tamird@kernel.org>
>
> Did you want to take this through rust or did you want me to pick it?

It is cleaner to carry it with the series (I will likely create a
merge commit for the patch series anyway, since it is a major one in
volume at least).

Unless you need it through `rust-analyzer-next` for some reason, of
course (but still it should land in the same cycle; otherwise, it
would be broken for folks later on).

Thanks for the quick reply!

Cheers,
Miguel
