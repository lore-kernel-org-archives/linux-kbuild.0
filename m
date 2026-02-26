Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ACA389477
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772080573; cv=pass; b=SyggUbk72Vz/Jv2cNzeJl2FV4a6br7O+59eyESgCVpYfl8mmgiVnS+DyIfEXs8pVVDWhaVGDdnB6tXTYxawSScSjtmu6sZ996RsHRYpYC4yRFy4SQxdNjxppWwtnh/6DMB4G6wgmJFsT+cn+SbAyLlfbhzSoiGoPvL+fhfRsURE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772080573; c=relaxed/simple;
	bh=yQ56y6Fx2X+yAbYgVikepnfFcZ+Sxypi1uShKXPHDHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGZLmXXVQdZ6rTjTjVb2Xl5WJNApRrEUiaIe9LyZrx3CIeZMts8m/a7FMXa7q12mRaf1tIZey4A1RuZ8h8QMw2jPNcb/VXnAkXUt72t5zfSip+cJsy4q4IY9KKtlEY0Y7QbvfefAKYSY92+t0BvJrXn+bDgEcaKfpyGD4xFh67k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHvktDmg; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHvktDmg"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79427f739b0so3626767b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 20:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772080571; cv=none;
        d=google.com; s=arc-20240605;
        b=bsoEbC/A9gmmbVpKXDG6MlEUIB0nwWnTguvOto6m3Ct4vKPm5owbNf02+9pGfL8E8X
         RIB5cnbI7ngSRteQHtviMAhFYU0S/WIMDRkyih/dKO2T62lTFzlIm4RayXss1NdtRDLe
         3wbovpcG+zPebZOQ0sAQxP3zL6WuI1hkOGps9H8N3/k+XUOydfCutW3guvqvQiUiXjNc
         G84VrvZSAQydZ22M4fKdRpE2scpxarsvBBF3gicE/yQgtlEg7ZMzVUcZe30CW0Np345j
         7rNrDIRbFViQWf7ZRQ02jNifNS08DVfKqfQyoOJDMQzI4wwGj7Ofu3aIxPC/R8KlCqn+
         a6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        fh=tMSj9VxEfCafsodiuTTTXNt9z3wNvdi4FiVfMn//IYA=;
        b=CZNtJiiNc8mZT8Pdzlymuy0auqINHm5uGuRVtB5NOM6ag+8QcNK1GdWWk3p1XrNEgO
         JsInnBUXHP8IcIJfqsPjvBLXxilqZOq6XQNBl0hw3CT8ZJcrkk1+/ABwJ+r5sbdvGDuY
         eRanTKKRxJ/3hL2p/xfJ1uoGj5Iif9ozwQRN20sQG5PU0s81o6qugRy+QK5D0NGFtyWI
         vWe3x71UNhZQaBvwkTxPMMJCkCkBElG/h0/xZ2MkHyiG0MfJZ16RTd1te6SsNwwi1eLh
         T/9llDwb1wVBS2yMsVucSZSPEWFFKs5l3bSKaBljVVVLl7MlhR0Vk3iAy4oK4RAzkgik
         qXuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772080571; x=1772685371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        b=AHvktDmgq/HbEOgfWfXsGjmaAug6T8lfu/eeZa9ntJBi3u10WxpDc3AaN45L2his7h
         /J7yU8Gac11vXjAkOHJdlRqmAYvjRIL2A3cWS2B7cG9orKoM4EJKhQE8YDtENtl98XTJ
         yay13lzGsRvG7vL8YRazsw6W1DOfaYH/IC19Pn4/rl3Qpr55hso1/I9M5OqH3Vjuvkvo
         adcraBJJDtDL2FCcLkIOr9vJ9YmUbwnJ1fBqcA3zyZ9b3I0MGu9s0AbNb936lW7lyy95
         naZVn9BHuGJ6PW7GPzKNEPjBMlZDLq9pLDZ/IW0JpHcvFJe8YAMxHohDURzw4HB3WowC
         /tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772080571; x=1772685371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SS+tPAkkC8PsNpjCkuGdUmZJNCDtEH6HSFc6OXXl78=;
        b=CF3vOJsBMnaU6Ttwn4x4HW16Yf09GKr9gQPdF6rL+ZJX8EytFxhbWzMrbx5WLrdGz7
         xvQ6Xc4Q/vLnkVnKSg9wzE9ksbuJJypCxcGzzOEUXyiH35Q/j1Rc54SfJZZLwgtZ2DXr
         duVtfYy6t+OEAkIRa+wLJZpASFlqHwsDmB4H6HkHdhCONYy+Y2xQ4RBK5089Xeh8pBt9
         5DSAnXeiJtIqZlbf7ExniKeVSBIynz0TM3v6LHJC+/rnNidp0Bgtx02JT6eonP3K79HV
         1nRM8SOHErHjz3T+o/1fTL/m26Y9y8BtZVg4iiqbpargzWffxP5aIq/NwPDrdm+jKITP
         aF7w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6SGKxSsJUL8gyHZmIkfMuNNX+7s/WE4RtBUg6Ef8NMWzyn51YLetHHAa3WzoVGztBMdyVAXtj8GFjwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lauNK4q1vCJvaOHjv2bF0Yd2jeIxQqDiJTpXTeayoyc9J2Jb
	lfbH5auPnBf3BsbHNnilWw6jMir6SXvH5YXdBfhcNvin9HyoQa0QENdmqtk/6DkF4kScbpc2Le9
	X21ELqgaYZQUGeHolUXfyLNQ9bq+u97o=
