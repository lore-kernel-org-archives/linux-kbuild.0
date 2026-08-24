Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A803F3285
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 12:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574414; cv=none; b=G2VgiX6eGh+4CigiIN6IUvccN2RPAocAtqmp5aoSl3JOMTf+ivbODWqAz5KdUlzsEGrXWi9vLWlobQSbgNECQDj4NH76wzSh9hzolnBd1ODOEV85P7YrZO+T8UkmTXjaufhj1b8iwoulz+zgpQ23xGRHpIO/ImFoYOOVcrziAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574414; c=relaxed/simple;
	bh=hzUjK7CL9pf1gwlU02Sq8tZVe94A5FE5DFeDZhztTd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKc/XB7twvRYXI4PJUQzMW9KlazysQr1t8mPUu2xz6SROHZkiYLqCc04SrJ3zt/B7RwrfRoTHJ2LncNXy2b2Br/sjjevbkxBCjL7BjGLLlh2Fe2WkYHMkRLxfbiIhfR5cnC5Nz8vtQLdOZvux2akvu1V3QpBOL16vMH9zheEt6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1310908e0c.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 05:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574411; x=1788179211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99NfZ0WStZf4rq4lKcbEk8ievxJm5E/AaadAduPs2+s=;
        b=Ly04gQ5R1wjWfJNZLpaC3is13Achw/ZPkkYN7b8dY7bu91iVjnHyG1gPyeAILPTNpF
         aNZLbLtiP72osGxfztx9wA8bBCjmKBLF5Py33o/qfZ2AxHtBQvqY5Xt3ckrVDLc1jjyz
         ObEaNU5QQoxnxcbiH6ueBrcmp2nGwuupPa6P720VyqBoAUo90iQ+pFcEPDK+6spt1Rem
         v6/xYJTE7Ab7qrRiPdsZiU0jhs2/5mcEGPagxnNHcMxcD2zCAaNsWg49H1L6kgIYolfa
         Nq8sNfnxZwV+X9Y34uY6O3ZtJQ3wykL5V/aRXoOh91gsx99ixC8qSPot1cQB4GmrCJqr
         mXeA==
X-Forwarded-Encrypted: i=1; AHgh+RoKXLhnfmHkbm1vhljTR58eBmn+m2hm8dNgzPZwaEw/QiqN0wXqXXilWRViQMOgsWAL7HZOk/eebtsxBnY=@vger.kernel.org
X-Gm-Message-State: AFuF++nKDKPy6O6jE9xxD/Xn2BfJS6cl6nMUFeeBfjR+Oa24uW9PJ7uA
	8s8zv15mrzxT8FVl6bFAEu2jdy7UbmukgLZqiv3ja5/2KzdCBZPUCLyoWdReP1Py
X-Gm-Gg: AR+sD11t8QR819/6QWtR4YnkOwvo0oduIAKbrvpdbIwbzlWzeu2nc64c5qb0HpMhKo5
	aOR3ucInkwj2o+qPakZ+OecUqyWBclr/sY8si1Enf2FduR9MLjhB8oTH2C+l0z3OB8ZliORg6u9
	YHlWbUdK8iRBAtIyBge5aZWyTUbm8hoJMatFsOU/+y6L2e0CHOwRqOtihZv7SdkZl+UUZLvS3bz
	cuvw6bHgP+7MAxolCaeRK2ljC3ct3GH6/UwMytGmTjNK/hQIN6Wr4qKfP+ps2c0NkwRR9iRvN6U
	Eq0cwGOvwfYG0Kirm/zJCJ1o/Kb2ViN3UYSfZgYQv4eiZQbG2irXmmxFnUxZlETU308oC2mOyrK
	cO7SkHzduzkdxSc9sgP1ZUKQPtqC1WQdx8/xYta1ph2ARG38n5yeqF0styiM8tVrv2h4qxNkr9D
	zh4DgF29VLy5ypyIITqg2xTu6MheDhgDS3wu1014O4CFND+ZGCQez0HHqM8qoinkdFiisMgEfOL
	iRvVIxa0SEw6sSySWFFi1M/KvC2zunSiMUOCuV93RVrEgMW
X-Received: by 2002:a05:6122:488f:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c5ff7bc547mr9863851e0c.3.1787574410953;
        Mon, 24 Aug 2026 05:26:50 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c6238a66cdsm3418344e0c.0.2026.08.24.05.26.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:26:50 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-77bf892b496so405527137.0
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 05:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEjKd2S6jHnzRDL0lqUvKR0G80FVexQpY42gVvawVkmvvW/hzzeZoR0+OjWUWvpZ9YauPP01VIaDspWeM=@vger.kernel.org
X-Received: by 2002:a05:6102:6c1:b0:777:50f1:c202 with SMTP id
 ada2fe7eead31-77a64b67f1fmr9134464137.10.1787574409167; Mon, 24 Aug 2026
 05:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org> <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
In-Reply-To: <20260728-linux-kallsyms-fix-v1-1-1a665156c898@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:26:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
X-Gm-Features: AcwNN1Uyh2OUI4gHQ2gXUR2MMIqo1XxoBetkGEdz0l1KxOOuYsUn6EHFkvKpS3c
Message-ID: <CAMuHMdWEzs=+vuV0oX+v2WVukHNg+o5FspczHyZggY4ADHJKqA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: add symbol size for kallsyms symbols that
 can change size
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Guenter Roeck <linux@roeck-us.net>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 28 Jul 2026 at 14:52, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
> Add symbol size for kallsyms symbols that can change size so that sizes
> can be determined easily without having to manually calculate them
> when inspecting the object files (.tmp_vmlinux?.kallsyms.o or
> .tmp_vmlinux?). Without, the assembler records the symbol size as 0.
>
> This is primarily useful as a debugging aid in case of linker errors as
> part of link-vmlinux.sh, and because symbol size doesn't have to align
> with the offset to the next symbol due to padding/alignment.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Thanks for your patch, which is now commit d6bf11a7e8a86135 ("kallsyms:
add symbol size for kallsyms symbols that can change size") upstream.

FTR, this commit has a huge impact on kernel size, according to
bloat-o-meter:

    $ bloat-o-meter vmlinux.{old,}
    add/remove: 4/0 grow/shrink: 0/0 up/down: 440264/0 (440264)
    Function                                     old     new   delta
    kallsyms_names                                 -  324543 +324543
    kallsyms_offsets                               -  114424 +114424
    kallsyms_token_table                           -     849    +849
    kallsyms_markers                               -     448    +448
    Total: Before=3D5085496, After=3D5525760, chg +8.66%

However, this seems to be totally bogus, and thus a false-positive:

    $ size vmlinux.{old,}
       text   data    bss    dec    hex filename
    4520823 1507876 154960 6183659 5e5aeb /tmp/vmlinux.old
    4520823 1507876 154960 6183659 5e5aeb /tmp/vmlinux
    $ ls -l vmlinux.{old,}
    -rwxrwxr-x 1 geert geert 7922796 aug 24 14:18 /tmp/vmlinux.old*
    -rwxrwxr-x 1 geert geert 7922796 aug 24 14:19 /tmp/vmlinux*

I also see no change in memory consumption after boot-up, so everything
is good...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
