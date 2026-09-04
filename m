Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E03CF05E
	for <linux-kbuild@vger.kernel.org>; Fri,  4 Sep 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531823; cv=pass; b=Iu5/aZ5MiPBW78dblw244WTc+DcyeEmF/xhtLGyT+4exB5s2zUQSyfNVEMwsA018K+0C9/mnevRrdu5Gzz3fL3wQuj+H7Hd40aKzO+Ao0yIVxXSbheZwHo8WSIOOTRYvfZbuq3iLxf02u5Pze0npIfXHuCq0FVgWdlUyvaCubyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531823; c=relaxed/simple;
	bh=DqWYMz6T6MwhxfrR8L63T0AJfuhb70RVs8VbzlNN7CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xzrgzc1o9YcHyzj2HAIzRGpi6KXp2t8Phs39Hflk7B8wa5yaaX1SNmHiRRDy+JJydVEeZoIIl9A6EHR/DnAx2KzcDTOiYnPYDLAMsfBhiXxcQMJNXB4CgYTXpqBYOXwVafJl50iEHfxuOsFYk5v2NO4C77BZMcu71Bg1kmwAYy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE+m1Uz7; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE+m1Uz7"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed444so90412a91.1
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Sep 2026 07:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788531821; cv=none;
        d=google.com; s=arc-20260327;
        b=hMgbMBQeh51AGls88dvs9uXf+M4zceeQ6LewnX9dik7oihlKScgtK7jXxBpjOwGn28
         S9UXWcq4A1xvRkxH7zapuwptYIHZKYw5Vbhfj9Bn8QM4nrhbiKO9ncKjTBRi3cM31K1w
         N0tKKctbPrgxX1ZBym9wH0gFzyH/BLYUHCmo06vBP6EwnCrpdgtMKvNWSVv0J11+M/Yx
         mUXGYPX3qpq8I76TNNHgJcuvlnlBGP9AjRXNgcbgUdKTmagLXmIktbfEBXwWz7CEx/fj
         cTtLxZfSZ100JIx7vKDmL2igQf2iVdt32UtXuI+Vx7M4FhSzWBdIE2zMpP4cjk48ZnWv
         7LZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        fh=+sLeqJTP+B3E5aVi36wyEQ4o5e/dfTImXty9573EOHM=;
        b=jzR3PjEJkNOM7LG/CR6Wd7fUTdbvH8EbsICXH4y7YN78TPaaPMv0dBhiX/uo7x3xvX
         HDMeTMAMRowOcgGzxrIz1O3UPfS3Ch6ShM2tpRi/w4uGAwE6XSagEtQxDugJZirG6VKX
         FNNUHACD1O32B5dyiaO8IKNMCd3XpxDLeM5mv7aLreFMPWdHnZ/2rVM7NtUgJQR8k3JZ
         OVercFmjde4NpQUVwj5F9uYpPaJePGrcqsmmYrtd0LkcghX4Sp7j8m8j8VYJJFkqr1rN
         2+sBP+LIT7jRpG9fNCVpNsirBGBiR0nNWkbofDUhQdxipaE+B3MQQnxi/3Wr9SVYCxG1
         OU/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788531821; x=1789136621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        b=SE+m1Uz7YHhKdLgyFemVCPJwdWmGT+jX73T1cZfJ3v6kaRe5prDNO6LFrnVTT/41Ou
         Vq0SnmCnjhbD9VNtru7qb74ZSgqnW+3a/qMP8/U+8ZcJ3jZSjKJ//2rU4m4mSKEDMxZf
         50J40VySG824d5qo7w+oa/si5Q9x4Rhd1s/c0R8K6RYBPZ9gpvvxiOH3UxjPYM+Nhsi2
         Xs3t9oznZmgOG83M9btaGT5SJpgTTYda9gx9dJxND8HMJg5+FjMTC5/Ct2T2Q08R4x+d
         E9BEyH28d31OsSLgygbiglEiOO43OYIugDISmAJ9O1ZRXMpsk/Zoc1qj+lv5GCbCVNr5
         5+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531821; x=1789136621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        b=qcWFBinU/Z7osJy3MB4xL09UANaPZ2/VnUnGmLHNXwzeq9Dly/uXZ0Cq86J98dRYwT
         eMqm6vAF5cLsM9iDuhnd6r/kXMAHmZv/BSAIZ98mV4OWOjrMpHqSiZmVYFvC++qoy7Vb
         iRTBuCeTs3Bv9PDuCiwtzUZAeRq7pwpOTKdBBl+krwdowlhK9oI+x/hh+neaZe4QtcKb
         jNOQ8oLJ1GvImRSLH20aU+gwN852fKwYqHsYfTOG612WUZhOdpxXdYnVkiF+TfOBlDpj
         wDU6EZZd27ytU2tBFL2pav8kSC9mEtzTT8OnsF2ciOUhRcMd73Ngl3LdL6mcIEALKYGO
         zb2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIvllXdfKpes3X6bEvj20K5XXaQ6jrMS2Bi/74H3GKCey7RU1rEIPwdNmVe0O9qG3bViw3SIG28bKZsXs=@vger.kernel.org
X-Gm-Message-State: AFuF++kW1C4ZHCWi5H8qsQ8fq2bShzSqqVXtQmIUNxhKjTzrgK7YpM7d
	BMrH3xz6CvRlCgPVEIS/gsvIR59cq51OOQw+GmCP0LeUOwjoGK/h0hU0VGfwzOkr9RotQVEZed2
	IsIXewS7iJUe/qN6LIofdoUoidcnFVLw=
X-Gm-Gg: AYBFou27/oLfTnV9QrKqSUrB69VJWvWw0/JbVJEuv/Wm5p4njv5JN64kt4Wrdh0yh/0
	1M3RMgGML8Jtt48S4wpE9i1/BWiUA5LES3AvhYyNTe0OylZbozCGOSXvAE+zP6W4VhEY4Mu/JOh
	BX4IaXGVQoRwIaekRxmZkjVekqb7gkN+IxJUprswr8P+SQePV0+8pWzqyP7y/GUYAsjoSM0liS/
	aFNi25tlJ+2F9wom6u1Dj1lzoflGKb6Kc8iLa0Cnjxr757iEd+SUykivoZiOMOGOWV6A50UexaX
	VzlQ0R/JNalvcsQ4mnUMnmc1HgtpiXcSP1QRibBr2j4LeVWcKw7WJL9Xi/OTTJ7346vwFpvytS0
	+AGw8HtnPj1HkFa3tufKq97twJHKwlfcCRf3u6y5dsSTaDD7b/ve6elpcZM2Yjrbtgkj05Y8=
X-Received: by 2002:a17:90b:3bcf:b0:396:d27c:8696 with SMTP id
 98e67ed59e1d1-39b2693597emr6435720a91.4.1788531820989; Fri, 04 Sep 2026
 07:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904122002.27960-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904122002.27960-1-hemanth.selam@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 16:23:28 +0200
X-Gm-Features: AcwNN1WTRRMr7Y3iQTAP8AzxwhPX7ZjceOE95KyFxklhpavQwwkWcnNoQDcihuo
Message-ID: <CANiq72=QNpuvP01TfXEkjj4i7p4QU5WGj4mjHjrKyrUMsjEwWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix typo "funtions" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:11=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Correct "funtions" to "functions", reported by scripts/checkpatch.pl usin=
g
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Welcome! I noticed this one in my spam folder.

But, yeah, it looks wrong:

Fixes: 5270316c9fec ("kbuild: Use -fmin-function-alignment when available")

Thanks!

Cheers,
Miguel