X-Gm-Gg: ATEYQzz5pY8Bqb6TRAzm37NIG+GL/bNG2ipFIU9hTsV4rNACDiuMv0Fu7R7ewuDNCBO
	z4+aodqefybQIiwCgxP2LeIZDymLKnWRyHfAwF7Tccuuz0hPHoCJZH/P7Pv+PkXNWQ/qpa7JxmG
	tjkOwwkzIt25lvHPSZ3Q07PCALBrrUEkO34gXgaz333k9hrlYWL1yvvlVFf3g7kiqBed5M8M8f7
	hI5HpSuKDY58kI41rP2mhuCUlp8v/ftR3FNmXDugd36vNsSL+L7t6KMy4QTXSzNqEW6XFM2Mq0w
	3RcYOo3hrCm+lCpEVt+LgiyHeQ==
X-Received: by 2002:a05:690c:c4fa:b0:798:7498:4ad7 with SMTP id
 00721157ae682-79874984d90mr12254757b3.62.1772080571229; Wed, 25 Feb 2026
 20:36:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
In-Reply-To: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 26 Feb 2026 12:36:00 +0800
X-Gm-Features: AaiRm50kzO006Lx2eXxr-zZ4lXv2cILNCfMV8z8b79sYC54jP5X1Cub2Op14EjY
Message-ID: <CABFUUZGgnKF+C7f7yPkXybFq1KBOJNj3s73R41ru1+aGUGYUQw@mail.gmail.com>
Subject: Re: [PATCH] genksyms: Fix parsing a declarator with a preceding attribute
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 6:07=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
> with __rcu"), genksyms fails to parse the __rcu annotation when building
> with CONFIG_DEBUG_INFO_BTF=3Dy, CONFIG_PAHOLE_HAS_BTF_TAG=3Dy, and a vers=
ion
> of clang that supports btf_type_tag.

Hi Nathan,

Thanks for tracking this down and for the minimal reproducer.

I've noticed the same thing while building on my laptop during MODPOST
Module.symvers:

WARNING: modpost: EXPORT symbol "nf_nat_ftp_hook" [vmlinux] version
generation failed, symbol will not be versioned.
Is "nf_nat_ftp_hook" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "nf_nat_irc_hook" [vmlinux] version
generation failed, symbol will not be versioned.
Is "nf_nat_irc_hook" prototyped in <asm/asm-prototypes.h>?

>
> diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
> index efdcf07c4eb6..cabcd146f3aa 100644
> --- a/scripts/genksyms/parse.y
> +++ b/scripts/genksyms/parse.y
> @@ -325,8 +325,8 @@ direct_declarator:
>                 { $$ =3D $4; }
>         | direct_declarator BRACKET_PHRASE
>                 { $$ =3D $2; }
> -       | '(' declarator ')'
> -               { $$ =3D $3; }
> +       | '(' attribute_opt declarator ')'
> +               { $$ =3D $4; }
>         ;
>

Your grammar tweak to allow an optional attribute before the nested
declarator looks correct to me.

Best regards,
Sun Jian
