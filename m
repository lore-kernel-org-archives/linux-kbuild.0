Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664338330B
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Jul 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784368508; cv=pass; b=sw9LJ2nhFLN1Wv31BQg/6Jj0SS+6/oanZnnqpMr7YFgDL8vondHd9n2NRjN5fstG3i1NVF6hI93AuBKG+9kyVrnl0EpiR6Z9yBPGbkE6yF0KFDsVtvb8zHW21jppwBHCnLVWh9t3/opvZ9qX9zUCpIR1sFT432JpJlsO55dJRYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784368508; c=relaxed/simple;
	bh=eqONqBvMO77C3YmaUL5PXOv+pUViSNK/eucq59LfoMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUyai9FhL4DDuqLrvdGiQ1Mm5aBiRRq9kl+m1sEJ2S7h/IFMVxAvhsWpZD5SS0oXf2pf1sXs5ySWzgqD2GXXHl4cBApGZLKdTQKKJxtfe+F2AFafVBue/HjviYrmWyy4GcJef+/PbZ8z6iGy9z6ojO2q7F1szaZ93S3QCqJCkwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzIxKAjP; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzIxKAjP"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso714374a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Jul 2026 02:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784368506; cv=none;
        d=google.com; s=arc-20260327;
        b=eWFOyDASKBWevKQE8RJQojFxtBxxfMdmUszs4kX0xD/dkxMGBMgl/m09jFFy9Syu8r
         M681ouiVqR5jck5a5MhXyoeXMN2RqvDMT04DQuNvIvsFqohkl62ELnmb6W7f7qVpa13A
         oTZjlxYcClTzRd2U/WeJgT2Bbhy5P5yloaYwZfenx0KlkEeySpkd+dEAV82pWdrlg5Pm
         AQii49M+oQYugQO+hQslTVW5Tj4g0930PVscGdByyje8h0064mX32GXYbJC9E3djUZVi
         5wYg0QV+q1dTP5pMdSBJ9eS//6nzH5BYZ2xrWJWm50IqQv/U3FswlTRCm6ngwpARHHNb
         cvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eqONqBvMO77C3YmaUL5PXOv+pUViSNK/eucq59LfoMU=;
        fh=R3oYFZtu2t/JdrzSsFrafisIGLV0lDXG49NYsSzpgro=;
        b=Amk+g01gMYJX10AbArErfyEIMoUDYd+vPEa6h7zHXyX0nUJBy3diL0M4uSztbDNG6m
         DDr4ZlW5KotRJRADaGOnfCrB5yhXP9euQKuDPFgIi38EfuVAVTmVgF39+ydl/W8eQIJ8
         tYjdpnNxjdj/Nkig+H4Na5KNfipxZ8dwQDnfiq7LhqiFKZrG46vE/eUG+XijvijE1mDf
         3MUlyjAbygzbsa6J3Z9z2R6AR15cvEPnywRZcH8WuMZvAyNXgINVzLog2APVXQY/puhm
         MMTu49W6Cqnbsm5s29kpnUitOf2C81OI4ueXVDqTytNMLT2NC69DyisBYuEt6q6o7kQ8
         Kfew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784368506; x=1784973306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eqONqBvMO77C3YmaUL5PXOv+pUViSNK/eucq59LfoMU=;
        b=WzIxKAjPBIJDNCfDO9MmKnuNaDFWMdhtMPgaLLc9jS7EhieNGORPj1w/BXOk3Nflub
         Z6iK7SXdwzrjCLi//Hx1/8r1Z3HKoqcYddlWhGF4zbHsmCr6iRvt+aWExx271jRP//pf
         XYayUSpM8YQaZ64NlpTHFk835S5DXNYzu64b/so/hFqL2Je+XyXQuVT0YYInyuRW4ees
         f+2KNFSZoAvFtgZU3SQFdxLFbnp7niW10o8lnUsAraRlPJib8/XPYeDcfFfuPNHV48x4
         J7JX2wCyToIhqlPUjqsrTzPEfBDUupHFxlsHJ57tiYQSeZjZDng3Q3eJ/VbIt4/7s0HB
         AoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784368506; x=1784973306;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqONqBvMO77C3YmaUL5PXOv+pUViSNK/eucq59LfoMU=;
        b=XAr7uJWCyuzLBu3H+ju7CSRalDv1zJlslYGZxsvHr8oKvb7J5K53aQOCWbWfwY9/nS
         BoB9RSGXUpYZnHmhp/rZYbbJgTbl3FWxQ4WNSPf2mH0U9wr4r4xdW4nhgpQxhKLJKPJB
         2iT1PWeGbFy2Jtl+JCFdqBE77q+/027st02nYcDqJNvAnJqM6up/Y8naUdglb2RjDT9z
         MFW3+e8toQClehRK7QFXxR2V3c0QE4y9ptmqqBHWXn6qBgD7anS4FvUVIi03GY03sLuN
         6yU0WCxhaEAr/5DPpj4IdyyAbsGBjGx7YjuP87qAVJbl30fQgJ6hYAIeybhC5O7xsiQH
         ltBA==
