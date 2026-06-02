Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748C3DA7C6
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405320; cv=none; b=oCT3blMDq7T5EXy4mRncEWG/eD5/FG6nkm29lzEJH/gyX/sBcBojIHBZUTvlNPYUaowxHaq9yHr7Q9YAP2BLVk77YudFsR4LmgCalSqq2SRizzNKljSoKDXUP6uQ134WCNjPpnF9f98riBOU2x8f4aT9/2wPLhA0QAoKM9f79OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405320; c=relaxed/simple;
	bh=wy4gIOydRpO6s3iFU1d8SQh6mOIBTW0h92HSL4dWBEM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHLQh93xmNPXOM2pDpdeW/jHtGTzdWaJK9CM4cmOWKEBypxWNa8c6frqaYJbQgSN7Ox+9pjzr/wEfxEpTykULhlSIWKUakKbnWWqLVw1Y7+dq+KjeBbn/KtCiENO8lugwlw+hPD5aEcMKAY0mcdZw1ENiv8hoxXHb7FzvJJ9tRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QM2Jrtda; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM2Jrtda"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so9773995e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405318; x=1781010118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6PZomB4fY5kFt4EpZT9MLtSi3pU0QOKrZbirr7Htn4=;
        b=QM2JrtdaXhtUMLw41xvphSbgN5rnwiYLkL90LPtDET6S27m4aS7/yxkwJ2UOLderT2
         EGin63s+U0TfDGNe7bcInA3qmGgjaIzalh5sEuIl2NVGHc+fs4QO0uyptFnxwTgR9hMM
         BckKLCbif6DedQ4bIzCHtM2LE5Yk68GqksLDgbPnGUENsl2kC6auQo+l3XpE8hpCnctm
         paa7tx73WezO/MELpkA3RePWTF4F65e92jlFwni2A0aAf9mB2sn5L8KD5kaUpmmcp1E0
         qU+iWRM/UYnhX3aV0qeHq7gUP/+xfmA7Gt67yJtSXKcS3z98XP7r5apblCtVsOo55EG7
         tgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405318; x=1781010118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6PZomB4fY5kFt4EpZT9MLtSi3pU0QOKrZbirr7Htn4=;
        b=Fzlzd1bBlwt0dbvkoodkEWdhJ3e3GMkPOStbi64vtcwgp7VUEBwItrEMAf2h+BjerW
         gdXZfSjZEPN/6+kNeFyMTdLy6V21LKBhWcZXgEq8dLg/WxAerbaenZmsthrKBdnJ95AD
         VtmTZujb6sPteoeMfRp9Z7dm2TyFxr5C7SqIrCA9nbY7b4bhQAykmO2D/B5T8sTxnV6A
         wTNpK6PbftXkF8cffcfc5jyrUXVMdK2JXoMbRng8F0mqWZFCEFHSYZdbLTW8sAUNIUtb
         YCQSOp3mrciNEdd3uGYMS6ePCCT6/8fCDrD0/kFaqg4goGRuxFFwm5az+oyyPl7Ucj1L
         QtTA==
X-Forwarded-Encrypted: i=1; AFNElJ+wCSswdvUgd9xDpCq+15RaQOkBY3gwnItHq4oWzp+gUx5GvMcO5t/lZiRshOPr+HCrvSNVR5Vy7E05kkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKiWXNc+z1MY4wnyv7KXdO7G8j8qSYpyU1Rp4yPqEBql/ORdwf
	3zyK8l98oHZxLOGQopgW5YrTAlFyCVZeRmIwJ+80kYbeoKMZILTELv9SrscI0w==
X-Gm-Gg: Acq92OGZBT438WN7QaMDsv5HbM5ZPBtKWUqHHb4gt4d/scSFaQet76wd+Wd3VEelQd5
	/reMwmz4ol6ozjrTYOiQ9gbRSPO8m2JvYmLXh/TY+9M8guxb/peYBliRlAsIiLHiovJDBWaVxSe
	Oik/P4e752WrL5eA8U7jW+P1nLhv/YP0mDzAWKQNlWTvUde0tP7ZwKBfziQcoctAJywf7paXmPx
	PmKp8zlfRDKwV7MyrXB87B3U11Ye5ZwXJXwKgcd3aBjcIXXg9Y/uuOMc2M2xoQfSz8gOghrZITH
	Y8eEsKH70sa0AiEPsjKl+tfFLm/SpZwU/g8Y9xI6zuE5oY95PJwWDWnrhn35qmjDZODF/MId5h0
	AX+VyTcOVfu1xIuOjH0ed/4obRrLGL5wcoymzUmswGlOzbpkSiHtWeOxgFOs02FuGzhWvtYQCXC
	k9XlmzodAOsAFWeKevfH0oKLGwyM0=
X-Received: by 2002:a05:600c:a305:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490a29302c1mr223088765e9.8.1780405317292;
        Tue, 02 Jun 2026 06:01:57 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354bb62sm31719189f8f.19.2026.06.02.06.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:01:56 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jun 2026 15:01:54 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 05/14] resolve_btfids: Index BTF ID symbols
 by address
Message-ID: <ah7UQv87CmJ-LNMt@krava>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-6-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601221805.821394-6-ihor.solodrai@linux.dev>

On Mon, Jun 01, 2026 at 03:17:56PM -0700, Ihor Solodrai wrote:

SNIP

> +static int push_addr_sym(struct object *obj, Elf64_Addr addr, const char *name)
> +{
> +	struct addr_sym *arr = obj->addr_syms;
> +	int cap = obj->max_addr_syms;
> +
> +	if (obj->nr_addr_syms + 1 > cap) {
> +		cap = max(cap + 256, cap * 2);
> +		arr = realloc(arr, sizeof(*arr) * cap);
> +		if (!arr)
> +			return -ENOMEM;
> +		obj->max_addr_syms = cap;
> +		obj->addr_syms = arr;

could you use libbpf_ensure_mem instead?

> +	}
> +
> +	obj->addr_syms[obj->nr_addr_syms].addr = addr;
> +	obj->addr_syms[obj->nr_addr_syms].name = name;
> +	obj->nr_addr_syms++;
> +
> +	return 0;
> +}
> +
> +static int cmp_addr_sym(const void *a, const void *b)
> +{
> +	Elf64_Addr aa = ((const struct addr_sym *)a)->addr;
> +	Elf64_Addr ab = ((const struct addr_sym *)b)->addr;
> +
> +	if (aa < ab)
> +		return -1;
> +	if (aa > ab)
> +		return 1;
> +	return 0;

nit, I recently spot following pattern:

        return (aa > ab) - (aa < ab);

jirka

> +}
> +
> +static const char *find_name_by_addr(struct object *obj, Elf64_Addr addr)
> +{
> +	struct addr_sym key = { .addr = addr };
> +	struct addr_sym *res;
> +
> +	res = bsearch(&key, obj->addr_syms, obj->nr_addr_syms,
> +		      sizeof(*obj->addr_syms), cmp_addr_sym);
> +	return res ? res->name : NULL;
> +}

SNIP