X-Forwarded-Encrypted: i=1; AHgh+RqdZk+z1lW3TgshH4tD1Vmz7B7uaYfU2d0x5GU+xa2sTQD+iVUkUIXAD/ZBPw938OXkjtk2TL/eS56998Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Dvg6SLr/OJxCg9qSs5EcvCWyjRr4uGD+Xz2nL2eyczwWlheN
	DvgKbQWPIvX7tTHMSB67ECxB5kidCefeR2JQ9a0tXNPcA9iyG8h4OiwjOyxn3L77N1pakbu5rC0
	yVvRNbEI4PAGZYXx8ZaSAiojPO+QDWcg=
X-Gm-Gg: AfdE7cmqKDI8jRboBNX5dGxf1ctZyMURUPS6btWzZOTU1iViC8tlxv0AODZ3Lw7KyIq
	dRtoHFSFuSMLgCqKEj2XgNjfSzl6sCBLQMO15JAvUF46EqD//hsd/qLwkPMy5DMOn/8Kl5jFINq
	uJJoHzkJnCXbtk1pBkppIdBqOM/ceJiXJ/CCHijxvcLbKEBlXAhX94QQAxY6bh4O0YpEwKzTQoX
	ZmbFbPhzrwN1CY/Al+oIW87AWXImlh3ynj7okPE4gGjwGHWFK3zU3tKaokc6yQ8YcOQtHO3KidJ
	sNgbkpohv1jWmVuW3iYSMvrcAuaW/krt5de85fRdZK+60dES3dHORQ13jqeKz1vo6SznqvOdxQD
	CKw==
X-Received: by 2002:a17:90a:c107:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-38e4b4412ccmr5183154a91.2.1784368506072; Sat, 18 Jul 2026
 02:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718040146.294700-1-yuntao.wang@linux.dev>
In-Reply-To: <20260718040146.294700-1-yuntao.wang@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Jul 2026 11:54:53 +0200
X-Gm-Features: AUfX_myvvxIZJNS6V-Ut0r7IbJIr3GGRIWGzdWCC9n7AaynqRdbac_RIr6nfpbg
Message-ID: <CANiq72niAc2EgtJBhsYMp+6H0UtEt70ZOwGXh4O-p4Xk6sf7sw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: set the initial value of subdir-rustflags-y
To: Yuntao Wang <yuntao.wang@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 6:03=E2=80=AFAM Yuntao Wang <yuntao.wang@linux.dev>=
 wrote:
>
> Initialize subdir-rustflags-y to an empty value to prevent it from being
> inadvertently affected by an environment variable of the same name.
>
> Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>

Sounds good, thanks!

I guess we can take this via either Kbuild or Rust -- happy either way.

Cheers,
Miguel
